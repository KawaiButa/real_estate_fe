import 'package:flutter/material.dart';
import 'package:real_estate_fe/ui/widgets/common/loading_shimmer/loading_shimmer.dart';
import 'package:real_estate_fe/utils/ui_spacer.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:velocity_x/velocity_x.dart';

class CustomListView extends StatelessWidget {
  //
  final ScrollController? scrollController;
  final Widget? title;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final Widget? emptyWidget;
  final List<dynamic> dataSet;
  final bool isLoading;
  final bool hasError;
  final bool justList;
  final bool reversed;
  final bool noScrollPhysics;
  final Axis scrollDirection;
  final EdgeInsets? padding;
  final Widget Function(BuildContext, int) itemBuilder;
  final Widget Function(BuildContext, int)? separatorBuilder;
  //
  final bool canRefresh;
  final RefreshController? refreshController;
  final Function? onRefresh;
  final Function? onLoading;
  final bool canPullUp;
  final double? separator;
  const CustomListView({
    required this.dataSet,
    this.scrollController,
    this.title,
    this.loadingWidget,
    this.errorWidget,
    this.emptyWidget,
    this.isLoading = false,
    this.hasError = false,
    this.justList = true,
    this.reversed = false,
    this.noScrollPhysics = false,
    this.scrollDirection = Axis.vertical,
    required this.itemBuilder,
    this.separatorBuilder,
    this.padding,
    //
    this.canRefresh = false,
    this.refreshController,
    this.onRefresh,
    this.onLoading,
    this.canPullUp = false,
    this.separator,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return justList
        ? _getBody()
        : VStack(
            [
              title ?? UiSpacer.emptySpace(),
              _getBody(),
            ],
            crossAlignment: CrossAxisAlignment.start,
          );
  }

  Widget _getBody() {
    final contentBody = isLoading
        ? loadingWidget ?? const LoadingShimmer()
        : hasError
            ? errorWidget ?? "There is an error".text.make()
            : (dataSet.isEmpty)
                ? emptyWidget ?? UiSpacer.emptySpace()
                : justList
                    ? _getListView()
                    : Expanded(
                        child: _getListView(),
                      );

    return canRefresh
        ? SmartRefresher(
            scrollDirection: scrollDirection,
            enablePullDown: true,
            enablePullUp: canPullUp,
            controller: refreshController ?? RefreshController(),
            onRefresh: onRefresh != null ? () => onRefresh!() : null,
            onLoading: onLoading != null ? () => onLoading!() : null,
            child: contentBody,
          )
        : contentBody;
  }

  Widget _getListView() {
    return ListView.separated(
      controller: scrollController,
      padding: padding,
      shrinkWrap: true,
      reverse: reversed,
      physics: noScrollPhysics ? const NeverScrollableScrollPhysics() : null,
      scrollDirection: scrollDirection,
      itemBuilder: itemBuilder,
      itemCount: dataSet.length,
      separatorBuilder: separatorBuilder ??
          (context, index) => scrollDirection == Axis.vertical
              ? UiSpacer.verticalSpace(space: separator ?? 20.0)
              : UiSpacer.horizontalSpace(space: separator ?? 20.0),
    );
  }
}
