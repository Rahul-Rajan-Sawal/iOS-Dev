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
    "mobilenumber": "XXXXXX3782",
    "emailid": "rahul1@krishmark.com",
    "activitystatus": "Pending for contact verification",
    "remark": "N/A",
    "policynumber": "1232781927378",
    "leadtype": "Contact",
    "premium": 98956710.0,
    "vehiclemakemodel": "Koenigsegg Jesko Absolut",
    "ncb": "No",
    "addon": "Not Available",
    "activity": "N/A",
    "activitydoneby": "N/A",
    "activitydate": "01-02-2026",
    "tremark":"Not available",
    "leadstatus": "WIP",
    "workflowstatus": "Assigned to sales manager – pending for mail verification",
  },
  {
    "name": "Sameer Sahu",
    "policyName": "Life Secure Self Cure",
    "leadId": "LD00223452",
    "leadAmount": 42000,
    "mobilenumber": "XXXXXX1198",
    "emailid": "sameer.sahu@krishmark.com",
    "activitystatus": "Contacted",
    "remark": "Customer requested callback",
    "policynumber": "8765432198765",
    "leadtype": "Lead",
    "premium": 42000.0,
    "vehiclemakemodel": "Toyota Fortuner",
    "ncb": "N/A",
    "addon": "Not Available",
    "activity": "Outbound Call",
    "activitydoneby": "Agent_102",
    "activitydate": "28-01-2026",
    "tremark":"Not available",
    "leadstatus": "In Progress",
    "workflowstatus": "Callback scheduled",
  },
  {
    "name": "Keshav Khatri",
    "policyName": "Car Protect",
    "leadId": "LD00332342",
    "leadAmount": 18000,
    "mobilenumber": "XXXXXX5521",
    "emailid": "keshav.k@krishmark.com",
    "activitystatus": "Interested",
    "remark": "Quotation shared",
    "policynumber": "3456789012345",
    "leadtype": "Lead",
    "premium": 18000.0,
    "vehiclemakemodel": "Hyundai Creta",
    "ncb": "Yes",
    "addon": "Engine Protect",
    "activity": "Quote Sent",
    "activitydoneby": "Agent_089",
    "activitydate": "27-01-2026",
    "tremark":"Not available",
    "leadstatus": "WIP",
    "workflowstatus": "Awaiting customer confirmation",
  },
  {
    "name": "Vikash Jagtap",
    "policyName": "Car Protect",
    "leadId": "LD00323621",
    "leadAmount": 18000,
    "mobilenumber": "XXXXXX8843",
    "emailid": "vikash.j@krishmark.com",
    "activitystatus": "Not Reachable",
    "remark": "Phone switched off",
    "policynumber": "9081726354512",
    "leadtype": "Contact",
    "premium": 18000.0,
    "vehiclemakemodel": "Honda City",
    "ncb": "Yes",
    "addon": "Zero Dep",
    "activity": "Call Attempt",
    "activitydoneby": "Agent_045",
    "activitydate": "26-01-2026",
    "tremark":"Not available",
    "leadstatus": "Open",
    "workflowstatus": "Pending contact verification",
  },
  {
    "name": "Amit Yadav",
    "policyName": "Car Protect",
    "leadId": "LD00364534",
    "leadAmount": 18000,
    "mobilenumber": "XXXXXX6629",
    "emailid": "amit.yadav@krishmark.com",
    "activitystatus": "Converted",
    "remark": "Policy issued successfully",
    "policynumber": "5647382910456",
    "leadtype": "Lead",
    "premium": 18000.0,
    "vehiclemakemodel": "Maruti Baleno",
    "ncb": "No",
    "addon": "Roadside Assistance",
    "activity": "Policy Issued",
    "activitydoneby": "Agent_011",
    "activitydate": "25-01-2026",
    "tremark":"Not available",
    "leadstatus": "Closed",
    "workflowstatus": "Policy active",
  },
  {
    "name": "Vishal Kumar",
    "policyName": "Car Protect",
    "leadId": "LD00325577",
    "leadAmount": 18000,
    "mobilenumber": "XXXXXX7712",
    "emailid": "vishal.kumar@krishmark.com",
    "activitystatus": "Pending",
    "remark": "Documents awaited",
    "policynumber": "1122334455667",
    "leadtype": "Lead",
    "premium": 18000.0,
    "vehiclemakemodel": "Tata Nexon",
    "ncb": "Yes",
    "addon": "Not Available",
    "activity": "Doc Follow-up",
    "activitydoneby": "Agent_066",
    "activitydate": "24-01-2026",
    "tremark":"Not available",
    "leadstatus": "WIP",
    "workflowstatus": "Pending document upload",
  },
  {
    "name": "Sumit Jadav",
    "policyName": "Car Protect",
    "leadId": "LD00364335",
    "leadAmount": 18000,
    "mobilenumber": "XXXXXX9981",
    "emailid": "sumit.jadav@krishmark.com",
    "activitystatus": "Interested",
    "remark": "Requested premium breakup",
    "policynumber": "7788990011223",
    "leadtype": "Lead",
    "premium": 18000.0,
    "vehiclemakemodel": "Kia Seltos",
    "ncb": "No",
    "addon": "Zero Dep",
    "activity": "Call Completed",
    "activitydoneby": "Agent_032",
    "activitydate": "23-01-2026",
    "tremark":"Not available",
    "leadstatus": "Open",
    "workflowstatus": "Awaiting customer decision",
  },
  {
    "name": "Chinna Swami Mutta Swami Venugupal Ayier",
    "policyName": "Car Protect All Cars",
    "leadId": "LD00335234",
    "leadAmount": 180007544,
    "mobilenumber": "XXXXXX4455",
    "emailid": "chinna.swami@krishmark.com",
    "activitystatus": "High Value Lead",
    "remark": "Priority handling assigned",
    "policynumber": "9998887776665",
    "leadtype": "VIP Lead",
    "premium": 180007544.0,
    "vehiclemakemodel": "Bugatti Chiron SS",
    "ncb": "Yes",
    "addon": "All Add-ons",
    "activity": "VIP Assignment",
    "activitydoneby": "Senior Manager",
    "activitydate": "22-01-2026",
    "tremark":"Not available",
    "leadstatus": "WIP",
    "workflowstatus": "Handled by senior sales team",
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
                  }, 
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
        elevation: 4, 
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
        child: SizedBox(
          height: SizeConfig.screenHeight * 0.05,
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: labelText,
              floatingLabelBehavior:
                  FloatingLabelBehavior.auto, 
              contentPadding: const EdgeInsets.fromLTRB(14, 20, 14, 16),
              border: const OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }

  

//----------------
  Widget buildDropdown(
    String labelText,
    String? value,
    ValueChanged<String?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Material(
        elevation: 4, 
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

 

}
