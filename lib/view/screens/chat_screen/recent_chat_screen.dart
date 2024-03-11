import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:skill_sync/constants/colors.dart';

import '../../../models/chat_model.dart';
import '../../components/containers/recent_chat_container.dart';

class RecentChatScreen extends StatelessWidget {
  const RecentChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recent Chats'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: RecentChatContainer(
              chat: RecentChatModel(
                id: 'id$index',
                toId: '1234',
                fromId: '5678',
                userName: 'User $index',
                lastMessage: 'Hi from User $index',
                time: DateTime.now().subtract(Duration(minutes: index * 5)),
              ),
            ),
          );
        },
      ),
    );
  }
}
