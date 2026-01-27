import 'package:flutter/material.dart';
import 'package:flutter_application_1/Activitypages/searchedlead.dart';
//import androidx.appcompat.app.AppCompatActivity;

class SearchFragment extends StatefulWidget {
  const SearchFragment({Key? key}) : super(key: key);

  @override
  State<SearchFragment> createState() => _SearchFragmentState();
}

class SizeConfig {
  static late double screenHeight;
  static late double screenWidth;

  static void init(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
  }
}

class _SearchFragmentState extends State<SearchFragment> {
  final TextEditingController prosp1Crtl = TextEditingController();
  final TextEditingController PolNoCrtl = new TextEditingController();
  final TextEditingController MobNoCrtl = new TextEditingController();
  final TextEditingController PolEndDateFrm = new TextEditingController();
  final TextEditingController PolEndDateTo = new TextEditingController();

  String? LOB;
  String? AllProd;
  String? AllAgents;
  String? AllVerticalCode;


// 🔹 Simulated API response (ArrayList)
List<Map<String, dynamic>> dummyLeadResponse = [
  {
    "name": "Rahul Sawal",
    "policyName": "Health Plus",
    "leadId": "LD00187658",
    "leadAmount": 25000,
  },
  {
    "name": "Sameer Sahu",
    "policyName": "Life Secure Self Cure ",
    "leadId": "LD00223452",
    "leadAmount": 42000,
  },
  {
    "name": "Keshav Khatri",
    "policyName": "Car Protect",
    "leadId": "LD00332342",
    "leadAmount": 18000,
  },
  {
    "name": "Vikash Jagtap",
    "policyName": "Car Protect",
    "leadId": "LD00323621",
    "leadAmount": 18000,
  },
  {
    "name": "Amit Yadav",
    "policyName": "Car Protect",
    "leadId": "LD00364534",
    "leadAmount": 18000,
  },
  {
    "name": "Vishal Kumar",
    "policyName": "Car Protect",
    "leadId": "LD00325577",
    "leadAmount": 18000,
  },
  {
    "name": "Sumit Jadav",
    "policyName": "Car Protect",
    "leadId": "LD00364335",
    "leadAmount": 18000,
  },
  {
    "name": "Chinna Swami Mutta Swami Venugupal Ayier",
    "policyName": "Car Protect all cars self and incident car ",
    "leadId": "LD00335234",
    "leadAmount": 180007544,
  },
];

  //for Dropdata
  List<String> dropdownData = [];
  bool loading = true;

  @override
  void initState() {
    super.initState(); //initializws the state
    loadDropdownData();

    ///this will call the dropdown values after the fragment ui loades
  }

  Future<void> loadDropdownData() async {
    //simulate API
    setState(() {
      dropdownData = [
        'Option 1',
        'Option 2',
        'Option 3',
        'Option 4',
        'Option 5',
      ];
      loading = false;
    });
  }

//for date controlls
  Future<void> pickDate(TextEditingController dtcontroller) async {
    DateTime? date = await showDatePicker(
        //this will open native date picker iin phone
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2050));

    if (date != null) {
      dtcontroller.text = "${date.day}-${date.month}-${date.year}";
    }
  }

  void cleanForm() {
    prosp1Crtl.clear();
    PolNoCrtl.clear();
    MobNoCrtl.clear();
    PolEndDateFrm.clear();
    PolEndDateTo.clear();

    setState(() {
      LOB = null;
      AllProd = null;
      AllAgents = null;
      AllVerticalCode = null;
    });
  }

  void onSearch() {
    print("Lead/Prosp No  : ${prosp1Crtl.text}");
    print("Policy Number  : ${PolNoCrtl.text}");
    print("Mobile No      : ${MobNoCrtl.text} ");
    print("LOB Selected   : ${LOB} ");
    print("Prod Selected  : ${AllProd}");
    print("Agent Selected : ${AllAgents}");
    print("VerticalCode   : ${AllVerticalCode}");
    print("Start Date   : ${PolEndDateFrm}");
    print("End Date   : ${PolEndDateTo}");
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context); // initialize once

    if (loading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            
            buildTextField(prosp1Crtl, "Lead / Prosp Number"),
            const SizedBox(
              height: 15,
            ),
            buildTextField(PolNoCrtl, "Policy Number "),
            const SizedBox(
              height: 10,
            ),
            buildTextField(MobNoCrtl, "Mobile Number "),
            const SizedBox(
              height: 10,
            ),
            buildDropdown("LOB", LOB, (v) => setState(() => LOB = v)),
            const SizedBox(
              height: 10,
            ),
            buildDropdown(
                "All Products", AllProd, (v) => setState(() => AllProd = v)),
            const SizedBox(
              height: 10,
            ),
            buildDropdown(
                "All Agents", AllAgents, (v) => setState(() => AllAgents = v)),
            const SizedBox(
              height: 10,
            ),
            buildDropdown("All Vertical Code", AllVerticalCode,
                (v) => setState(() => AllVerticalCode = v)),
            const SizedBox(
              height: 10,
            ),
            buildDateField("Policy End Date From", PolEndDateFrm),
            const SizedBox(
              height: 10,
            ),
            buildDateField("Policy End Date To", PolEndDateTo),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                  onPressed: cleanForm,
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.blue[400],
                    elevation: 4,
                  ),
                  child: const Text("Clear"),
                )),
                const SizedBox(width: 15),
                const SizedBox(height: 25),
                Expanded(
                    child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    elevation: 4,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchedLead(
        leadList: dummyLeadResponse,
      ),

                      )
                    );
                  }, //onSearch(context); ,
                  child: const Text("Search"),
                ))
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String labelText) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4, // real Material elevation
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior:
                  FloatingLabelBehavior.auto, // make label float properly
              contentPadding: const EdgeInsets.fromLTRB(14, 20, 14, 16),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  //UI helper Classes

