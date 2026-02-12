import 'package:flutter/material.dart';
import 'package:flutter_application_1/database/database_helper.dart';
import 'MyMain.dart';
import 'package:flutter_application_1/common/common_util.dart';
import 'package:flutter_application_1/core/static_variables.dart';
import 'package:flutter_application_1/core/apicall/authenticate_user.dart';

class Mylogin extends StatefulWidget {
  const Mylogin({Key? key}) : super(key: key);

  @override
  _MyloginState createState() => _MyloginState();
}

class _MyloginState extends State<Mylogin> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _userIdError = false;
  String _userIdErrorText = "";
  bool _passwordError = false;
  String _passwordErrorText = "";

  final FocusNode _userIdFocus = FocusNode();
  final FocusNode _passwordFocus = FocusNode();

  bool _rememberMe = false;
  bool _obscurePassword = true;

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    _userIdFocus.dispose();
    _passwordFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double scaleFont(double size) {
      return size * screenWidth / 400;
    }

    return Scaffold(
      extendBodyBehindAppBar:
          true, // body extends behind AppBar to show status bar color
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.09),
          child: Column(
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
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              Image.asset(
                "assets/IGI_Logo.png",
                height: screenHeight * 0.06,
                fit: BoxFit.contain,
              ),

              SizedBox(height: screenHeight * 0.06),

              Text(
                "Smart Tracker",
                style: TextStyle(
                  fontSize: scaleFont(23),
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),

              SizedBox(height: screenHeight * 0.02),

              // USERNAME
              TextField(
                controller: usernameController,
                focusNode: _userIdFocus,
                onChanged: (value) {
                  final filtered =
                      value.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '');
                  if (filtered != value) {
                    usernameController.text = filtered;
                    usernameController.selection = TextSelection.fromPosition(
                      TextPosition(offset: filtered.length),
                    );
                  }
                  setState(() {
                    _userIdError = false;
                  });
                },
                decoration: InputDecoration(
                  labelText: "User ID",
                  labelStyle: TextStyle(color: Colors.grey[600]),
                  errorText: _userIdError ? _userIdErrorText : null,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF17479E), // border color when focused
                      width: 2, // border thickness
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red, // border color when error
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red, // border color when focused + error
                      width: 1.7,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.015),

              // PASSWORD
              TextField(
                controller: passwordController,
                obscureText: _obscurePassword,
                focusNode: _passwordFocus,
                decoration: InputDecoration(
                  labelText: "Password",
                  errorText: _passwordError ? _passwordErrorText : null,
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Color(0xFF17479E), // border color when focused
                      width: 2, // border thickness
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red, // border color when error
                      width: 2,
                    ),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red, // border color when focused + error
                      width: 1.7,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility_off
                          : Icons.visibility,
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
                  Checkbox(
                    value: _rememberMe,
                    onChanged: (bool? value) {
                      setState(() {
                        _rememberMe = value ?? false;
                      });
                    },
                    activeColor: Color(0xFF17479E), // your deep blue color
                    checkColor: Colors.white,
                  ),
                  const Text("Remember me"),
                ],
              ),

              SizedBox(height: screenHeight * 0.02),

              // LOGIN BUTTON
              SizedBox(
                width: screenWidth * 0.6,
                height: screenHeight * 0.07,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF17479E),
                  ),
                  onPressed: () async {
                    final userId = usernameController.text.trim();
                    final password = passwordController.text.trim();

                    setState(() {
                      _userIdError = userId.isEmpty;
                      _userIdErrorText = _userIdError ? "User ID required" : "";

                      _passwordError = password.isEmpty;
                      _passwordErrorText =
                          _passwordError ? "Password required" : "";
                    });
                    if (_userIdError || _passwordError) return;

                    CommonUtil.show(context,
                        message: "Authenticating please wait");
                    try {
                      final response = await AuthenticateUser.login(
                          UserId: userId,
                          password: password,
                          appVersion: StaticVariables.appVersion);

                      print("Response :" + response.toString());
                      final table = response["Table"];
                      if (table == null || table.isEmpty) {
                        throw "Invalid Server Response";
                      }

                      final json = table[0];
                      final message = json["Message"];

                      if (!mounted) return;
                      CommonUtil.hide(context);

                      if (message == "Outdated version found") {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: const Text("Outdated App  Version"),
                            content: const Text(
                              "You are using an outdated version.\nPlease install the latest version.",
                            ),
                          ),
                        );
                      } else if (message == "Login Success") {
                        final Map<String, dynamic> jsonObject =
                            Map<String, dynamic>.from(table[0]);

                        StaticVariables.mSAPCode = userId;

                        StaticVariables.mBranchName =
                            jsonObject["BranchName"]?.toString() ?? "";
                        StaticVariables.mDesignation =
                            jsonObject["UserRole"]?.toString() ?? "";

                        StaticVariables.mUserName =
                            jsonObject["LegalName"]?.toString() ?? "";

                        StaticVariables.mTeam =
                            jsonObject["MtFlag"]?.toString() ?? "";
                        StaticVariables.TokenId =
                            jsonObject["TokenId"]?.toString() ?? "";

                        final dashboardUpdatedDate = "";
                        final calenderUpdateDate = "";
                        final now = DateTime.now().toIso8601String();

                        final Map<String, dynamic> userData = {
                          "userId": CommonUtil.encryptIfNotEmpty(
                            jsonObject["UserId"].toString().toUpperCase(),
                          ),
                          "Password": CommonUtil.encryptIfNotEmpty(password),
                          "UserName": CommonUtil.encryptIfNotEmpty(
                              jsonObject["LegalName"]?.toString() ?? ""),
                          "UserStatus": CommonUtil.encryptIfNotEmpty(
                              jsonObject["UserStatus"]?.toString() ?? ""),
                          "BranchName": CommonUtil.encryptIfNotEmpty(
                              jsonObject["BranchName"]?.toString() ?? ""),
                          "LastAccessdate": CommonUtil.encryptIfNotEmpty(now),
                          "UserType": CommonUtil.encryptIfNotEmpty(
                            jsonObject["UserRole"]?.toString() ?? "",
                          ),
                          "Createddtim": CommonUtil.encryptIfNotEmpty(now),
                          "Createdby": CommonUtil.encryptIfNotEmpty(
                            jsonObject["UserId"].toString().toUpperCase(),
                          ),
                          "RememberLogin": CommonUtil.encryptIfNotEmpty("Y"),
                          "change_ver": CommonUtil.encryptIfNotEmpty(
                            jsonObject["change_ver"]?.toString() ?? "",
                          ),
                          "MobileNo": CommonUtil.encryptIfNotEmpty(
                            jsonObject["MobileNo"]?.toString() ?? "",
                          ),
                          "EmailID": CommonUtil.encryptIfNotEmpty(
                            jsonObject["EmailID"]?.toString() ?? "",
                          ),
                          "Privacy_Flag": CommonUtil.encryptIfNotEmpty(
                            jsonObject["Privacy_Flag"]?.toString() ?? "",
                          ),
                          "Schedule_Days": CommonUtil.encryptIfNotEmpty(
                            jsonObject["Schedule_Days"]?.toString() ?? "",
                          ),
                          "Ren_Rem_Days": CommonUtil.encryptIfNotEmpty(
                            jsonObject["Ren_Rem_Days"]?.toString() ?? "",
                          ),
                          "DashboardUpdatedDate": CommonUtil.encryptIfNotEmpty(
                              dashboardUpdatedDate),
                          "CalendarUpdatedDate":
                              CommonUtil.encryptIfNotEmpty(calenderUpdateDate),
                          "TokenId": CommonUtil.encryptIfNotEmpty(
                            jsonObject["TokenId"]?.toString() ?? "",
                          ),
                        };

                        final db = await DatabaseHelper.instance.database;
                        await db.delete("iUser");
                        await db.insert("iUser", userData);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => MyMain(user: userId),
                          ),
                        );
                      }
                    } catch (e) {
                      if (mounted) {
                        CommonUtil.hide(context);
                      }

                      print(e);
                    }
                    //CommonUtil.hide(context);

                    //if (_userIdError || _passwordError) return;
                  },
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: scaleFont(20),
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 0.04),

              Image.asset(
                "assets/login_bg.png",
                height: screenHeight * 0.25,
                fit: BoxFit.cover,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
