
import 'package:flutter/material.dart';

class MyCreateLead extends StatefulWidget{
 const MyCreateLead({Key? key}):super(key: key);
 
  @override
  State<StatefulWidget> createState()=> _MyCreateLead();
  
}

class _MyCreateLead extends State<MyCreateLead>{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;


  return Scaffold(

     body:SingleChildScrollView(
      padding: const EdgeInsets.all(12.0),
      child:Column(
        crossAxisAlignment:CrossAxisAlignment.start,
        

        
      )
     )
  );
  }

}