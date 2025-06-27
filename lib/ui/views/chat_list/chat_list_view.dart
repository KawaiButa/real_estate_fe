import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:real_estate_fe/constants/app_colors.dart';
import 'package:real_estate_fe/models/chat_session.dart';
import 'package:real_estate_fe/models/user.dart';
import 'package:real_estate_fe/ui/widgets/common/base_page/base_page.dart';
import 'package:stacked/stacked.dart';
import 'chat_list_viewmodel.dart';
import 'package:intl/intl.dart';

class ChatListView extends StackedView<ChatListViewModel> {
  const ChatListView({Key? key}) : super(key: key);

  @override
  bool get disposeViewModel => false;

  @override
  bool get initialiseSpecialViewModelsOnce => true;
  @override
  Widget builder(
    BuildContext context,
    ChatListViewModel viewModel,
    Widget? child,
  ) {
    return BasePage(
      showAppBar: true,
      title: "Chats".tr(),
      refreshController: viewModel.refreshController,
      onRefresh: viewModel.refreshData,
      appBarColor: AppColors.primaryColor,
      body: viewModel.isBusy && !viewModel.dataReady
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(AppColors.primaryColor),
              ),
            )
          : viewModel.paginatedChatSession?.data == null
              ? const Center(child: Text('No Chats Yet'))
              : ListView.builder(
                  itemCount: (viewModel.paginatedChatSession?.data ??
                          ([].cast<ChatSession>()))
                      .length,
                  itemBuilder: (context, index) {
                    final chatSession =
                        viewModel.paginatedChatSession?.data[index];
                    if (chatSession == null) return const SizedBox.shrink();
                    final otherUser = viewModel.getOtherUser(chatSession);
                    return _ChatListItem(
                      user: otherUser,
                      lastMessage: chatSession.lastMessage?.content ?? '',
                      lastMessageTime: chatSession.lastMessage?.createdAt,
                      onTap: () => viewModel.navigateToChatDetail(chatSession),
                    );
                  },
                ),
    );
  }

  @override
  ChatListViewModel viewModelBuilder(BuildContext context) =>
      ChatListViewModel();

  @override
  void onViewModelReady(ChatListViewModel viewModel) {
    viewModel.getChatSession();
    super.onViewModelReady(viewModel);
  }
}

class _ChatListItem extends StatelessWidget {
  User? user;
  final String lastMessage;
  final DateTime? lastMessageTime;
  final VoidCallback onTap;

  _ChatListItem({
    required this.lastMessage,
    required this.lastMessageTime,
    required this.onTap,
    this.user,
  });

  String _formatDateTime(DateTime? dt) {
    if (dt == null) return '';

    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final messageDate = DateTime(dt.year, dt.month, dt.day);

    if (today == messageDate) {
      return DateFormat.Hm().format(dt);
    } else if (today.difference(messageDate).inDays == 1) {
      return 'Yesterday';
    } else {
      return DateFormat.Md().format(dt);
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        decoration: const BoxDecoration(
          color: AppColors.cardBackground,
          border: Border(
            bottom: BorderSide(color: Colors.black12, width: 0.5),
          ),
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: Colors.grey[300],
              backgroundImage: user?.profileImage?.url != null
                  ? NetworkImage(user!.profileImage!.url)
                  : null,
              child: user?.profileImage?.url == null
                  ? Text(
                      (user?.name == null
                              ? user?.name[0].toUpperCase()
                              : '?') ??
                          "A".tr(),
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user?.name ?? "AI Assistant".tr(),
                    style: const TextStyle(
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    lastMessage.isEmpty ? "No message".tr() : lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: AppColors.subTextColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              _formatDateTime(lastMessageTime),
              style: const TextStyle(
                fontSize: 12.0,
                color: AppColors.subTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
