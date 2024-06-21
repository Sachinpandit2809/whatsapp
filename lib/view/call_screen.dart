import 'package:flutter/material.dart';
import 'package:whatsapp/model/call_model/call_helper.dart';
import 'package:whatsapp/model/call_model/call_item_model.dart';

class CallScreen extends StatefulWidget {
  const CallScreen({super.key});

  @override
  State<CallScreen> createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: CallHelper.itemCount,
        itemBuilder: (context, position) {
          CallItemModel callItemModel = CallHelper.getCallItem(position);
          return Column(children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage:
                        NetworkImage(callItemModel.image.toString()),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Row(
                      children: [
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(callItemModel.name,
                                    style:
                                        Theme.of(context).textTheme.titleSmall)
                              ],
                            ),
                            Text(callItemModel.dateTime,
                                style: Theme.of(context).textTheme.labelMedium)
                          ],
                        )
                      ],
                    ),
                  ),
                  Icon(Icons.call, color: Colors.teal)
                ],
              ),
            )
          ]);
        });
  }
}
