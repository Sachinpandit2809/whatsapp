import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:whatsapp/model/status_model/status_helper.dart';
import 'package:whatsapp/model/status_model/status_item_model.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: StatusHelper.itemCount,
        itemBuilder: (context, position) {
          StatusItemModel statusItemModel =
              StatusHelper.getStatusItem(position);
          if (position == 0 || position == 1) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(12, 5, 0, 5),
                  child: position == 0
                      ? Text(
                          "Recent updates",
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      : null,
                ),
                // Divider(),
                ListTile(
                  leading: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2)),
                      child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage(statusItemModel.image.toString()))
                      //,
                      ),
                  title: Text(
                    statusItemModel.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                      statusItemModel.name + " " + statusItemModel.dateTime),
                )
              ],
            );
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 12.0),
                  child: position == 2
                      ? Text(
                          "Recent views",
                          style: Theme.of(context).textTheme.titleSmall,
                        )
                      : null,
                ),
                if (position == 2) Divider(),
                ListTile(
                  leading: Container(
                      height: 60,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.green, width: 2)),
                      child: CircleAvatar(
                          radius: 20,
                          backgroundImage:
                              NetworkImage(statusItemModel.image.toString()))
                      //,
                      ),
                  title: Text(
                    statusItemModel.name,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  subtitle: Text(
                      statusItemModel.name + " " + statusItemModel.dateTime),
                )
              ],
            );
          }
        });
  }
}
