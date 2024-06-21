import 'package:flutter/material.dart';
import 'package:whatsapp/model/chat_model/chat_helper.dart';
import 'package:whatsapp/model/chat_model/chat_item_model.dart';
import 'package:whatsapp/view/chat_screen.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: ChatHelper.itemCount,
        itemBuilder: (context, position) {
          ChatItemModel chatItem = ChatHelper.getChatItem(position);
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ChatScreen(
                              image: chatItem.image, name: chatItem.name)));
                },
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(chatItem.image.toString()),
                  ),
                  title: Text(
                    chatItem.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                          size: 20,
                          position % 2 == 0 ? Icons.done : Icons.done_all,
                          color: position % 2 == 0 ? Colors.grey : Colors.blue),
                      SizedBox(
                        width: 4,
                      ),
                      Text(chatItem.mostRecentMessage),
                      Spacer(),
                    ],
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Text(
                      chatItem.messageDate,
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
