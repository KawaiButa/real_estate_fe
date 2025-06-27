import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/review.dart';
import 'package:real_estate_fe/ui/views/review/review_viewmodel.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_avatar_circle/custom_avatar_circle.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_list_view/custom_list_view.dart';
import 'package:stacked/stacked.dart';
import 'package:velocity_x/velocity_x.dart';

class ReviewView extends StackedView<ReviewViewModel> {
  final Property property;
  const ReviewView({Key? key, required this.property}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    ReviewViewModel viewModel,
    Widget? child,
  ) {
    final scrollController = ScrollController();
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
              scrollController.position.maxScrollExtent - 100 &&
          viewModel.canLoadMore &&
          !viewModel.isFetchingReviews) {
        viewModel.fetchMoreReviews();
      }
    });

    return BasePage(
      backgroundColor: AppColors.background,
      showAppBar: true,
      title: "Reviews".tr(),
      body: Column(
        children: [
          _FilterSection(viewModel: viewModel),
          Expanded(
            child: CustomListView(
              dataSet: viewModel.reviews,
              isLoading: viewModel.isBusy,
              scrollController: scrollController,
              padding: const EdgeInsets.only(bottom: 16),
              refreshController: RefreshController(),
              itemBuilder: (context, index) {
                if (index == viewModel.reviews.length) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                        child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation(
                                AppColors.primaryColor))),
                  );
                }
                final review = viewModel.reviews[index];
                return ReviewItem(
                  review: review,
                  viewModel: viewModel,
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  ReviewViewModel viewModelBuilder(BuildContext context) =>
      ReviewViewModel(property: property);

  @override
  void onViewModelReady(ReviewViewModel viewModel) {
    viewModel.initialise();
  }
}

class _FilterSection extends StatelessWidget {
  final ReviewViewModel viewModel;
  const _FilterSection({required this.viewModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues(alpha: 0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Sort By and Has Media row
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<SortReviewBy>(
                      isDense: true,
                      value: viewModel.activeFilters.sortBy,
                      icon: Icon(Icons.sort, color: AppColors.primaryColor),
                      items: SortReviewBy.values.map((sort) {
                        String text;
                        switch (sort) {
                          case SortReviewBy.mostRecent:
                            text = 'Most Recent';
                            break;
                          case SortReviewBy.highestScore:
                            text = 'Highest Score';
                            break;
                          case SortReviewBy.lowestScore:
                            text = 'Lowest Score';
                            break;
                          case SortReviewBy.mostHelpful:
                            text = 'Most Helpful';
                            break;
                        }
                        return DropdownMenuItem(
                          value: sort,
                          child:
                              Text(text, style: const TextStyle(fontSize: 14)),
                        );
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) viewModel.setSortBy(value);
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                FilterChip(
                  label: const Text('Has Media'),
                  selected: viewModel.activeFilters.hasMedia == true,
                  onSelected: (_) => viewModel.toggleHasMediaFilter(),
                  checkmarkColor: Colors.white,
                  selectedColor: AppColors.primaryColor,
                  labelStyle: TextStyle(
                    color: viewModel.activeFilters.hasMedia == true
                        ? Colors.white
                        : AppColors.textColor,
                  ),
                  backgroundColor: Colors.grey[200],
                  showCheckmark: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 4),
          // Score Filter
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Score:',
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                Wrap(
                  spacing: 6.0,
                  children: List.generate(5, (i) {
                    final score = 5 - i;
                    return ChoiceChip(
                      label: Text('$score ★'),
                      selected: viewModel.activeFilters.score == score,
                      onSelected: (_) => viewModel.setScoreFilter(
                        viewModel.activeFilters.score == score ? null : score,
                      ),
                      selectedColor: AppColors.primaryColor,
                      labelStyle: TextStyle(
                        color: viewModel.activeFilters.score == score
                            ? Colors.white
                            : AppColors.textColor,
                        fontSize: 12,
                      ),
                      backgroundColor: Colors.grey[200],
                    );
                  }),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          // Tags Filter
          if (viewModel.availableTags.isNotEmpty)
            SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                itemCount: viewModel.availableTags.length,
                itemBuilder: (context, index) {
                  final tag = viewModel.availableTags[index];
                  final isSelected =
                      viewModel.activeFilters.selectedTags.contains(tag);
                  return FilterChip(
                    label: Text(tag),
                    selected: isSelected,
                    onSelected: (_) => viewModel.toggleTagFilter(tag),
                    checkmarkColor: Colors.white,
                    selectedColor: AppColors.primaryColor,
                    labelStyle: TextStyle(
                      color: isSelected ? Colors.white : AppColors.textColor,
                      fontSize: 12,
                    ),
                    backgroundColor: Colors.grey[200],
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 6),
              ),
            ),
          if (!viewModel.activeFilters.isDefault)
            Padding(
              padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 4.0),
              child: ActionChip(
                avatar:
                    Icon(Icons.clear, size: 16, color: AppColors.primaryColor),
                label: const Text('Clear All Filters'),
                onPressed: viewModel.clearFilters,
                backgroundColor: AppColors.primaryColor.withValues(alpha: .2),
              ),
            ),
          const Divider(height: 1, thickness: 1, color: Colors.black12),
        ],
      ),
    );
  }
}

class ReviewItem extends StatelessWidget {
  final Review review;
  final ReviewViewModel viewModel;

  const ReviewItem({
    Key? key,
    required this.review,
    required this.viewModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd();
    final bool isOwner =
        viewModel.isPropertyOwner; // Check if current user is property owner
    // This is a simplified check.
    // In a real app, this might depend on the specific property/context.

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      elevation: 2.0,
      color: AppColors.cardBackground,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (review.reviewer != null)
                  CustomAvatarCircle(user: review.reviewer!),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        review.reviewer?.name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: AppColors.textColor),
                      ),
                      Row(
                        children: [
                          ...List.generate(
                            5,
                            (index) => Icon(
                              index < review.rating
                                  ? Icons.star
                                  : Icons.star_border,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            dateFormat.format(review.createdAt),
                            style: const TextStyle(
                                fontSize: 12, color: AppColors.subTextColor),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Html(
              data: review.reviewText,
            ),
            if (review.images.isNotEmpty) ...[
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: review.images.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.network(
                          review.images[index].url,
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 100,
                            height: 100,
                            color: Colors.grey[200],
                            child: const Icon(Icons.broken_image,
                                color: AppColors.subTextColor),
                          ),
                          loadingBuilder: (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 100,
                              height: 100,
                              color: Colors.grey[200],
                              child: Center(
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation(
                                      AppColors.primaryColor),
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes!
                                      : null,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
            const SizedBox(height: 8),
            Divider(color: Colors.grey[300]),
            // Actions: Helpful, Reply
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                  icon: Icon(
                    review.hasVoted
                        ? Icons.thumb_up_alt
                        : Icons.thumb_up_alt_outlined,
                    color: review.hasVoted
                        ? AppColors.primaryColor
                        : AppColors.subTextColor,
                    size: 20,
                  ),
                  label: Text(
                    'Helpful (${review.helpfulCount})',
                    style: TextStyle(
                      color: review.hasVoted
                          ? AppColors.primaryColor
                          : AppColors.subTextColor,
                      fontSize: 13,
                    ),
                  ),
                  onPressed: () => viewModel.toggleHelpful(review.id),
                ),
                if (isOwner && !review.isComposingReply)
                  TextButton.icon(
                    icon: Icon(Icons.reply,
                        color: AppColors.primaryColor, size: 20),
                    label: Text('Reply',
                        style: TextStyle(
                            color: AppColors.primaryColor, fontSize: 13)),
                    onPressed: () => viewModel.startComposingReply(review.id),
                  ),
              ],
            ),
            ...review.responses
                .map((e) => _OwnerResponseWidget(response: e).p12()),
            if (isOwner && review.isComposingReply)
              _OwnerReplyInputWidget(
                viewModel: viewModel,
                reviewId: review.id,
              ),
          ],
        ),
      ),
    );
  }
}

class _OwnerResponseWidget extends StatelessWidget {
  final ReviewResponse response;
  const _OwnerResponseWidget({required this.response});

  @override
  Widget build(BuildContext context) {
    final dateFormat = DateFormat.yMMMd();
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withValues(alpha: 0.05),
        borderRadius: BorderRadius.circular(6),
        border:
            Border.all(color: AppColors.primaryColor.withValues(alpha: 0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Response from owner',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.primaryColor,
                fontSize: 14),
          ),
          Text(
            dateFormat.format(response.createdAt),
            style: const TextStyle(fontSize: 11, color: AppColors.subTextColor),
          ),
          const SizedBox(height: 6),
          Text(
            response.responseText,
            style: const TextStyle(fontSize: 13, color: AppColors.textColor),
          ),
        ],
      ),
    );
  }
}

class _OwnerReplyInputWidget extends StatelessWidget {
  final ReviewViewModel viewModel;
  final String reviewId;

  const _OwnerReplyInputWidget({
    required this.viewModel,
    required this.reviewId,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          TextField(
            controller: viewModel.getReplyController(reviewId),
            decoration: InputDecoration(
              hintText: 'Write your response...',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 1.5),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              isDense: true,
            ),
            textCapitalization: TextCapitalization.sentences,
            maxLines: 3,
            minLines: 1,
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                child: const Text('Cancel',
                    style: TextStyle(color: AppColors.subTextColor)),
                onPressed: () => viewModel.cancelComposingReply(reviewId),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                child: const Text('Send Reply'),
                onPressed: () => viewModel.submitOwnerResponse(reviewId),
              ),
            ],
          )
        ],
      ),
    );
  }
}
