import "package:flutter/material.dart";
import "package:whatsapp/model/message_model/message_helper.dart";
import "package:whatsapp/model/message_model/messge_item_model.dart";

class ChatScreen extends StatefulWidget {
  final String image, name;
  const ChatScreen({Key? key, required this.image, required this.name})
      : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(widget.image),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: TextStyle(
                          // fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "online",
                      style: TextStyle(
                          fontSize: 11,
                          color: Colors.white,
                          fontWeight: FontWeight.w300),
                    )
                  ],
                ),
              )
            ],
          ),
          actions: const [
            Icon(
              Icons.call,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Icon(
              Icons.video_call_outlined,
              color: Colors.white,
            ),
            SizedBox(width: 20),
          ],
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: ListView.builder(
                      itemCount: MessageHelper.itemCount,
                      itemBuilder: (context, position) {
                        MessageItemModel chatItem =
                            MessageHelper.getMessageItem(position);
                        return Column(
                          crossAxisAlignment: position % 2 == 0
                              ? CrossAxisAlignment.end
                              : CrossAxisAlignment.start,
                          children: [
                            MessageBubble(
                                isMe: true,
                                message: chatItem.mostRecentMessage,
                                time: chatItem.messageDate,
                                onPress: () {},
                                index: position,
                                listLength: MessageHelper.itemCount,
                                isSeen: false,
                                type: chatItem.type)
                          ],
                        );
                      })),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(50)),
                        child: Row(
                          children: [
                            SizedBox(width: 15),
                            Icon(Icons.emoji_emotions,
                                size: 25,
                                color: const Color.fromARGB(255, 255, 123, 7)),
                            SizedBox(width: 10),
                            Text("Message",
                                style: Theme.of(context)
                                    .textTheme
                                    .labelLarge!
                                    .copyWith(color: Colors.black)),
                            Spacer(),
                            Icon(Icons.attach_file),
                            SizedBox(width: 10),
                            Icon(Icons.camera_alt_outlined),
                            SizedBox(width: 10),
                          ],
                        )),
                  )),
                  CircleAvatar(
                    radius: 24,
                    child: Icon(Icons.mic, size: 20, color: Colors.white),
                  ),
                  SizedBox(width: 3)
                ],
              )
            ],
          ),
        ));
  }
}

// ignore: must_be_immutable
class MessageBubble extends StatelessWidget {
  MessageBubble({
    required this.isMe,
    required this.message,
    required this.time,
    required this.onPress,
    required this.index,
    required this.listLength,
    required this.isSeen,
    required this.type,
  });

  final bool isMe;
  final String message, type;
  final String time;
  final VoidCallback onPress;
  int index;
  int listLength;
  bool isSeen;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        crossAxisAlignment:
            index % 2 == 0 ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 2,
          ),
          if (type == "msj")
            Align(
              alignment:
                  index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: InkWell(
                onTap: onPress,
                child: Material(
                  elevation: 1,
                  color: index % 2 == 0
                      ? Colors.teal
                      : Colors.teal.withOpacity(0.5),
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    child: Text(
                      message,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontSize: 12, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          if (type == "image")
            Align(
              alignment:
                  index % 2 == 0 ? Alignment.centerRight : Alignment.centerLeft,
              child: InkWell(
                onTap: onPress,
                child: Material(
                  elevation: 1,
                  borderRadius: index % 2 == 0
                      ? BorderRadius.only(
                          topLeft: Radius.circular(10.0),
                          bottomLeft: Radius.circular(0),
                          bottomRight: Radius.circular(10))
                      : BorderRadius.only(
                          topRight: Radius.circular(10.0),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(0)),
                  color: index % 2 == 0
                      ? Colors.teal
                      : Color.fromARGB(255, 0, 0, 0).withOpacity(0.5),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Image(
                        height: MediaQuery.of(context).size.height * .2,
                        width: MediaQuery.of(context).size.width * .5,
                        fit: BoxFit.cover,
                        image: NetworkImage(message)),
                  ),
                ),
              ),
            ),
          SizedBox(
            height: 2,
          ),
          Text(
            time.toString(),
            maxLines: 1,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(
            height: 4,
          ),
          // Text(time.toString())
        ],
      ),
    );
  }
}
