import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_application_1/Drawer/my_drawer_header.dart';
import 'package:flutter_application_1/Fragments/calendar_fragment.dart';
import 'package:flutter_application_1/Fragments/create_lead_fragment.dart';
import 'package:flutter_application_1/Fragments/dashboard_fragment.dart';
import 'package:flutter_application_1/Fragments/search_fragment.dart';
import 'package:flutter_application_1/Fragments/setting_fragment.dart';
import 'package:flutter_application_1/Activitypages/login.dart';
import 'package:flutter_application_1/Popup/popup.dart';


class MyMain extends StatefulWidget {
  final String username;

  const MyMain({
    Key? key,
    required this.username,
  }) : super(key: key);

  @override
  State<MyMain> createState() => _MyMainState();
}

class _MyMainState extends State<MyMain> {
  int _currentIndex = 2;
  int _selectedDrawerIndex = 0;

  late final List<Widget> _pages;
  void _showLogoutDialog() {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (context) {
      return CommonPopup(
        title: "Logout",
        message: "Do you want to logout?",
        onNo: () {
          Navigator.pop(context); // close dialog
        },
        onYes: () {
          Navigator.pop(context); // close dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const Mylogin()),
          );
        },
      );
    },
  );
}

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, dynamic>> _drawerItems = [
    {"icon": Icons.schedule, "title": "Schedules"},
    {"icon": Icons.notifications, "title": "Notifications"},
    {"icon": Icons.person, "title": "Add Customer Contact"},
    {"icon": Icons.face, "title": "Add Agent Contact Details"},
    {"icon": Icons.construction, "title": "Settings"},
    {"icon": Icons.loop_sharp, "title": "Sync Data"},
    {"icon": Icons.delete_outline, "title": "Clear App Data"},
    {"icon": Icons.contact_support, "title": "About"},
    {"icon": Icons.power, "title": "Logout"},
  ];

  @override
  void initState() {
    super.initState();

    _pages = [
      const SearchFragment(),
      const Calendar(),
      MyDashboard(username: widget.username),
      const MyCreateLead(),
      const MySetting(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    double navBarHeight = screenHeight * 0.10;
    if (navBarHeight > 75) navBarHeight = 75;

    return Scaffold(
      key: _scaffoldKey,

      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Colors.black, size: 35),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Image.asset(
          'assets/IGI_Logo.png',
          height: screenHeight * 0.06,
          fit: BoxFit.contain,
        ),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            MyHeaderDrawer(username: widget.username),
            Expanded(child: _buildDrawerList()),
          ],
        ),
      ),

      body: SafeArea(
        child: IndexedStack(
          index: _currentIndex,
          children: _pages,
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: CurvedNavigationBar(
          index: _currentIndex,
          height: navBarHeight,
          color: Color(0xFF00D4FF),
          backgroundColor: Colors.transparent,
          buttonBackgroundColor: Colors.amber.shade300,
          items: const [
            _NavItems(icon: Icons.search, label: "Search"),
            _NavItems(icon: Icons.calendar_today, label: "Calendar"),
            _NavItems(icon: Icons.dashboard, label: "Dashboard", big: true),
            _NavItems(icon: Icons.create, label: "Create Lead"),
            _NavItems(icon: Icons.settings, label: "Settings"),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
    );
  }

  // ---------------- Drawer List ----------------

  Widget _buildDrawerList() {
    return ListView.builder(
      itemCount: _drawerItems.length,
      itemBuilder: (context, index) {
        final item = _drawerItems[index];

        return ListTile(
          leading: Icon(
            item["icon"],
            color: _selectedDrawerIndex == index
                ? Colors.blue
                : Colors.black,
          ),
          title: Text(
            item["title"],
            style: TextStyle(
              color: _selectedDrawerIndex == index
                  ? Colors.blue
                  : Colors.black,
            ),
          ),
          selected: _selectedDrawerIndex == index,
          onTap: () => _onDrawerItemTap(index),
        );
      },
    );
  }

  // ---------------- Drawer Click Handler ----------------

  void _onDrawerItemTap(int index) {
    Navigator.pop(context);

    if (_drawerItems[index]["title"] == "Logout") {
      _showLogoutDialog();
      return;
    }

    setState(() {
      _selectedDrawerIndex = index;
    });
  }
}

// ---------------- Bottom Nav Item Widget ----------------

class _NavItems extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool big;

  const _NavItems({
    required this.icon,
    required this.label,
    this.big = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: big ? 34 : 26),
        const SizedBox(height: 2),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }



}

