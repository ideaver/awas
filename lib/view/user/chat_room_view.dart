import 'package:awas_core/view/user/chat_room_page.dart';

import 'package:flutter/material.dart';

import 'user_view.dart';

class ChatRoomView extends StatelessWidget {
  static const String routeName = '/chat-room';

  const ChatRoomView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChatRoomPage(
      onTapProfile: () {
        Navigator.pushNamed(context, UserView.viewAsOtherRouteName);
      },
    );
  }
}
