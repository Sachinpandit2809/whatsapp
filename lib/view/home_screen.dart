import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp/view/call_screen.dart';
import 'package:whatsapp/view/chat_list_screen.dart';
import 'package:whatsapp/view/setting_screen.dart';
import 'package:whatsapp/view/status_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  var fabIcon = Icons.message;
  void initState() {
    // Todo:implete initState
    super.initState();
    tabController = TabController(length: 4, vsync: this)
      ..addListener(() {
        switch (tabController.index) {
          case 0:
            fabIcon = Icons.camera_alt_rounded;
            break;
          case 1:
            fabIcon = Icons.chat;
            break;
          case 2:
            fabIcon = Icons.camera_alt_rounded;
            break;
          case 3:
            fabIcon = Icons.message;
            break;
          default:
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.teal,
        title: Text(
          "WhatsApp",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: Colors.white),
        ),

        centerTitle: true,

        actions: [
          Icon(Icons.search, color: Colors.white),
          PopupMenuButton(
              enabled: true,
              icon: Icon(Icons.more_vert_outlined, color: Colors.white),
              itemBuilder: (context) => [
                    const PopupMenuItem(child: Text("new group")),
                    const PopupMenuItem(child: Text("Linked Group")),
                    PopupMenuItem(
                        child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SettingScreen()));
                      },
                      child: Container(
                          height: 30,
                          // width: 100,
                          //color: Colors.amber,
                          child: Text(textAlign: TextAlign.center, "Setting")),
                    )),
                    // const PopupMenuItem(child:InkWell(
                    //   onTap: Navigator.push(
                    //         context,
                    //         MaterialPageRoute(
                    //             builder: (context) => SettingScreen()));,
                    // ),

                    // )
                  ])
        ],

        bottom: TabBar(
            controller: tabController,
            indicatorColor: Colors.white,
            indicatorWeight: 0.8,
            tabs: [
              Tab(
                  child: Icon(
                Icons.camera_alt_rounded,
                color: Colors.white,
              )),
              Tab(
                  child: Text(
                "CHATS",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.white),
              )),
              Tab(
                child: Text(
                  "STATUS",
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: Colors.white),
                ),
              ),
              Tab(
                  child: Text(
                "CALLS",
                style: Theme.of(context)
                    .textTheme
                    .labelLarge!
                    .copyWith(color: Colors.white),
              )),
            ]),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Text("Camara"),
          ChatListScreen(),
          StatusScreen(),
          CallScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(fabIcon),
      ),
    );
  }
}

// extension on TextTheme {
//   TextTheme heading1() {
//     return TextTheme(
//         headlineSmall:
//             TextStyle(fontFamily: "Bold", fontSize: 12, color: Colors.red));
//   }
// }
