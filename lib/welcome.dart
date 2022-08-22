import 'package:flutter/material.dart';

// class WelcomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: <Widget>[
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Text(
//                   'Welcome!',
//                   style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 32, bottom: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.green,
//                     // shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(6)),
//                   ),
//                   width: 260,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.green),
//                     ),
//                     child: Text('Sign In',
//                         style: TextStyle(fontSize: 20, color: Colors.white)),
//                     onPressed: () {
//                       Navigator.of(context).pushNamed("auth");
//                     },
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(top: 0, bottom: 16),
//                   decoration: BoxDecoration(
//                     // color: Colors.green,
//                     border: Border.all(color: Colors.green),
//                     // shape: BoxShape.rectangle,
//                     borderRadius: BorderRadius.all(Radius.circular(8)),
//                   ),
//                   width: 250,
//                   child: ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor: MaterialStateProperty.all(Colors.green),
//                     ),
//                     child: Text('Sign Up',
//                         style: TextStyle(fontSize: 20, color: Colors.white)),
//                     onPressed: () {
//                       // Navigator.pushNamed(context, '/grocerry/auth');
//                       Navigator.of(context).pushNamed("auth");
//                     },
//                   ),
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   // crossAxisAlignment: CrossAxisAlignment.stretch,
//                   children: <Widget>[
//                     Text(
//                       'Language : ',
//                       style: TextStyle(
//                           fontSize: 18, fontWeight: FontWeight.normal),
//                     ),
//                     SizedBox(
//                       width: 8,
//                     ),
//                     FlatButton(
//                       onPressed: () {},
//                       child: Text(
//                         'English',
//                         style: TextStyle(
//                             fontSize: 18, fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 50,
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
class WelcomePage extends StatefulWidget {
  const WelcomePage({Key key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/a.jpg'),
          fit: BoxFit.fitHeight,
          colorFilter: new ColorFilter.mode(
              Colors.black.withOpacity(0.3), BlendMode.dstATop),
        ),
      ),
      child: Scaffold(
        backgroundColor: Color.fromARGB(78, 233, 236, 235),
        body: SingleChildScrollView(
          child: Column(
            // body: Container(
            //   color: Colors.black,ertfa
            //   child: Column(
            children: [
              Stack(
                children: [
                  Container(
                      // height: 400,
                      // decoration: BoxDecoration(
                      //   image: DecorationImage(
                      //     image: AssetImage('assets/images/map.jpg'),
                      //     fit: BoxFit.fill,
                      //     colorFilter: new ColorFilter.mode(
                      //         Colors.black.withOpacity(0.5), BlendMode.dstATop),
                      //   ),
                      // ),
                      ),
                  Positioned(
                      child: Container(
                    margin: EdgeInsets.only(top: 375),
                    child: Column(
                      children: [
                        Center(
                          child: Text(
                            "Welcome!",
                            style: TextStyle(
                                fontFamily: 'Monserrat',
                                fontWeight: FontWeight.w700,
                                fontSize: 40.0,
                                letterSpacing: 1.0,
                                color: Color.fromARGB(255, 241, 239, 239)),
                          ),
                        ),
                        Center(
                          child: Text(
                            "Lets Decide For you!",
                            style: TextStyle(
                              fontFamily: 'Monserrat',
                              fontWeight: FontWeight.w700,
                              fontSize: 25.0,
                              letterSpacing: 1.0,
                              color: Color.fromARGB(255, 241, 239, 239),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
                ],
              ),
              // Positioned(
              // Text(
              //   "Welcome!",
              //   style: TextStyle(
              //     fontFamily: 'Monserrat',
              //     fontWeight: FontWeight.w700,
              //     fontSize: 40.0,
              //     letterSpacing: 1.0,
              //     color: Color.fromARGB(255, 25, 70, 38),
              //   ),
              // ),
              // ),
              SizedBox(
                  // height: 10,
                  ),
              // Text(
              //   "Lets Decide For you!",
              //   style: TextStyle(
              //     fontFamily: 'Monserrat',
              //     fontWeight: FontWeight.w700,
              //     fontSize: 25.0,
              //     letterSpacing: 1.0,
              //     color: Color.fromARGB(255, 25, 70, 38),
              //   ),
              // ),

              Container(
                padding: EdgeInsets.only(top: 15),
                margin: EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(children: [
                  SizedBox(
                    height: 70,
                  ),
                  Column(
                    children: [
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed("login");
                      //   },
                      //   child: Column(
                      //     children: [
                      //       Container(
                      //         height: 50.0,
                      //         decoration: BoxDecoration(
                      //             gradient: LinearGradient(
                      //                 begin: Alignment.topCenter,
                      //                 end: Alignment.bottomCenter,
                      //                 colors: [
                      //                   Color(0xffF7D716),
                      //                   Color(0xffEC9B3B),
                      //                   Color(0xffF24C4C),
                      //                   Color(0xff293462)
                      //                 ]),
                      //             borderRadius: BorderRadius.circular(50.0)),
                      //         child: Center(
                      //             child: Text(
                      //           'login',
                      // style: TextStyle(
                      //   fontWeight: FontWeight.w500,
                      //   color: Colors.white,
                      //   fontSize: 18.0,
                      // ),
                      //         )),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      Container(
                        width: 500.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            color: Color.fromARGB(220, 62, 147, 160),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 20.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed("login");
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: 500.0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(29),
                          child: MaterialButton(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 40),
                            color: Color.fromARGB(255, 189, 230, 227),
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 17, 1, 1),
                                fontSize: 19.0,
                              ),
                            ),
                            onPressed: () {
                              Navigator.of(context).pushNamed("signup");
                            },
                          ),
                        ),
                      ),
                      // GestureDetector(
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed("signup");
                      //   },
                      //   child: Column(
                      //     children: [
                      //       SizedBox(
                      //         height: 10,
                      //       ),
                      //       Container(
                      //         height: 50.0,
                      //         decoration: BoxDecoration(
                      //             gradient: LinearGradient(
                      //                 begin: Alignment.topCenter,
                      //                 end: Alignment.bottomCenter,
                      //                 colors: [
                      //                   Color(0xff293462),
                      //                   Color(0xffF24C4C)
                      //                 ]),
                      //             borderRadius: BorderRadius.circular(50.0)),
                      //         child: Center(
                      //             child: Text(
                      //           'Sign up',
                      //           style: TextStyle(
                      //             fontWeight: FontWeight.w500,
                      //             color: Colors.white,
                      //             fontSize: 18.0,
                      //           ),
                      //         )),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
