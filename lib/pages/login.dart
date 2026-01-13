import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/dashboard.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({super.key});

  @override
  State<Mylogin> createState() => _MyloginState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController passwordController = TextEditingController();

String greetingMessage = "";

class _MyloginState extends State<Mylogin> {
  bool _userIdError = false;
  String _userIdErrorText = "";
  bool _passwordError = false;     
String _passwordErrorText = "";    

final FocusNode _userIdFocus = FocusNode();   
final FocusNode _passwordFocus = FocusNode(); 

  bool _rememberMe = false;
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  void greetUser() {
    setState(() {
      greetingMessage = "Hello " + usernameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    // Scale font size based on screen width
    double scaleFont(double size) {
      return size * screenWidth / 400; // 400 is base width
    }

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: screenHeight * 0.03),

              Text(
                "Welcome!",
                style: TextStyle(
                  fontSize: scaleFont(22),
                  fontWeight: FontWeight.w400,
                ),
              ),

              Text(
                "Sign in to your account",
                style: TextStyle(
                  fontSize: scaleFont(12),
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),

              // Image Row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/time.png",
                    height: screenHeight * 0.12,
                    width: screenWidth * 0.5,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.02),

              Text(
                "Timesheet Manager",
                style: TextStyle(
                  fontSize: scaleFont(23),
                  fontWeight: FontWeight.bold,
                  color: Colors.deepOrange
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              //extra greeting msg
              // Text(
              //   greetingMessage,
              //   style: TextStyle(fontSize: scaleFont(16)),
              // ),
              // SizedBox(height: screenHeight * 0.02),

              // Username TextField
          TextField(
  controller: usernameController,
  focusNode: _userIdFocus, // optional, for focus handling
  onChanged: (value) {
    // Allow only letters & numbers
    final filtered = value.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
    if (filtered != value) {
      usernameController.text = filtered;
      usernameController.selection = TextSelection.fromPosition(
        TextPosition(offset: filtered.length),
      );
    }

    // Reset error on typing
    setState(() {
      _userIdError = false;
      _userIdErrorText = "";
    });
  },
  decoration: InputDecoration(
    labelText: "Employee Code",
    errorText: _userIdError ? _userIdErrorText : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0), // full square border
      borderSide: BorderSide(
        color: _userIdError ? Colors.red : Color(0xFF17479E),
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
        color: _userIdError ? Colors.red : Color(0xFF17479E),
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
        color: _userIdError ? Colors.red : Color(0xFF17479E),
        width: 1.5,
      ),
    ),
  ),
),
              SizedBox(height: screenHeight * 0.015),

              // Password TextField
 TextField(
  controller: passwordController,
  obscureText: _obscurePassword,
  focusNode: _passwordFocus, // optional, for focus handling
  onChanged: (value) {
    // Reset error on typing
    setState(() {
      _passwordError = false;
      _passwordErrorText = "";
    });
  },
  decoration: InputDecoration(
    labelText: "Password",
    errorText: _passwordError ? _passwordErrorText : null,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0), // full square border
      borderSide: BorderSide(
        color: _passwordError ? Colors.red : Color(0xFF17479E),
        width: 1.5,
      ),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
        color: _passwordError ? Colors.red : Color(0xFF17479E),
        width: 1.5,
      ),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(0),
      borderSide: BorderSide(
        color: _passwordError ? Colors.red : Color(0xFF17479E),
        width: 1.5,
      ),
    ),
    suffixIcon: IconButton(
      icon: Icon(
        _obscurePassword ? Icons.visibility_off : Icons.visibility,
      ),
      onPressed: () {
        setState(() {
          _obscurePassword = !_obscurePassword;
        });
      },
    ),
  ),
),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  SizedBox(
                    height: 24,
                    width: 24,
                    child: Checkbox(
                      value: _rememberMe,
                      activeColor: const Color.fromRGBO(23, 71, 158, 1),
                      checkColor: Colors.white,
                      onChanged: (value) {
                        setState(() {
                          _rememberMe = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Remember me",
                    style: TextStyle(
                      fontSize: scaleFont(14),
                      color: Colors.deepOrange
                      ),
                  ),
                  SizedBox(width: 60),
                  Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: scaleFont(14),
                      color: Colors.deepOrange
                    ),
                  ),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              // Login Button
             SizedBox(
  width: screenWidth * 0.6,
  height: screenHeight * 0.07,
  child: ElevatedButton(
    onPressed: () {
      final userId = usernameController.text.trim();
      final password = passwordController.text;

      setState(() {
        _userIdError = userId.isEmpty;
        _userIdErrorText = _userIdError ? "User ID required" : "";

        _passwordError = password.isEmpty;
        _passwordErrorText = _passwordError ? "Password required" : "";
      });

      if (_userIdError || _passwordError) return; // Stop if invalid

      // Navigate if all valid
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>  MyDashboard(
            username: usernameController.text.trim()
          ),
        ),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor:Colors.deepOrange,
    ),
    child: Text(
      "Login",
      style: TextStyle(
        fontSize: scaleFont(21),
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
),

               SizedBox(height: screenHeight * 0.03),

              // Image with overlay text
              Container(
                width: screenHeight * 0.90,
                height: screenHeight * 0.30, // responsive height
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Background Image
                    Image.asset(
                      "assets/login_bg.png", // your image
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),

                  //   Positioned(
                  //     bottom: screenHeight * 0.18, // slightly upward
                  //     child: Column(
                  //       children: [
                  //         Text(
                  //           "A Product of",
                  //           style: TextStyle(
                  //             color: const Color.fromARGB(255, 123, 122, 122),
                  //             fontSize: scaleFont(14),
                  //             fontWeight: FontWeight.w400,
                  //           ),
                  //         ),
                  //         Text(
                  //           "Krish Mark Infotech(I) Pvt. Ltd.© 2019",
                  //           style: TextStyle(
                  //             color: const Color.fromARGB(255, 123, 122, 122),
                  //             fontSize: scaleFont(16),
                  //             fontWeight: FontWeight.bold,
                  //           ),
                  //         ),
                  //         Text(
                  //           "Nifty LMS Version 1.3.2",
                  //           style: TextStyle(
                  //             color: const Color.fromARGB(255, 123, 122, 122),
                  //             fontSize: scaleFont(14),
                  //             fontWeight: FontWeight.w500,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                   ],
                ),
              ),

              SizedBox(height: screenHeight * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}