//   Widget buildTextField(TextEditingController controller,String labelText){
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 12),
// child: Container(
// height: SizeConfig.screenHeight * 0.05, // responsive height
// decoration: BoxDecoration(
//   color: Colors.white,
//   boxShadow: [
//     BoxShadow(

//      color: Colors.grey.withOpacity(0.4),
//       spreadRadius: 2,
//       blurRadius: 6,
//       offset: const Offset(0, 3),
//     ),
//   ],
// ),
//         child:TextField(controller: controller,

//       decoration: InputDecoration(

//         labelText: labelText,
//         border: const OutlineInputBorder(),
//       ),
//       )

// ),

//  );
//   }

//----------------
  Widget buildDropdown(
    String labelText,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4, // ✅ replaces boxShadow
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: DropdownButtonFormField<String>(
            value: value,
            isExpanded: true,
            isDense: true,
            items: dropdownData
                .map(
                  (e) => DropdownMenuItem<String>(
                    value: e,
                    child: Text(e),
                  ),
                )
                .toList(),
            onChanged: onChanged,
            decoration: InputDecoration(
              hintText: labelText,
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(12, 18, 12, 14),
            ),
          ),
        ),
      ),
    );
  }

// Widget buildDropdown(
//   String labelText,
//   String? value,
//   ValueChanged<String?> onChanged,
// ) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 12),
//     child: Container(
//             height: SizeConfig.screenHeight * 0.05, // responsive height
//       decoration: BoxDecoration(
//         color: Colors.white,
//        // borderRadius: BorderRadius.circular(8),
//         boxShadow: const [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: DropdownButtonFormField<String>(
//         value: value,
//         isExpanded: true,
//         items: dropdownData
//             .map(
//               (e) => DropdownMenuItem<String>(
//                 value: e,
//                 child: Text(e),
//               ),
//             )
//             .toList(),
//         onChanged: onChanged,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: InputBorder.none,
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//         ),
//       ),
//     ),
//   );
// }

// Widget buildDateField(
//   String labelText,
//   TextEditingController controller,
// ) {
//   return Padding(
//     padding: const EdgeInsets.only(bottom: 12),
//     child: Container(
//     height: SizeConfig.screenHeight * 0.05, // responsive height

//       decoration: BoxDecoration(
//         color: Colors.white,
//        // borderRadius: BorderRadius.circular(8),
//         boxShadow: const [

//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 6,
//             offset: Offset(0, 3),
//           ),
//         ],
//       ),
//       child: TextField(
//         controller: controller,
//         readOnly: true,
//         onTap: () => pickDate(controller),
//         decoration: InputDecoration(
//           labelText: labelText,
//           suffixIcon: const Icon(Icons.calendar_today),
//           border: InputBorder.none,
//           contentPadding:
//               const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//         ),
//       ),
//     ),
//   );
// }

  Widget buildDateField(
    String labelText,
    TextEditingController controller,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4,
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: TextField(
            controller: controller,
            readOnly: true,
            onTap: () => pickDate(controller),
            decoration: InputDecoration(
              hintText: labelText,
              suffixIcon: const Icon(Icons.calendar_today),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.fromLTRB(14, 16, 14, 14),
            ),
          ),
        ),
      ),
    );
  }

  //buildTextField(TextEditingController prosp1crtl, String s) {}

  //buildDropdown(String s, String? lob, void Function(v) param2) {}

  //buildDateField(String s, TextEditingController polEndDateFrm) {}

}
