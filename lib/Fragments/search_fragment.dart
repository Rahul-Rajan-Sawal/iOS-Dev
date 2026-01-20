
import 'package:flutter/material.dart';
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


class _SearchFragmentState extends State<SearchFragment>{
  final TextEditingController prosp1Crtl = TextEditingController();
  final TextEditingController PolNoCrtl  = new TextEditingController();
  final TextEditingController MobNoCrtl  = new TextEditingController();
  final TextEditingController PolEndDateFrm = new TextEditingController();
  final TextEditingController PolEndDateTo =new TextEditingController();

  String? LOB;
  String? AllProd;
  String? AllAgents;
  String? AllVerticalCode;


  //for Dropdata 
 List <String> dropdownData=[];
 bool loading = true;

 @override
 void initState(){
  super.initState();  //initializws the state 
  loadDropdownData();   ///this will call the dropdown values after the fragment ui loades 
 }


Future <void> loadDropdownData() async{
  //simulate API
  setState(() {
    dropdownData =[
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

    DateTime? date = await showDatePicker(    //this will open native date picker iin phone
      context: context,
      initialDate: DateTime.now(), 
      firstDate: DateTime(1900), 
      lastDate: DateTime(2050));
      
      
      if(date !=null){
        dtcontroller.text="${date.day}-${date.month}-${date.year}";
      }
}

void cleanForm(){
  prosp1Crtl.clear();  
PolNoCrtl.clear();  
MobNoCrtl.clear(); 
PolEndDateFrm.clear();
PolEndDateTo.clear();

  setState(() {
    LOB = null;
    AllProd = null;
    AllAgents=null;
    AllVerticalCode=null;
  });
}

void onSearch(){
print("Lead/Prosp No  : ${prosp1Crtl.text}");
print("Policy Number  : ${PolNoCrtl.text}");
print("Mobile No      : ${MobNoCrtl.text} ");
print("LOB Selected   : ${LOB} ");
print("Prod Selected  : ${AllProd}");
print("Agent Selected : ${AllAgents}");
print("VerticalCode   : ${AllVerticalCode}");

}






  @override
  Widget build(BuildContext context) {
      SizeConfig.init(context); // initialize once

    if(loading){
      return const Center(child:CircularProgressIndicator());
    }
    return SingleChildScrollView(
      padding: const EdgeInsets.all(15),
      child:Column(children: [
        const SizedBox(height: 15,),
        buildTextField(prosp1Crtl, "Lead / Prosp Number"),
        const SizedBox(height: 10,),
        buildTextField(PolNoCrtl, "Policy Number "),
        const SizedBox(height: 10,),
        buildTextField(MobNoCrtl, "Mobile Number "),
        const SizedBox(height: 10,),
        buildDropdown("LOB",LOB,(v)=>setState(()=>LOB = v)),
        const SizedBox(height: 10,),
        buildDropdown("All Products",AllProd,(v)=>setState(()=> AllProd= v)),
        const SizedBox(height: 10,),
        buildDropdown("All Agents",AllAgents,(v)=>setState(()=>AllAgents = v)),
        const SizedBox(height: 10,),
        buildDropdown("All Vertical Code",AllVerticalCode,(v)=>setState(()=>AllVerticalCode = v)),
         const SizedBox(height: 10,),
        buildDateField("Policy End Date From", PolEndDateFrm),
        const SizedBox(height: 10,),
        buildDateField("Policy End Date To", PolEndDateTo),
        const SizedBox(height: 25),

        Row(children: [
          Expanded(
            child: OutlinedButton
            (onPressed: cleanForm,
            child: const Text("Clear"),)),

            const SizedBox(height:25),
            Expanded(child: ElevatedButton(
              onPressed: onSearch,
              child: const Text("Search"),
            ))
        ],)

      ],),
    );
    
  }


  //UI helper Classes


  Widget buildTextField(TextEditingController controller,String labelText){
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
child: Container(
height: SizeConfig.screenHeight * 0.05, // responsive height
decoration: BoxDecoration(

  color: Colors.white,
  boxShadow: [
    BoxShadow(
  
     color: Colors.grey.withOpacity(0.4),
      spreadRadius: 2,
      blurRadius: 6,
      offset: const Offset(0, 3),
    ),
  ],
),
        child:TextField(controller: controller,
      
      decoration: InputDecoration(
        
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      )
   
),

 );
  }
Widget buildDropdown(
  String labelText,
  String? value,
  ValueChanged<String?> onChanged,
) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Container(
            height: SizeConfig.screenHeight * 0.05, // responsive height
      decoration: BoxDecoration(
        color: Colors.white,
       // borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        isExpanded: true,
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
          labelText: labelText,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
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
    child: Container(
    height: SizeConfig.screenHeight * 0.05, // responsive height

      decoration: BoxDecoration(
        color: Colors.white,
       // borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          
          BoxShadow(
            color: Colors.black26,
            blurRadius: 6,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        readOnly: true,
        onTap: () => pickDate(controller),
        decoration: InputDecoration(
          labelText: labelText,
          suffixIcon: const Icon(Icons.calendar_today),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        ),
      ),
    ),
  );
}


  //buildTextField(TextEditingController prosp1crtl, String s) {}

  //buildDropdown(String s, String? lob, void Function(v) param2) {}

  //buildDateField(String s, TextEditingController polEndDateFrm) {}
  

}