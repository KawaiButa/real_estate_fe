import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/tourview.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';

import 'tourview_viewmodel.dart';

class TourviewView extends StackedView<TourviewViewModel> {
  const TourviewView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    TourviewViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      showAppBar: true,
      title: "Tourview",
      appBarColor: AppColors.primaryColor,
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: viewModel.tourRooms.length,
        itemBuilder: (context, index) {
          final tourRoom = viewModel.tourRooms[index];
          return Card(
            elevation: 2.0,
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: ListTile(
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  tourRoom.image!.url,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 80,
                    height: 80,
                    color: AppColors.grey.withOpacity(0.3),
                    child: Icon(Icons.broken_image, color: AppColors.grey),
                  ),
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return SizedBox(
                      width: 80,
                      height: 80,
                      child: Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
              title: Text(
                tourRoom.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.visibility, color: AppColors.primaryColor),
                    onPressed: () => viewModel.viewTour(tourRoom),
                    tooltip: 'View Tour',
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: AppColors.red),
                    onPressed: () =>
                        _showDeleteConfirmation(context, viewModel, tourRoom),
                    tooltip: 'Delete Tour',
                  ),
                ],
              ),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
              onTap: () => viewModel
                  .viewTour(tourRoom), // Allow tapping the whole item to view
            ),
          );
        },
      ),
      fab: FloatingActionButton.extended(
        onPressed: viewModel.createNewTour,
        icon: const Icon(Icons.add, color: Colors.white),
        label: const Text('Create Tourview',
            style: TextStyle(color: Colors.white)),
        backgroundColor: AppColors.primaryColor,
        elevation: 6.0,
      ),
      fabLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<void> _showDeleteConfirmation(
      BuildContext context, TourviewViewModel viewModel, Tourview room) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Confirm Deletion'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to delete "${room.name}"?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel', style: TextStyle(color: AppColors.grey)),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: Text('Delete', style: TextStyle(color: AppColors.red)),
              onPressed: () {
                viewModel.deleteTour(room);
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        );
      },
    );
  }

  @override
  TourviewViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      TourviewViewModel();
}
