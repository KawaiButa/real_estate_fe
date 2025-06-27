import 'dart:math';

import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/services/ai_service.dart';
import 'package:stacked/stacked.dart';
import 'package:real_estate_fe/models/property.dart'; // Your Property model
import 'package:flutter/foundation.dart';

class AiResultViewModel extends BaseViewModel {
  final List<Property> properties;
  final aiService = locator<AiService>();
  AiResultViewModel(this.properties);

  String? _aiResponse;
  String? get aiResponse => _aiResponse;
  bool get showComparisonTable => properties.length > 2;

  // --- NEW ---
  /// Mocks the distance from a central point (e.g., user location).
  /// Replace this with your actual distance calculation logic.
  /// It uses hashCode for a consistent-per-property mock value.
  double getMockDistanceInKm(Property property) {
    // You would fetch user location and property coordinates here.
    // For now, use a simple, repeatable "random" value.
    final randomSeed = property.id.hashCode;
    return (Random(randomSeed).nextDouble() * 15) +
        1.0; // Returns 1.0 to 16.0 km
  }

  // Called when the ViewModel is ready
  Future<void> initialize() async {
    await _fetchAiResult();
  }

  Future<void> _fetchAiResult() async {
    setBusy(true);
    clearErrors();

    try {
      if (properties.length == 1) {
        _aiResponse = await aiService.analyzeProperty(properties.first);
      } else {
        _aiResponse = await aiService.compare(properties);
      }
    } catch (e) {
      setError(
          "Oops! We couldn't generate AI insights right now. Please try again later.\nError: ${e.toString()}");
      if (kDebugMode) {
        print("AI Fetch Error: $e");
      }
    } finally {
      setBusy(false);
      notifyListeners();
    }
  }
}
