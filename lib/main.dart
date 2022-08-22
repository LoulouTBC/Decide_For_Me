import 'package:flutter_gmaps/auth.dart';
import 'package:flutter_gmaps/map2.dart';
import 'package:flutter_gmaps/mapPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmaps/views/appoint.dart';
import 'package:flutter_gmaps/views/auth/home.dart';
import 'package:flutter_gmaps/views/auth/login.dart';
import 'package:flutter_gmaps/views/auth/newHome.dart';
import 'package:flutter_gmaps/views/auth/signup.dart';
import 'package:flutter_gmaps/views/auth/success.dart';
import 'package:flutter_gmaps/views/auth/test.dart';
import 'package:flutter_gmaps/views/constant/directly.dart';
import 'package:flutter_gmaps/views/doctor.dart';
import 'package:flutter_gmaps/welcome.dart';
// import 'dart:convert' show json;
// import 'package:http/http.dart' as http;
// import 'dart:async';
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'dart:convert' show json;
// import 'package:http/http.dart' as http;
// import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences sharedPref; //public variable

void main() async {
  //async for shared preference
  WidgetsFlutterBinding.ensureInitialized();
  sharedPref = await SharedPreferences
      .getInstance(); //صار فيي احصل عليها باي مكان بالتطبيق
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: sharedPref.getString("id") == null ? "welcome" : "home",
      routes: {
        "login": (context) => Login(),
        "signup": (context) => SignUp(),
        "home": (context) => Home(),
        "success": ((context) => Success()),
        "newHome": ((context) => NewHome()),
        "map": ((context) => MapScreen(
              place: '',
            )),
        "direct": ((context) => Direct()),
        "map2": ((context) => Map2(
              place: '',
            )),
        "welcome": (context) => WelcomePage(),
        "auth": (context) => AuthPage(),
        "doctor": (context) => Doctor(),
        "test": (context) => Test(),
        "appoint": (context) => Appoint(
              place: '',
            ),
      },
    );
  }
}


// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Home(),
//     );
//   }
// }

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   Future getContactData() async {
//     var url = "http://192.168.1.5/decide_for_me/viewPlaces.php";
//     var response = await http.get(Uri.parse(url));
//     return json.decode(response.body);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Decide For Me'),
//       ),
//       body: FutureBuilder(
//         future: getContactData(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) print(snapshot.error);

//           return snapshot.hasData
//               ? ListView.builder(
//                   itemCount: (snapshot.data as List).toList().length,
//                   itemBuilder: (context, index) {
//                     var data = (snapshot.data as List).toList();
//                     return Container(
//                       alignment: Alignment.center,
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.horizontal,
//                         child: Row(
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   padding:
//                                       EdgeInsets.only(bottom: 5.0, top: 5.0),
//                                   child: ElevatedButton(
//                                       child: Text(data[index]['place_name']),
//                                       onPressed: () {
//                                         Navigator.push(
//                                             context,
//                                             MaterialPageRoute(
//                                                 builder: (context)=>MapScreen()));
//                                       },
//                                       style: ElevatedButton.styleFrom(
//                                         fixedSize: Size(150, 50),
//                                         primary: Colors.purple,
//                                       )),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     );
//                   })
//               : Center(
//                   child: CircularProgressIndicator(),
//                 );

//           /*return ElevatedButton(
//                         child: Text(data[index]['name']),
//                         onPressed: () {},
//                         style: ElevatedButton.styleFrom(
//                           primary: Colors.purple,
//                         ));*/
//         },
//       ),
//     );
//   }
// }
