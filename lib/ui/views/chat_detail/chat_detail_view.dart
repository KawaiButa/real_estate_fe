import 'package:chatview/chatview.dart';
import 'package:flutter/material.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/chat_session.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/ui/views/chat_detail/chat_detail_viewmodel.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';

class ChatDetailView extends StackedView<ChatDetailViewModel> {
  final ChatSession? chatSession;
  final User? user;
  const ChatDetailView({
    super.key,
    this.chatSession,
    this.user,
  }) : assert(chatSession != null || user != null,
            'Either chatSession or user must be non-null');

  @override
  Widget builder(
      BuildContext context, ChatDetailViewModel viewModel, Widget? child) {
    return BasePage(
        showAppBar: true,
        title: viewModel.otherUser?.name ?? "Chat",
        appBarColor: AppColors.primaryColor,
        resizeToAvoidBottomInset: true,
        body: viewModel.chatController == null
            ? Center(
                child: CircularProgressIndicator(
                color: AppColors.primaryColor,
              ))
            : ChatView(
                chatController: viewModel.chatController!,
                onSendTap: viewModel.onSendTap,
                isLastPage: true,
                loadMoreData: viewModel.loadMoreData,
                sendMessageConfig: SendMessageConfiguration(
                  defaultSendButtonColor: AppColors.background,
                  textFieldBackgroundColor: AppColors.primaryColor,
                  textFieldConfig: TextFieldConfiguration(
                      hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade50,
                    letterSpacing: 0.25,
                  )),
                  imagePickerIconsConfig: const ImagePickerIconsConfiguration(
                      cameraIconColor: Colors.white,
                      galleryIconColor: Colors.white),
                  allowRecordingVoice: false,
                ),
                chatViewState: ChatViewState.hasMessages,
              ));
  }

  @override
  void onViewModelReady(ChatDetailViewModel viewModel) {
    viewModel.initViewModel();
    super.onViewModelReady(viewModel);
  }

  @override
  ChatDetailViewModel viewModelBuilder(BuildContext context) =>
      ChatDetailViewModel(chatSession: chatSession, user: user);
}
