import 'package:whatsapp/model/call_model/call_item_model.dart';

class CallHelper {
  static var callList = [
    CallItemModel("sachin", "Outgoing Today 2:32 PM",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    CallItemModel("Amit", "Tncoming, 6:30 Pm ",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    CallItemModel("sachin", "Outgoing Today 2:32 PM",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    CallItemModel("Amit", "Tncoming, 6:30 Pm ",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
  ];

  static CallItemModel getCallItem(int position) {
    return callList[position];
  }

  static var itemCount = callList.length;
}
