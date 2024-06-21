import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat_model/chat_helper.dart';
import 'package:whatsapp/model/chat_model/chat_item_model.dart';

class ChatBarScreen extends StatefulWidget {
  const ChatBarScreen({super.key});

  @override
  State<ChatBarScreen> createState() => _ChatBarScreenState();
}

class _ChatBarScreenState extends State<ChatBarScreen> {
  //  ChatItemModel chatItemModel = ChatHelper.getChatItem(position);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ChatHelper.itemCount,
        itemBuilder: (context, position) {
          ChatItemModel chatItemModel = ChatHelper.getChatItem(position);

          return Column(
            children: [
              ListTile(
                title: Text(chatItemModel.name),
              )
            ],
          );
        });
  }
}
