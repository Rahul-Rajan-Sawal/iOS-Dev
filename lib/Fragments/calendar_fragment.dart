import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';


class Calendar extends StatefulWidget {
  const Calendar({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyCalendar();
}

class _MyCalendar extends State<Calendar> {

CalendarController _calendarController = CalendarController();

  // Date & timing
  String _currentDate = "Loading...";
  String _currentTiming = "Loading...";
  String _nop = "...";
  String _gwp = "...";


  late final DateTime firstDate;
  late final DateTime lastDate;

  // Leads data
  int totalLeads = 13;
  int convertedLeads = 1;
  int wipLeads = 12;
  int lostLeads = 0;

  // Radio / filter
  String selectedFilter = "Option1"; // default selection
  int _selectedType = 1; // not used yet, can remove if unnecessary

  final Map<DateTime, int> dayCounts = {
    DateTime(2026, 1, 5): 3,
    DateTime(2026, 1, 10): 7,
    DateTime(2026, 1, 15): 1,
  };


  @override
  void initState() {
    super.initState();
    _fetchData(); 
    _calendarController = CalendarController();

    final now = DateTime.now();
    firstDate = DateTime(now.year, now.month - 2, 1);  
    lastDate = DateTime(now.year, now.month + 2, 0);   

  }
  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }


  // Simulate API / data fetching
  void _fetchData() async {
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _currentDate = "20-01-2025";
      _currentTiming = "04:33 AM";
      _nop = "12";
      _gwp = "24.20";
      totalLeads = 13;
      convertedLeads = 1;
      wipLeads = 12;
      lostLeads = 0;
    });
  }

  void _refreshData() {
    print("Refresh button clicked");
    _fetchData();
  }

  void _onFilterClick() {
    print("Filter button clicked");
  }

 @override
Widget build(BuildContext context) {
  return Scaffold(
    body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 14),

          // Date & Timing Card
          Card(
            color: const Color(0xFFE9E9E9),
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

          const SizedBox(height: 10),

          // Leads Card
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            elevation: 4,
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF090979),
                    Color(0xFF00D4FF),
                  ],
                ),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    "Total Leads",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    totalLeads.toString(),
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  const Text(
                    "Total WIP renewal lead of selected month",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _statusText("Converted", convertedLeads),
                        _statusText("WIP Lead", wipLeads),
                        _statusText("Lead Lost", lostLeads),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Refresh Card
          Card(
            color: const Color(0xFFE9E9E9),
            child: InkWell(
              onTap: _refreshData,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.loop, color: Colors.red[900], size: 30),
                    const SizedBox(width: 10),
                    const Text(
                      "Refresh",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // ✅ 
          TableCalendar(
  calendarController: _calendarController,
  startingDayOfWeek: StartingDayOfWeek.monday,   
  availableCalendarFormats: const {
    CalendarFormat.month: 'Month',
  },
  headerStyle: HeaderStyle(
    centerHeaderTitle: true,
    formatButtonVisible: false,
  ),
    onVisibleDaysChanged: (first, last, format) {
    final now = DateTime.now();
    final earliest = DateTime(now.year, now.month - 2, 1);
    final latest = DateTime(now.year, now.month + 3, 0);

    if (first.isBefore(earliest)) {
      _calendarController.setSelectedDay(earliest);
    } else if (last.isAfter(latest)) {
      _calendarController.setSelectedDay(latest);
    }
  },

  builders: CalendarBuilders( // 👈 IMPORTANT
    dayBuilder: (context, date, events) {
      final key = DateTime(date.year, date.month, date.day);
      final count = dayCounts[key];

      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${date.day}'),
          if (count != null)
            Container(
              margin: const EdgeInsets.only(top: 4),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                '$count',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 10,
                ),
              ),
            ),
        ],
      );
    },
  ),
),


          const SizedBox(height: 20),
        ],
      ),
    ),
  );
}


  // Helper: Card item
  Widget _buildCardItem(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF17479e),
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(value,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Helper: Status item
  Widget _statusText(String title, int value) {
    return Column(
      children: [
        Text(title,
            style: const TextStyle(color: Colors.white, fontWeight:FontWeight.bold, fontSize: 15)),
        const SizedBox(height: 4),
        Text(value.toString(),
            style: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ],
    );
  }

  // Helper: Filter icon
  Widget _buildIcon() {
    return InkWell(
      onTap: _onFilterClick,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "Filter",
            style: TextStyle(
                fontSize: 14, color: Color(0xFF17479e), fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.filter_list,
            size: 20,
            color: Colors.blue,
          ),
        ],
      ),
    );
  }

  // Helper: Horizontal icon + text
  Widget _buildIconhorizontal(String flag) {
    String assetPath;
    String displayText;

    if (flag == "refresh") {
      assetPath = 'assets/icons_refresh.png';
      displayText = "Refresh Dashboard";
    } else {
      assetPath = 'assets/default_icon.png';
      displayText = "More Info";
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          assetPath,
          height: 25,
          width: 25,
          errorBuilder: (context, error, stackTrace) {
            return const Icon(Icons.error, color: Colors.red);
          },
        ),
        const SizedBox(width: 10),
        Text(
          displayText,
          style: const TextStyle(
              fontSize: 16, color: Color(0xFF17479e), fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  // Radio widget
  Widget _radioItem(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,
          groupValue: selectedFilter,
          activeColor: Colors.white,
          onChanged: (val) {
            setState(() {
              selectedFilter = val!;
            });
          },
        ),
        Text(
          value,
          style: const TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
