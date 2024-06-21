import 'package:whatsapp/model/status_model/status_item_model.dart';

class StatusHelper {
  static var statusList = [
    StatusItemModel("sunny", "2:34 AM",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    StatusItemModel("sunny", "2:34 AM",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    StatusItemModel("sunny", "2:34 AM",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    StatusItemModel("sunny", "2:34 AM",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
    StatusItemModel("sunny", "2:34 AM",
        "https://images.pexels.com/photos/974266/pexels-photo-974266.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
  ];
  static StatusItemModel getStatusItem(int position) {
    return statusList[position];
  }

  static var itemCount = statusList.length;
}
