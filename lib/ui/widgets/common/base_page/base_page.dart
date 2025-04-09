import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/constants/app_text_style.dart';
import 'package:real_estate_fe/utils/ui_spacer.dart';
import 'package:real_estate_fe/utils/utils.dart';

import 'package:keyboard_dismisser/keyboard_dismisser.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:velocity_x/velocity_x.dart';

class BasePage extends StatefulWidget {
  final bool showAppBar;
  final bool showLeadingAction;
  final bool? extendBodyBehindAppBar;
  final Function? onBackPressed;
  final bool showCart;
  final dynamic title;
  final List<Widget>? actions;
  final Widget? leading;
  final Widget body;
  final Widget? bottomSheet;
  final Widget? bottomNavigationBar;
  final Widget? fab;
  final FloatingActionButtonLocation? fabLocation;
  final bool isLoading;
  final Color? appBarColor;
  final double? elevation;
  final Color? appBarItemColor;
  final Color? backgroundColor;
  final void Function(String query)? onSearchChange;
  final bool showCartView;
  final PreferredSize? customAppbar;
  final bool resizeToAvoidBottomInset;
  final bool isSearch;
  final bool isIconNotification;
  final bool isIconMessage;
  final bool isBlackColorBackArrow;
  final RefreshController? refreshController;
  final Function()? onRefresh;
  final Function(String value)? onSubmit;
  const BasePage({
    this.showAppBar = false,
    this.leading,
    this.showLeadingAction = true,
    this.onBackPressed,
    this.showCart = false,
    this.title = "",
    this.actions,
    required this.body,
    this.bottomSheet,
    this.bottomNavigationBar,
    this.fab,
    this.fabLocation,
    this.isLoading = false,
    this.appBarColor,
    this.appBarItemColor,
    this.backgroundColor,
    this.elevation,
    this.extendBodyBehindAppBar,
    this.showCartView = false,
    this.customAppbar,
    this.resizeToAvoidBottomInset = false,
    this.isSearch = false,
    this.isIconNotification = false,
    this.isIconMessage = false,
    this.isBlackColorBackArrow = false,
    this.refreshController,
    this.onRefresh,
    this.onSubmit,
    Key? key,
    this.onSearchChange,
  }) : super(key: key);

  @override
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  //
  double bottomPaddingSize = 0;

  //
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: translator.activeLocale.languageCode == "ar"
          ? TextDirection.rtl
          : TextDirection.ltr,
      child: KeyboardDismisser(
        child: Scaffold(
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          backgroundColor: widget.backgroundColor ?? AppColors.faintBgColor,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar ?? false,
          appBar: widget.customAppbar ??
              (widget.showAppBar
                  ? AppBar(
                      centerTitle: true,
                      backgroundColor: widget.appBarColor ??
                          context.theme.colorScheme
                              .surface, //context.primaryColor,
                      elevation: widget.elevation,
                      automaticallyImplyLeading: widget.showLeadingAction,
                      leading: widget.showLeadingAction
                          ? widget.leading ??
                              IconButton(
                                icon: Icon(
                                  !Utils.isArabic
                                      ? Icons.arrow_back_ios
                                      : Icons.arrow_right_alt,
                                  color: widget.isBlackColorBackArrow
                                      ? Colors.black
                                      : Vx.white,
                                ),
                                onPressed: widget.onBackPressed != null
                                    ? () => widget.onBackPressed!()
                                    : () => Navigator.pop(context),
                              )
                          : null,
                      title: widget.title is Widget
                          ? widget.title
                          : widget.isSearch
                              ? Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        // height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        child: TextField(
                                          onSubmitted: widget.onSubmit,
                                          decoration: const InputDecoration(
                                            hintText: "Search anything here",
                                            // icon: Icon(Icons.search),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : "${widget.title}"
                                  .text
                                  .textStyle(AppTextStyle.h3TitleTextStyle(
                                      color: Vx.white))
                                  .maxLines(1)
                                  .overflow(TextOverflow.ellipsis)
                                  .color(Vx.white)
                                  .make(),
                      actions: widget.actions ??
                          <Widget>[
                            if (widget.isIconNotification)
                              const Icon(Icons.notifications,
                                      color: Colors.white)
                                  .pSymmetric(h: 15),
                            if (widget.isIconMessage)
                              const Icon(Icons.message, color: Colors.white)
                                  .pOnly(right: 10),
                          ])
                  : null),
          body: widget.refreshController != null
              ? SmartRefresher(
                  controller: widget.refreshController!,
                  enablePullDown: true,
                  onRefresh: widget.onRefresh ?? () {},
                  child: _buildMainContent(),
                )
              : _buildMainContent(),
          bottomNavigationBar: widget.bottomNavigationBar,
          bottomSheet: widget.bottomSheet,
          floatingActionButton: widget.fab,
          floatingActionButtonLocation: widget.fabLocation,
        ),
      ),
    );
  }

  _buildMainContent() {
    return Stack(
      children: [
        //body
        VStack(
          [
            //
            widget.isLoading
                ? const LinearProgressIndicator()
                : UiSpacer.emptySpace(),

            //
            widget.body.pOnly(bottom: bottomPaddingSize).expand(),
          ],
        ),
      ],
    );
  }
}
