import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/models/property.dart';
import 'package:real_estate_fe/ui/bottom_sheets/ai_result/ai_result_sheet_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:intl/intl.dart';

class AiResultSheet extends StackedView<AiResultViewModel> {
  final SheetRequest request;
  final Function(SheetResponse) completer;

  const AiResultSheet({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    AiResultViewModel viewModel,
    Widget? child,
  ) {
    final theme = Theme.of(context);

    return Container(
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.9,
      ),
      padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 15.0),
            child: Text(
              'AI Property Analysis',
              style: theme.textTheme.headlineSmall
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Input Properties Section
                  Text(
                    'Input Properties:',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 180, // Increased height for more data
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: viewModel.properties.length,
                      itemBuilder: (context, index) {
                        final property = viewModel.properties[index];
                        return _PropertyItem(property: property);
                      },
                    ),
                  ),
                  if (viewModel.showComparisonTable) ...[
                    const Divider(height: 35, thickness: 0.5),
                    _ComparisonSection(viewModel: viewModel),
                  ],
                  const Divider(height: 35, thickness: 0.5),

                  // AI Result Section
                  Text(
                    'AI Insights:',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    constraints: const BoxConstraints(
                        minHeight: 150), // Ensure it has some height
                    decoration: BoxDecoration(
                      color: theme.scaffoldBackgroundColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                          color: theme.dividerColor.withValues(alpha: 0.5)),
                    ),
                    child: viewModel.isBusy
                        ? const _LoadingIndicator()
                        : viewModel.hasError
                            ? _ErrorDisplay(message: viewModel.modelError)
                            : MarkdownBody(
                                data: viewModel.aiResponse ??
                                    "No response generated.",
                                selectable: true,
                                styleSheet: MarkdownStyleSheet.fromTheme(theme)
                                    .copyWith(
                                  p: theme.textTheme.bodyMedium,
                                  h1: theme.textTheme.titleLarge
                                      ?.copyWith(height: 1.8),
                                  h2: theme.textTheme.titleMedium
                                      ?.copyWith(height: 1.6),
                                  code: theme.textTheme.bodyMedium?.copyWith(
                                    fontFamily: 'monospace',
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                  blockquoteDecoration: BoxDecoration(
                                    color: Colors.blueGrey.shade50,
                                    border: Border(
                                        left: BorderSide(
                                            color: theme.primaryColor,
                                            width: 4)),
                                  ),
                                  listBullet: theme.textTheme.bodyMedium,
                                  tableBorder: TableBorder.all(
                                      color: theme.dividerColor, width: 1),
                                  tableHead: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                  ),
                  const SizedBox(height: 25),

                  // Close Button
                  Align(
                    alignment: Alignment.centerRight,
                    child: FilledButton(
                      // Using FilledButton for more prominence
                      onPressed: () =>
                          completer(SheetResponse(confirmed: true)),
                      child: const Text('GOT IT'),
                    ),
                  ),
                  const SizedBox(height: 10), // Padding at the very bottom
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  AiResultViewModel viewModelBuilder(BuildContext context) {
    final properties = (request.data as List<dynamic>?)
            ?.whereType<Property>() // Ensure type safety
            .toList() ??
        [];
    final viewModel = AiResultViewModel(properties);
    viewModel.initialize(); // Start fetching data
    return viewModel;
  }
}

class _ComparisonSection extends StatelessWidget {
  final AiResultViewModel viewModel;

  const _ComparisonSection({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final priceFormat = NumberFormat.compactCurrency(
        locale: translator.activeLocale.languageCode);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Comparison:',
          style: theme.textTheme.titleMedium
              ?.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 10),
        Container(
          decoration: BoxDecoration(
            border:
                Border.all(color: theme.dividerColor.withValues(alpha: 0.5)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                headingRowColor: WidgetStateProperty.all(
                    theme.primaryColor.withValues(alpha: .1)),
                headingTextStyle: theme.textTheme.labelMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
                dataRowMinHeight: 52.0, // Adjust height
                dataRowMaxHeight: 60.0,
                columnSpacing: 20, // Adjust spacing
                columns: const [
                  DataColumn(label: Text('Property')),
                  DataColumn(label: Text('Price'), numeric: true),
                  DataColumn(label: Text('Area (sqm)'), numeric: true),
                  DataColumn(label: Text('Distance (km)'), numeric: true),
                ],
                rows: viewModel.properties.map((property) {
                  final distance = viewModel.getMockDistanceInKm(property);
                  return DataRow(
                    cells: [
                      DataCell(
                        SizedBox(
                          // Constrain width to prevent excessive expansion
                          width: 100,
                          child: Text(
                            property.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: theme.textTheme.bodySmall,
                          ),
                        ),
                      ),
                      DataCell(Text(priceFormat.format(property.price),
                          style: theme.textTheme.bodySmall)),
                      DataCell(Text(property.sqm?.toInt().toString() ?? 'N/A',
                          style: theme.textTheme.bodySmall)),
                      DataCell(Text(distance.toStringAsFixed(1),
                          style: theme.textTheme.bodySmall)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
            ),
            const SizedBox(height: 20),
            Text(
              "Our AI is thinking...".tr(),
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 5),
            Text(
              "This might take a moment.".tr(),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}

// --- Error Widget ---
class _ErrorDisplay extends StatelessWidget {
  final String message;
  const _ErrorDisplay({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.error_outline,
              color: theme.colorScheme.error,
              size: 40,
            ),
            const SizedBox(height: 15),
            Text(
              "Analysis Failed",
              style: theme.textTheme.titleMedium?.copyWith(
                  color: theme.colorScheme.error, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              message,
              style:
                  theme.textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _PropertyItem extends StatefulWidget {
  final Property property;

  const _PropertyItem({Key? key, required this.property}) : super(key: key);

  @override
  State<_PropertyItem> createState() => _PropertyItemState();
}

class _PropertyItemState extends State<_PropertyItem> {
  Timer? _timer;
  int _currentIndex = 0;
  final NumberFormat _currencyFormat = NumberFormat.compactCurrency(
      locale: translator.activeLocale.languageCode);

  @override
  void initState() {
    super.initState();
    if (widget.property.images.isNotEmpty &&
        widget.property.images.length > 1) {
      _timer = Timer.periodic(const Duration(seconds: 4), (timer) {
        if (mounted) {
          setState(() {
            _currentIndex = (_currentIndex + 1) % widget.property.images.length;
          });
        } else {
          timer.cancel();
        }
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String getImageUrl() {
    if (widget.property.images.isEmpty) {
      return 'https://via.placeholder.com/200x100/CCCCCC/FFFFFF?text=No+Image';
    }

    final imageItem = widget.property.images[_currentIndex];
    return imageItem.url;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final property = widget.property;

    return Card(
      margin: const EdgeInsets.only(right: 12),
      elevation: 2,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: SizedBox(
        width: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with Transition
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 700),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return FadeTransition(opacity: animation, child: child);
              },
              child: Image.network(
                getImageUrl(),
                key: ValueKey<int>(_currentIndex), // Key helps AnimatedSwitcher
                height: 85,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  height: 85,
                  color: Colors.grey[300],
                  child: const Icon(Icons.broken_image_outlined,
                      color: Colors.grey, size: 30),
                ),
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Container(
                    height: 85,
                    color: Colors.grey[200],
                    child: Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 2.0,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
            // Details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    property.title,
                    style: theme.textTheme.bodyMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _currencyFormat.format(property.price),
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.primaryColor, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${property.address.neighborhood ?? ''} ${property.address.city}'
                        .trim(),
                    style: theme.textTheme.bodySmall
                        ?.copyWith(color: Colors.grey[600]),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.bed_outlined,
                          size: 14, color: Colors.grey[700]),
                      const SizedBox(width: 4),
                      Text('${property.bedrooms}',
                          style: theme.textTheme.bodySmall),
                      const SizedBox(width: 10),
                      Icon(Icons.bathtub_outlined,
                          size: 14, color: Colors.grey[700]),
                      const SizedBox(width: 4),
                      Text('${property.bathrooms}',
                          style: theme.textTheme.bodySmall),
                      if (property.sqm != null) ...[
                        const SizedBox(width: 10),
                        Icon(Icons.square_foot_outlined,
                            size: 14, color: Colors.grey[700]),
                        const SizedBox(width: 4),
                        Text('${property.sqm?.toInt()}',
                            style: theme.textTheme.bodySmall),
                      ]
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
