import 'dart:io';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gmaps/main.dart';
import 'package:flutter_gmaps/views/constant/linkapi.dart';
import 'package:flutter_gmaps/views/crud.dart';
import 'package:flutter_gmaps/views/customtextform.dart';

import '../valid.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formstate = GlobalKey();

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Crud crud = new Crud();

  bool isloading = false;

  Login() async {
    if (formstate.currentState.validate()) {
      isloading = true;
      setState(() {});
      var response = await crud.postRequest(linkLogin, {
        "email": email.text,
        "password": password.text,
      });
      isloading = false;
      setState(() {});
      if (response['status'] == "success") {
        sharedPref.setString("id", response['data']['user_id'].toString());
        sharedPref.setString("username", response['data']['username']);
        sharedPref.setString("email", response['data']['email']);
        Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
      } else {
        AwesomeDialog(
            context: context,
            title: "attention",
            body: Text("incorrect user name or password"))
          ..show();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () =>
          FocusManager.instance.primaryFocus?.unfocus(), //بس اضغط بشيل الكيبورد
      child: Scaffold(
        body: isloading == true
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 70),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.black87,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/login.jpg'),
                        ),
                      ),
                    ),

                    // Padding(padding: EdgeInsets.only(top: 70)),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[
                    //     // Container(
                    //     //   margin: EdgeInsets.all(16),
                    //     //   child: MaterialButton(
                    //     //     onPressed: () {},
                    //     //     child: Text(
                    //     //       'Sign In',
                    //     //       style: TextStyle(
                    //     //         fontSize: 20,
                    //     //         color: Colors.grey,
                    //     //       ),
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //     // Container(
                    //     //   margin: EdgeInsets.all(16),
                    //     //   child: MaterialButton(
                    //     //     onPressed: () {},
                    //     //     child: Text(
                    //     //       'Sign Up',
                    //     //       style: TextStyle(
                    //     //         fontSize: 20,
                    //     //         color: Colors.green,
                    //     //       ),
                    //     //     ),
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    // Container(
                    //   alignment: Alignment.center,
                    //   // margin: EdgeInsets.only(left: 16, top: 8),
                    //   // child: Text(
                    //   //   'Please Create Your Acount',
                    //   //   style: TextStyle(
                    //   //       fontSize: 22, fontWeight: FontWeight.bold),
                    //   // ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      alignment: Alignment.center,
                      // margin: EdgeInsets.only(left: 16, top: 8),
                      child: Text(
                        'Let\'s get started!',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 40, right: 16, top: 70, bottom: 0),
                      child: Container(
                        child: Form(
                          key: formstate,
                          child: Column(children: [
                            CustTextFormSign(
                              icon: Icons.email,
                              valid: (val) {
                                return validInput(val, 5, 40);
                              },
                              mycontroller: email,
                              hint: "email",
                            ),
                            CustTextFormSign(
                              icon: Icons.lock,
                              valid: (val) {
                                return validInput(val, 3, 20);
                              },
                              mycontroller: password,
                              hint: "password",
                            ),
                            Padding(padding: EdgeInsets.only(bottom: 5.0)),
                            Container(
                              width: size.width * 0.8,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(29),
                                child: MaterialButton(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 40),
                                  color: Color.fromARGB(255, 57, 147, 161),
                                  child: Text(
                                    "Login",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await Login();
                                  },
                                ),
                              ),
                            ),
                            // MaterialButton(
                            //   padding: EdgeInsets.symmetric(
                            //       horizontal: 50, vertical: 10),
                            //   color: Colors.purple,
                            //   onPressed: () async {
                            //     await signUp();
                            //   },
                            //   child: Text('SignUp'),
                            // ),
                            // Container(),
                            // InkWell(
                            //     child: Text('Login'),
                            //     onTap: () {
                            //       Navigator.of(context)
                            //           .pushNamed("login");
                            //     })
                          ]),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
//     return GestureDetector(
//       onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
//       child: Scaffold(
//           body: Container(
//         padding: EdgeInsets.only(top: 200),
//         child: isloading == true
//             ? Center(
//                 child: CircularProgressIndicator(),
//               )
//             : ListView(
//                 children: [
//                   Form(
//                     key: formstate,
//                     child: Column(children: [
//                       CustTextFormSign(
//                         icon: Icons.person,
//                         valid: (val) {
//                           return validInput(val, 5, 40);
//                         },
//                         mycontroller: email,
//                         hint: "email",
//                       ),
//                       CustTextFormSign(
//                         icon: Icons.lock,
//                         valid: (val) {
//                           return validInput(val, 3, 10);
//                         },
//                         mycontroller: password,
//                         hint: "password",
//                       ),
//                       MaterialButton(
//                         padding:
//                             EdgeInsets.symmetric(horizontal: 50, vertical: 10),
//                         color: Colors.blue,
//                         onPressed: () {},
//                         //  () async {
//                         //   await Login();
//                         // },
//                         child: Text('login'),
//                       ),
//                       Container(),
//                       InkWell(
//                         child: Text('Sign up'),
//                         onTap: () {
//                           Navigator.of(context).pushNamed("signup");
//                         },
//                       )
//                     ]),
//                   ),
//                 ],
//               ),
//       )),
//     );
//   }
// }
