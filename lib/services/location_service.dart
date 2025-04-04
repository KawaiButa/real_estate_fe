import 'package:dartx/dartx_io.dart';
import 'package:dio/dio.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:real_estate_fe/models/location.dart';
import 'package:stacked/stacked.dart';

class LocationService with ListenableServiceMixin {
  LatLng? currentPosition;
  String? currentAddress;
  List<String> provinces = [];
  final Dio _dio = Dio();
  LocationService() {
    listenToReactiveValues([currentPosition, currentAddress]);
  }

  Future<List<Location>> searchLocation(String query) async {
    if (query.isEmpty) {
      return [];
    }

    try {
      // Construct the API URL
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/search?q=$query&format=json');
      // Make the HTTP request using Dio
      final response = await _dio.get(url.toString());

      // Check the response status code
      if (response.statusCode == 200) {
        // Parse the JSON response
        final List<dynamic> data = response.data;
        // Map the JSON data to Location objects
        return data
            .map((json) => Location(
                point: LatLng(json["lat"].toString().toDouble(),
                    json["lon"].toString().toDouble()),
                address: json["display_name"]))
            .toList();
      } else {
        throw Exception('Failed to fetch locations: ${response.statusCode}');
      }
    } catch (e) {
      print('Error during search: $e'); // Important: Log the error.
      return [];
    }
  }

  Future<LatLng?> getCurrentLocation({autoSave = true}) async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled, return an error
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permission is denied, return an error
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permission is denied forever, return an error
      throw Exception(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Get the current position
    final position = (await Geolocator.getCurrentPosition());
    if (autoSave) {
      currentPosition = LatLng(position.latitude, position.longitude);
      currentAddress = await getAddressFromCoordinates(
          currentPosition?.latitude ?? 0.0, currentPosition?.longitude ?? 0.0);
    }
    notifyListeners();
    return LatLng(position.latitude, position.longitude);
  }

  changeSelectedLocation(LatLng point) {
    currentPosition = point;
    notifyListeners();
  }

  // Method to get the Vietnamese provinces from the API
  Future<List<String>> getVietnameseProvinces() async {
    final response = await _dio.get('https://provinces.open-api.vn/api/p/');

    if (response.statusCode == 200) {
      // If the server returned a 200 OK response, parse the JSON
      List<dynamic> data = response.data;
      // Extract the province names from the data
      provinces = data.map((item) => item['name'].toString()).toList();
      notifyListeners();
      return provinces;
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load provinces');
    }
  }

  // Method to get the address from coordinates using Nominatim
  Future<String> getAddressFromCoordinates(double lat, double lng) async {
    final url =
        'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=$lat&lon=$lng';
    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      // If the server returned a 200 OK response, parse the JSON
      Map<String, dynamic> data = response.data;
      // Extract the address from the data
      return data['display_name'] ?? 'Address not found';
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load address');
    }
  }

  Future<LatLng> getGeolocationFromAddress(String address) async {
    final url =
        'https://nominatim.openstreetmap.org/search?format=json&q=${Uri.encodeComponent(address)}';
    final response = await _dio.get(url);

    if (response.statusCode == 200) {
      // If the server returned a 200 OK response, parse the JSON
      List<dynamic> data = response.data;
      if (data.isNotEmpty) {
        // Extract the latitude and longitude from the first result
        final double latitude = double.parse(data[0]['lat']);
        final double longitude = double.parse(data[0]['lon']);
        return LatLng(latitude, longitude);
      } else {
        throw Exception('Address not found');
      }
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load geolocation');
    }
  }
}
