import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/Drawer/my_drawer_header.dart';
import 'package:flutter_application_1/Fragments/search_fragment.dart';
import 'package:flutter_application_1/Activitypages/login.dart';


class MyDashboard extends StatefulWidget {
  final String username;

  const MyDashboard({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  _MyDashboardState createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  int index = 2;
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  Widget _getBody() {
  if (index == 0) {
    return const SearchFragment();
  }

  if (index == 1) {
    return const Center(
      child: Text("Calendar Page"),
    );
  }

  if (index == 2) {
    return Center(
      child: Text(
        'Hello Sameer(${widget.username})',
        style: const TextStyle(fontSize: 24),
      ),
    );
  }

  if (index == 3) {
    return const Center(
      child: Text("Create Page"),
    );
  }

  if (index == 4) {
    return const Center(
      child: Text("Settings Page"),
    );
  }

  return const SizedBox();
}

int selectedDrawindex = 0;

final List<Map<String,dynamic>> drawerItems = [
{"icon":Icons.schedule, "title"     : "Schedules"},
{"icon":Icons.notifications,"title" : "Notifications"},
{"icon": Icons.person, "title"      : "Add Customer Contact"},
{"icon":Icons.face, "title"         : "Add Agent Contact Details"},
{"icon":Icons.construction, "title" : "Settings"},
{"icon":Icons.loop_sharp, "title"      : "Sync Data"},
{"icon":Icons.delete_outline, "title" : "Clear App Data"},
{"icon":Icons.contact_support,"title":"About"},
{"icon":Icons.power,"title":"Logout"},
];







  @override
  Widget build(BuildContext context) {
     double screenHeight = MediaQuery.of(context).size.height;
     double screenWidth = MediaQuery.of(context).size.width;

     double navBarHeight = screenHeight * 0.10; 
     if (navBarHeight > 75) navBarHeight = 75; 



    final items =<Widget>[
      //Icon(Icons.search ,       size:30),
      //Icon(Icons.calendar_today , size:30),
      //Icon(Icons.dashboard ,     size:25),
      //Icon(Icons.create ,        size:30),
      //Icon(Icons.settings ,      size:30)
      Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.search, size: 25),
      SizedBox(height: 0),
      Text("Search", style: TextStyle(fontSize: 10)),
    ],
  ),
  Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.calendar_today, size: 25),
      SizedBox(height: 0),
      Text("Calendar", style: TextStyle(fontSize: 10)),
    ],
  ),
  Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.dashboard, size: 35),
      SizedBox(height: 0),
      Text("Dashboard", style: TextStyle(fontSize: 11)),
    ],
  ),
  Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.create, size: 25),
      SizedBox(height: 0),
      Text("Create", style: TextStyle(fontSize: 11)),
    ],
  ),
  Column(
    mainAxisSize: MainAxisSize.min,
    children: const [
      Icon(Icons.settings, size: 25),
      SizedBox(height: 0),
      Text("Settings", style: TextStyle(fontSize: 11)),
    ],
  ),


    ];
    var drawer;
    return Scaffold(
        key: _scaffoldKey, // 👈 IMPORTANT

      appBar: AppBar(
        
        leading: IconButton(
    icon: const Icon(Icons.menu, color: Colors.black,size: 35,),
    onPressed: () {
                  _scaffoldKey.currentState?.openDrawer();

    },
  ),

          backgroundColor: Colors.white, 
        title: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/IGI_Logo.png',
        height: screenHeight * 0.06,
        fit: BoxFit.contain,
      ),
      const SizedBox(height: 9),  
    ],
  ),
  
  centerTitle: true, 

      ),
      backgroundColor: Colors.grey[350],
      body:Container(
child: _getBody(),

      ) ,
drawer: Drawer(
  child: Column(
    children: [
      MyHeaderDrawer(username: widget.username),
      Expanded(child: MyDrawerList()),  
    ],
  ),
),

      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.blue[200]!,
        backgroundColor: Colors.transparent,
        buttonBackgroundColor: Colors.amber[300],
        
          height: navBarHeight ,
          index: index,
          items:items,

        onTap: (index) => setState(() => this.index = index),

      )
    );
  }


//Build List of 
Widget MyDrawerList() {
    return ListView(
      padding: EdgeInsets.zero,
      children: drawerItems.asMap().entries.map((entry) {
        int dindex = entry.key;
        var item = entry.value;

        return ListTile(
          leading: Icon(
            item["icon"],
            color: selectedDrawindex == dindex
                ? Colors.blue
                : Colors.black,
          ),
          title: Text(
            item["title"],
            style: TextStyle(
              fontSize: 16,
              color: selectedDrawindex == dindex
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
          selected: selectedDrawindex == dindex,
          selectedTileColor: Colors.blue.withOpacity(0.1),

          onTap: () {
            _onDrawerItemTap(dindex);
          },
        );
      }).toList(),
    );
    
  }
void _onDrawerItemTap(int dindex) {
  Navigator.pop(context);

  if (drawerItems[dindex]["title"] == "Logout") {
        Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const Mylogin()),
    );

    return;
  }

  setState(() {
    selectedDrawindex = dindex; 
  });
}
}










//----------------------
  // Widget MyDrawerList(){
  //   return Container(
  //    padding: EdgeInsets.only(top: 15),
  //    child: Column(
  //     children: [
  //       menuItems(),
  //     ],
  //    ),
  //   );
  // }

//   Widget menuItems(){
//     return Material(
//       child: InkWell(
//         onTap: (){},
//         child: Padding(
//           padding: EdgeInsets.all(15.0),
//           child: Row(
//             children: [
//               Expanded(child: Icon(Icons.dashboard_outlined,size: 20, color: Colors.black,)),
//               Expanded( flex: 3,child: Text("Dashboard",style: TextStyle(color: Colors.black,fontSize: 16),),),

//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



