import 'package:flutter/material.dart';
import 'package:flutter_application_1/Drawer/my_drawer_header.dart';

import 'package:flutter_application_1/Services/AllServices.dart';
// import 'package:flutter_bottom_nav/Activities/filter_activity.dart';
// import 'package:fluttertoast/fluttertoast.dart';

class DashboardScreen extends StatefulWidget {
 // const DashboardScreen({super.key});



   const DashboardScreen({
    Key? key,
  }) : super(key: key);


  @override
  State<StatefulWidget> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String _currentDate = "Loading...";
  String _currentTiming = "Loading...";
  String _nop = "...";
  String _gwp = "...";
  int _selectedType = 1; // default selection

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchData();
  }

  void _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _currentDate = "20-01-2025";
      _currentTiming = "04:33 AM";
      _nop = "12";
      _gwp = "24.20";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Color(0xFFE9E9E9),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCardItem("Showing Date", _currentDate),
                    _buildCardItem("Timing", _currentTiming),
                    _buildIcon(),
                  ],
                ),
              ),
            ),

            // const SizedBox(height: 10), // adds a gapbetween cards
            Card(
              color: Color(0xFFE9E9E9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  _refreshData();
                },
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: _buildIconhorizontal("refresh"),
                ),
              ),
            ),

            Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildIconhorizontal("status"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDetailItem("NOP", _nop),
                        _buildDetailItem("GWP(In Lacs)", _gwp),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // _buildDetailItem("Month-Year", "January 2026"),
                            Text(
                              "January 2026",
                              style: const TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF17479e),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Row(
                              children: [
                                _buildRadioItem("All", 1),
                                _buildRadioItem("Contact", 2),
                                _buildRadioItem("Lead", 3),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 12),
            _buildGrid(),
          ],
        ),
      ),
    );
  }

  Widget _buildRadioItem(String title, int value) {
    return Row(
      mainAxisSize: MainAxisSize.min, // Keep row tight
      children: [
        SizedBox(
          height: 30, // Reduces vertical space
          width: 30, // Reduces horizontal space
          child: Radio<int>(
            value: value,
            groupValue: _selectedType,
            onChanged: (int? newValue) {
              setState(() {
                _selectedType = newValue!;
              });
            },
          ),
        ),
        Text(title, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  Widget _buildDetailItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF17479e),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildCardItem(String title, String Value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF17479e),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(Value, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

Widget _buildIcon() {
  return InkWell(
    onTap: () {
      print("Filter clicked");
      _onFilterClick(); // your function
    },
    borderRadius: BorderRadius.circular(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Filter",
          style: const TextStyle(
            fontSize: 12,
            color: Color(0xFF17479e),
            fontWeight: FontWeight.bold,
          ),
        ),
        const Icon(
          Icons.filter_alt,
          color: Colors.blue,
          size: 28,
        ),
      ],
    ),
  );
}


  

  Widget _buildIconhorizontal(String flag) {
    String assetPath;
    String displayText;

    if (flag == "refresh") {
      assetPath = 'assets/icons_refresh.png';
      displayText = "Refresh Dashboard";
    } else if (flag == "status") {
      assetPath = 'assets/dashboard_status.png';
      displayText = "Status";
    } else {
      assetPath = 'assets/default_icon.png';
      displayText = "More Info";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // 2. Use Image.asset instead of Icon
        Image.asset(
          assetPath,
          height: 25, // Set size to match your previous Icon size
          width: 25,
          errorBuilder: (context, error, stackTrace) {
            // Fallback in case the image is missing from assets
            return const Icon(Icons.error, color: Colors.red);
          },
        ),
        const SizedBox(width: 10),
        Text(
          displayText,
          style: const TextStyle(
            fontSize: 16,
            color: Color(0xFF17479e),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildCard(CardData data) {
    return Card(
      elevation: 0,
      color: Color(0xFF17479e),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 6),

            Text(
              data.percentage,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBottomMetric(data.nop, "NOP"),
                SizedBox(
                  height: 30, // controls line height
                  child: VerticalDivider(
                    color: Colors.grey,
                    thickness: 1,
                    width: 12,
                  ),
                ),
                _buildBottomMetric(data.gwp, "GWP"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomMetric(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        Text(label, style: const TextStyle(fontSize: 11, color: Colors.white)),
      ],
    );
  }

  Widget _buildGrid() {
    final List<CardData> grid = [
      CardData(title: "Converted", percentage: "2.01%", nop: "9", gwp: "2.68"),
      CardData(title: "Lost", percentage: "0.00%", nop: "0", gwp: "00"),
      CardData(title: "Open", percentage: "97.99%", nop: "438", gwp: "21.68"),
      CardData(title: "Sale Closed", percentage: "0.00%", nop: "0", gwp: "00"),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: grid.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.0,
      ),
      itemBuilder: (context, index) {
        return _buildCard(grid[index]);
      },
    );
  }

  void _refreshData() {

    ToastService.showToast(context, message: "Refreshing Data...");
    // ScaffoldMessenger.of(context).showSnackBar(
    //   const SnackBar(
    //     content: Text("Refreshing data..."),
    //     duration: Duration(seconds: 2),
    //   ),
    // );
    if (!mounted) return;

    // Fluttertoast.showToast(
    //   msg: "Refreshing data...",
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.SNACKBAR,
    // );
  }

  void _onFilterClick() {
    // Navigator.push(
    //   context,
    //   MaterialPageRoute(builder: (context) => const FilterActivity()),
    // );
  }
}

class CardData {
  final String title;
  final String percentage;
  final String nop;
  final String gwp;

  CardData({
    required this.title,
    required this.percentage,
    required this.nop,
    required this.gwp,
  });
}

