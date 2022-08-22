// import 'dart:io';


// import 'package:flutter/material.dart';
// import 'dart:convert' show json;
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'package:shared_preferences/shared_preferences.dart';

// late SharedPreferences sharedPref; //public variable

// void main() async {
//   //async for shared preference
//   WidgetsFlutterBinding.ensureInitialized();
//   sharedPref = await SharedPreferences.getInstance();//صار فيي احصل عليها باي مكان بالتطبيق
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
  
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       initialRoute:sharedPref.getString("id")==null ? "login":"home",
//       routes: {
//         "login": (context) => Login(),
//         "signup": (context) => SignUp(),
//         "home": (context) => Home(),
//         "success": ((context) => Success()),
//         "newHome": ((context) => NewHome()),
//         "map" : ((context) => MapScreen()),
//       },
//     );
//   }
// }
