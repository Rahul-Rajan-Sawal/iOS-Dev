import 'package:flutter/material.dart';

class LeadSummary extends StatefulWidget {
  final Map<String, dynamic> lead;

  const LeadSummary({Key? key, required this.lead}) : super(key: key);

  @override
  State<LeadSummary> createState() => _LeadSummaryState();
}

class _LeadSummaryState extends State<LeadSummary> {


  @override
  void initState() {
    super.initState();

    debugPrint("Lead Summary Loaded for leadId");
  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        appBar: AppBar(
        title: const Text("Leads Summary"),
        elevation: 0,
         backgroundColor: Colors.transparent,
          iconTheme: const IconThemeData(color: Colors.white),
         flexibleSpace: Container
         (
         decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF090979), 
            Color(0xFF00D4FF),                 
            ],
            ),
          ),
         ),
      ),





      body:SingleChildScrollView(
        padding: const EdgeInsets.all(12.0),
        child:Column(
          crossAxisAlignment:CrossAxisAlignment.start,
          children:[
             Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:50),
                                    const Text(
                                      "Lead Detail",
                                      style: TextStyle(
                                        color: Color(0xFF17479E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          "Product",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          ":policyName",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 15),
                                        child: Text(
                                          "Policy Number",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 15),
                                        child: Text(
                                          ": policyNumber",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Lead Type",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ": leadType",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Premium",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":premium",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Vehicle Make & Model",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":vehicleMakeModel",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "NCB",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":ncb",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Add-On",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":addOn",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),


                              ],
                            ),
                          ),
            ),
            const SizedBox(height: 16),
            Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:50),
                                    const Text(
                                      "Lead Detail",
                                      style: TextStyle(
                                        color: Color(0xFF17479E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          "Product",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          ":policyName",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 15),
                                        child: Text(
                                          "Policy Number",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 15),
                                        child: Text(
                                          ": policyNumber",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Lead Type",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ": leadType",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Premium",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":premium",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Vehicle Make & Model",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":vehicleMakeModel",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "NCB",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":ncb",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Add-On",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":addOn",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),


                              ],
                            ),
                          ),
            ),
            const SizedBox(height: 16),
            Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(24, 0, 24, 5),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.start,
                                  children: [
                                    const SizedBox(height:50),
                                    const Text(
                                      "Lead Detail",
                                      style: TextStyle(
                                        color: Color(0xFF17479E),
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                   
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          "Product",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.symmetric(
                                                vertical: 5),
                                        child: Text(
                                          ":policyName",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      width: 150,
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 15),
                                        child: Text(
                                          "Policy Number",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                     Expanded(
                                      child: Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(
                                                0, 8, 0, 15),
                                        child: Text(
                                          ": policyNumber",
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight:
                                                FontWeight.w600,
                                            color:
                                                Color(0xFF17479E),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),

                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Lead Type",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ": leadType",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Premium",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":premium",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                                ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Vehicle Make & Model",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":vehicleMakeModel",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                            Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "NCB",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":ncb",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),

                              Row(
                                  crossAxisAlignment:CrossAxisAlignment.start,
                                  children:[
                                    const SizedBox (
                                      width:150,
                                      child: Padding(
                                        padding:EdgeInsets.fromLTRB(0,8,0,15),
                                        child:Text(
                                          "Add-On",
                                          style:TextStyle(
                                            fontSize:15,
                                          fontWeight:FontWeight.w600,
                                          color:Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),

                                     Expanded(
                                      child:Padding(padding:EdgeInsets.fromLTRB(0,8,0,15),
                                      child:Text(
                                        ":addOn",
                                        style:TextStyle(
                                          fontSize:15,
                                        fontWeight:FontWeight.w600,
                                        color:Color(0xFF17479E),
                                        )
                                      ),
                                      )
                                    )
                                  ],
                            ),


                              ],
                            ),
                          ),
            ),
            const SizedBox(height: 16),
          ],
        )
      )
    );
  }
}
