import 'package:real_estate_fe/app/app.locator.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/models/review.dart';
import 'package:real_estate_fe/services/auth_service.dart';
import 'package:real_estate_fe/services/review_service.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';
import 'dart:async';

enum SortReviewBy { mostRecent, highestScore, lowestScore, mostHelpful }

class ReviewFilters {
  bool? hasMedia;
  int? score;
  List<String> selectedTags;
  SortReviewBy sortBy;

  ReviewFilters({
    this.hasMedia,
    this.score,
    List<String>? selectedTags,
    this.sortBy = SortReviewBy.mostRecent,
  }) : selectedTags = selectedTags ?? [];

  ReviewFilters copyWith({
    ValueGetter<bool?>? hasMedia,
    ValueGetter<int?>? score,
    List<String>? selectedTags,
    SortReviewBy? sortBy,
  }) {
    return ReviewFilters(
      hasMedia: hasMedia != null ? hasMedia() : this.hasMedia,
      score: score != null ? score() : this.score,
      selectedTags: selectedTags ?? this.selectedTags,
      sortBy: sortBy ?? this.sortBy,
    );
  }

  bool get isDefault {
    return hasMedia == null &&
        score == null &&
        selectedTags.isEmpty &&
        sortBy == SortReviewBy.mostRecent;
  }
}

class ReviewViewModel extends BaseViewModel {
  final Property property;

  @override
  ReviewViewModel({required this.property});
  final _reviewService = locator<ReviewService>();

  List<Review> get _reviews => _reviewService.data?.data ?? [];
  List<Review> get reviews => _reviews;

  ReviewFilters _activeFilters = ReviewFilters();
  ReviewFilters get activeFilters => _activeFilters;

  List<String> _availableTags = [];
  List<String> get availableTags => _availableTags;

  int get _limit => _reviewService.data?.page ?? 10;
  int get _currentPage => _reviewService.data?.page ?? 1;
  bool get _canLoadMore => _reviewService.data?.hasNextPage ?? false;
  bool get canLoadMore => _canLoadMore;

  bool _isFetchingReviews = false;
  bool get isFetchingReviews => _isFetchingReviews;

  bool _isPropertyOwner = false;
  bool get isPropertyOwner => _isPropertyOwner;
  final Map<String, TextEditingController> _replyControllers = {};
  TextEditingController getReplyController(String reviewId) {
    _replyControllers.putIfAbsent(reviewId, () => TextEditingController());
    return _replyControllers[reviewId]!;
  }

  Future<void> initialise() async {
    _isPropertyOwner = AuthService.currentUser?.id == property.ownerId;
    _availableTags = _reviewService.getAvailableTags();
    _fetchReviews(isInitialFetch: true);
  }

  Future<void> _fetchReviews({bool isInitialFetch = false}) async {
    if (_isFetchingReviews) return;
    _isFetchingReviews = true;

    if (isInitialFetch) {
      _reviewService.data = null;
      setBusy(true);
    } else {
      notifyListeners();
    }

    try {
      await _reviewService.fetchPropertyReviews(
        property.id,
        page: _currentPage,
        limit: _limit,
        hasMediaFilter: _activeFilters.hasMedia,
        scoreFilter: _activeFilters.score,
        tagsFilter: _activeFilters.selectedTags,
        sortBy: _activeFilters.sortBy,
      );
    } catch (e) {
      setError(e);
    } finally {
      _isFetchingReviews = false;
      if (isInitialFetch) setBusy(false);
      notifyListeners();
    }
  }

  Future<void> fetchMoreReviews() async {
    if (_canLoadMore && !_isFetchingReviews) {
      await _fetchReviews();
    }
  }

  Future<void> refreshReviews() async {
    await _fetchReviews(isInitialFetch: true);
  }

  void toggleHasMediaFilter() {
    _activeFilters = _activeFilters.copyWith(
        hasMedia: () => _activeFilters.hasMedia ?? false);
    refreshReviews();
  }

  void setScoreFilter(int? score) {
    // Pass null to clear
    _activeFilters = _activeFilters.copyWith(score: () => score);
    refreshReviews();
  }

  void toggleTagFilter(String tag) {
    final newTags = List<String>.from(_activeFilters.selectedTags);
    if (newTags.contains(tag)) {
      newTags.remove(tag);
    } else {
      newTags.add(tag);
    }
    _activeFilters = _activeFilters.copyWith(selectedTags: newTags);
    refreshReviews();
  }

  void setSortBy(SortReviewBy sortBy) {
    _activeFilters = _activeFilters.copyWith(sortBy: sortBy);
    refreshReviews();
  }

  void clearFilters() {
    _activeFilters = ReviewFilters();
    refreshReviews();
  }

  // Review item actions
  Future<void> toggleHelpful(String reviewId) async {
    final reviewIndex = _reviews.indexWhere((r) => r.id == reviewId);
    if (reviewIndex == -1) return;

    final originalReview = _reviews[reviewIndex];
    // Optimistically update UI
    _reviews[reviewIndex] = originalReview.copyWith(
      hasVoted: !originalReview.hasVoted,
      helpfulCount: originalReview.hasVoted
          ? originalReview.helpfulCount - 1
          : originalReview.helpfulCount + 1,
    );
    notifyListeners();

    try {
      final updatedReview =
          await _reviewService.toggleHelpful(reviewId, originalReview.hasVoted);
      _reviews[reviewIndex] = updatedReview;
    } catch (e) {
      // Revert optimistic update on error
      _reviews[reviewIndex] = originalReview;
      // Show error
    } finally {
      notifyListeners();
    }
  }

  void startComposingReply(String reviewId) {
    final reviewIndex = _reviews.indexWhere((r) => r.id == reviewId);
    if (reviewIndex != -1) {
      _reviews[reviewIndex] =
          _reviews[reviewIndex].copyWith(isComposingReply: true);
      notifyListeners();
    }
  }

  void cancelComposingReply(String reviewId) {
    final reviewIndex = _reviews.indexWhere((r) => r.id == reviewId);
    if (reviewIndex != -1) {
      _reviews[reviewIndex] =
          _reviews[reviewIndex].copyWith(isComposingReply: false);
      getReplyController(reviewId).clear();
      notifyListeners();
    }
  }

  Future<void> submitOwnerResponse(String reviewId) async {
    final text = getReplyController(reviewId).text;
    if (text.isEmpty) return;

    final reviewIndex = _reviews.indexWhere((r) => r.id == reviewId);
    if (reviewIndex == -1) return;
    try {
      final updatedReview =
          await _reviewService.postOwnerResponse(reviewId, text);
      _reviews[reviewIndex] = updatedReview.copyWith(isComposingReply: false);
      getReplyController(reviewId).clear();
    } catch (e) {
      // Handle error
      // _reviews[reviewIndex] = _reviews[reviewIndex].copyWith(isSubmittingResponse: false);
    } finally {
      notifyListeners();
    }
  }

  @override
  void dispose() {
    for (var controller in _replyControllers.values) {
      controller.dispose();
    }
    super.dispose();
  }
}
