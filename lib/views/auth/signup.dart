import 'package:flutter/material.dart';
import 'package:flutter_gmaps/views/constant/linkapi.dart';
import 'package:flutter_gmaps/views/crud.dart';
import 'package:flutter_gmaps/views/customtextform.dart';
import 'package:flutter_gmaps/views/valid.dart';

class SignUp extends StatefulWidget {
  const SignUp();

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  GlobalKey<FormState> formstate = GlobalKey();
  Crud _crud = Crud();

  bool isloading = false;

  TextEditingController username = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  signUp() async {
    if (formstate.currentState.validate()) {
      isloading = true;
      setState(() {});
      var response = await _crud.postRequest(linkSignUp, {
        "username": username.text,
        "email": email.text,
        "password": password.text,
      });

      isloading = false;
      setState(() {});

      if (response["status"] == "success") {
        Navigator.of(context)
            .pushNamedAndRemoveUntil("success", (route) => false);
      } else {
        print("Sign up fail");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus
            ?.unfocus(), //بس اضغط بشيل الكيبورد
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
                      // Container(
                      //   height: 320,
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //         image: AssetImage('assets/images/final3.png'),
                      //         fit: BoxFit.cover),
                      //   ),
                      // ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 70),
                        child: Center(
                          child: Text(
                            "Sign Up",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color.fromARGB(255, 15, 12, 12),
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                            ),
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
                            image: AssetImage('assets/images/account6.png'),
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
                      //   child: Text(
                      //     'Please Create Your Acount',
                      //     style: TextStyle(
                      //         fontSize: 22, fontWeight: FontWeight.bold),
                      //   ),
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

                      // Padding(
                      //   padding: EdgeInsets.only(
                      //       left: 40, right: 16, top: 40, bottom: 8),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(top: 37),
                        child: Form(
                          key: formstate,
                          child: Column(children: [
                            CustTextFormSign(
                              icon: Icons.person,
                              valid: (val) {
                                return validInput(val, 3, 20);
                              },
                              mycontroller: username,
                              hint: "username",
                            ),
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
                                return validInput(val, 5, 20);
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
                                      vertical: 18, horizontal: 40),
                                  color: Color.fromARGB(255, 57, 147, 161),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                      fontSize: 18.0,
                                    ),
                                  ),
                                  onPressed: () async {
                                    await signUp();
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
                    ],
                  ),
                ),
        ));
  }
}
