import 'package:flutter/material.dart';
import 'package:skill_sync/models/chat_model.dart';

import '../../../constants/colors.dart';

class ChatScreenContainer extends StatelessWidget {
  final ChatModel chat;
  final bool isMe;

  const ChatScreenContainer({Key? key, required this.chat, required this.isMe})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isMe ? CustomColors.primaryColor : Colors.grey[300],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment:
              isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isMe)
              Text(
                chat.userName!,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            Text(
              chat.message!,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
