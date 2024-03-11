import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/colors.dart';
import '../../../models/chat_model.dart';

class RecentChatContainer extends StatelessWidget {
  final RecentChatModel chat;

  const RecentChatContainer({Key? key, required this.chat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, '/chat'),
      visualDensity: VisualDensity(vertical: 3),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: CustomColors.primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: CustomColors.primaryColor.withOpacity(0.8),
        child: Text(
          chat.userName![0],
          style: const TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      title: Text(chat.userName!,
          style: Theme.of(context)
              .textTheme
              .bodyMedium
              ?.copyWith(color: CustomColors.primaryColor, fontSize: 20)),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0),
        child: Text(chat.lastMessage!,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                fontSize: 15,
                color: CustomColors.secondaryColor1,
                fontWeight: FontWeight.w400)),
      ),
      trailing: Text(DateFormat('kk:mm').format(chat.time!),
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(fontSize: 12, color: CustomColors.secondaryColor1)),
    );
  }
}
