import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/login.dart';

void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Mylogin(),
      // Scaffold(
        
//         // appBar: AppBar(
//           centerTitle: true,
//           title: Text("Login Here",
//           style: TextStyle(
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//             color: Colors.white,
//             letterSpacing: 1
//           ),
//           ),
//           backgroundColor: Colors.transparent,
//   elevation: 0,
//   leading: Icon(Icons.menu,
//   size: 25.0,
//  color: Colors.white,
//   ),

//   actions: [
//   IconButton(
//     onPressed: () {},
//     icon: Icon(Icons.logout,
//     color: Colors.white,
//     ),
//   ),
// ],

//   flexibleSpace: Container(
//     decoration: const BoxDecoration(
//       gradient: LinearGradient(
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//         colors: [
//           Color(0xFFF58529),
//           Color(0xFFDD2A7B),
//           Color(0xFF8134AF),
//           Color(0xFF515BD4),
//         ],
//       ),
//     ),
//   ),
//         ),
       // body: Center(
          // child: Container(
          //   height: 300,
          //   width: 300,
            
          //   //padding: EdgeInsets.all(25),
          //   //padding: EdgeInsets.symmetric(horizontal: 30,vertical: 30),
          //   decoration: BoxDecoration(
          //     color: Colors.amber,
          //     borderRadius: BorderRadius.circular(25)
          //     ),
          //   padding: EdgeInsets.only(right: 150,top: 250),

          //   // child:  Icon(Icons.favorite,Icons.profile) ,
          //   child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Icon(Icons.favorite,size: 35),
          //             SizedBox(width: 10),
          //             Icon(Icons.person,size: 35),
          //             SizedBox(width: 10),                  
                      
          //             Transform.rotate(
          //             angle: 0.1236,
          //             child: Icon(Icons.send,size: 35),
          //           ),
          //           ],
          //         ),

          //   // child: Text(
          //   //   "Smart Tracker R&D",   
          //     // style: TextStyle(
          //     //   color:Colors.white,
          //     //   fontSize: 25,
          //     //   fontWeight: FontWeight.bold,
          //     // ),
            
          //   ),
          // ),
 //),
///--------------------------------------------//

        // body:ListView(
        //   //mainAxisAlignment: MainAxisAlignment.center,
        //   //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    
        //   children: [

        //     //1
        //     Expanded(
        //       child: Container(
        //         height: 300,
        //          color: Colors.deepPurple,
        //       ),
        //     ),
            
        //     //2
        //     Expanded(
        //       flex: 2,
        //       child: Container(
        //         height: 300,
        //         color: Colors.deepPurple[400],
        //       ),
        //     ),
            
        //     //3
        //      Expanded(
        //        child: Container(
        //         height: 300,
        //         color: Colors.deepPurple[200],
        //                    ),
        //      ),

        //   ],

        // )
       
//--------------------------------------//

  // body: ListView.builder(
  //   itemCount: 10,
  //   itemBuilder:
  //  (context, index)=> ListTile(
  //   title:Text(index.toString()) ,
  //  )),


//=------------------------------------=//

  

       );
  }
}

