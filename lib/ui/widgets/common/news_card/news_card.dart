import 'package:flutter/material.dart';
import 'package:real_estate_fe/models/news_article.dart';
import 'package:real_estate_fe/ui/widgets/common/custom_image/custom_image.dart';
import 'package:stacked/stacked.dart';

import 'news_card_model.dart';

class NewsCard extends StackedView<NewsCardModel> {
  const NewsCard({required this.article, this.onTap, super.key});
  final NewsArticle article;
  final Function(NewsArticle)? onTap;
  @override
  Widget builder(
    BuildContext context,
    NewsCardModel viewModel,
    Widget? child,
  ) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => onTap != null ? onTap!(article) : null,
        borderRadius: BorderRadius.circular(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(8)),
              child: CustomImage(
                imageUrl: article.imageUrl,
                height: 100,
                width: double.infinity,
                boxFit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 100,
                  color: Colors.grey[300],
                  child: const Center(child: Icon(Icons.image_not_supported)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    article.shortDescription,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[700],
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  NewsCardModel viewModelBuilder(
    BuildContext context,
  ) =>
      NewsCardModel();
}
