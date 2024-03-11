import 'package:flutter/material.dart';
import 'package:skill_sync/constants/colors.dart';
import 'package:skill_sync/models/chat_model.dart';

import '../../components/containers/chat_container.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 80,
        elevation: 2,
        centerTitle: false,
        toolbarHeight: 70,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert,
              size: 30,
              color: CustomColors.primaryColor,
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(10),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: CustomColors.primaryColor.withOpacity(0.8),
            child: Text(
              "U",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        title: const Text(
          'User 1',
          style: TextStyle(
            color: CustomColors.primaryColor,
            fontSize: 23,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              child: ListView.builder(
                itemCount: 15,
                itemBuilder: (context, index) {
                  return ChatScreenContainer(
                    chat: ChatModel(
                      id: 'id$index',
                      userName: 'User 1',
                      fromId: '1234',
                      toId: '5678',
                      message: 'Message from User $index',
                      time:
                          DateTime.now().subtract(Duration(minutes: index * 5)),
                    ),
                    isMe: index % 2 == 0,
                  );
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(15, 0, 15, 10),
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            decoration: BoxDecoration(
                color: CustomColors.backgroundColor.withOpacity(0.5),
                borderRadius: BorderRadius.all(
                  Radius.circular(30.0),
                ),
                border: Border.all(
                  color: CustomColors.primaryColor,
                  width: 1,
                )),
            child: Center(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Send a message...",
                        hintStyle: TextStyle(
                          color: CustomColors.secondaryColor1,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.send,
                      size: 30,
                      color: CustomColors.primaryColor,
                    ),
                    onPressed: () {
                      // Implement send functionality here
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
