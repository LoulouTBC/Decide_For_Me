// import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
import 'package:flutter_gmaps/main.dart';
import 'package:flutter_gmaps/map2.dart';
import 'package:flutter_gmaps/views/constant/linkapi.dart';
import 'package:flutter_gmaps/views/crud.dart';
import 'package:flutter_gmaps/views/customtextform.dart';
import 'package:flutter_gmaps/views/valid.dart';
// import 'package:material_dialogs/material_dialogs.dart';
// import 'package:material_dialogs/widgets/buttons/icon_button.dart';
// import 'package:material_dialogs/widgets/buttons/icon_outline_button.dart';
// import 'package:material_dialogs/widgets/dialogs/dialog_widget.dart';

class Appoint extends StatefulWidget {
  var place;
  Appoint({Key key, @required this.place}) : super(key: key);

  @override
  State<Appoint> createState() => _AppointState();
}

class _AppointState extends State<Appoint> {
  GlobalKey<FormState> formstate = GlobalKey();

  Crud _crud = Crud();

  bool isloading = false;

  TextEditingController firstname = TextEditingController();
  TextEditingController lasttname = TextEditingController();
  // TextEditingController email = TextEditingController();
  TextEditingController number = TextEditingController();

  Book() async {
    // isloading = true;
    setState(() {});
    var response = await _crud.postRequest(linkAppoint, {
      "wplace_id": widget.place,
      "first_name": firstname.text,
      "last_name": lasttname.text,
      "number": number.text,
    });

    // isloading = false;
    setState(() {});

    if (response["status"] == "success") {
      // AwesomeDialog(
      //     customHeader: Image.asset('assets/images/final3.png'),
      //     context: context,
      //     title: "attention",
      //     body: Text("correct user name or password"))
      //   ..show();
      showDialog(
          context: context,
          builder: (context) => Dialog(
                child: Container(
                  height: 450,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage('assets/images/blogpost.jpg')),
                      Text(
                        "Your appointment details:",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Doctor : ${response['data']['wplace_name']}\nat the name: ${response['data']['first_name']} ${response['data']['last_name']}\nat time : ${response['data']['time']} ",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        "Confirm this appointment?",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w500),
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin:
                                EdgeInsets.only(left: 10, bottom: 10, right: 7),
                            height: 45,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: MaterialButton(
                                  color: Color.fromARGB(255, 189, 230, 227),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Cancel",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 23, 68, 75),
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(right: 10, bottom: 10),
                            height: 45,
                            width: 150,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: MaterialButton(
                                  color: Color(0xff2F8F9D),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
      // Dialogs.materialDialog(
      //     color: Colors.white,
      //     msg: 'Congratulations, you won 500 points',
      //     title: 'Congratulations',
      //     // animation: 'assets/cong_example.json',
      //     context: context,
      //     actions: [
      //       IconsOutlineButton(
      //         onPressed: () {},
      //         text: 'Cancel',
      //         iconData: Icons.cancel_outlined,
      //         textStyle: TextStyle(color: Colors.grey),
      //         iconColor: Colors.grey,
      //       ),
      //       IconsButton(
      //         onPressed: () {},
      //         text: 'Claim',
      //         iconData: Icons.done,
      //         color: Colors.blue,
      //         textStyle: TextStyle(color: Colors.white),
      //         iconColor: Colors.white,
      //       ),
      //     ]);
    } else {
      print("Sign up fail");
    }
  }

  Crud crud = Crud();
  var listsearch = [];
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearch = Text(
    "Decide For Me",
    style: TextStyle(color: Colors.white),
  );

  Future getData() async {
    // var url = "http://192.168.1.7/decide_for_me/search.php";
    // var response = await http.get(Uri.parse(url));/
    // var responsebody = jsonDecode(response.body);
    var responsebody = await crud.getRequest(linkSearch);

    for (int i = 0; i < responsebody.length; i++) {
      listsearch.add(responsebody[i]['product_name']);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: cusSearch,
        titleSpacing: 4,
        backgroundColor: Color.fromARGB(255, 57, 147, 161),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: cusIcon,
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearch = TextField(
                    controller: TextEditingController(),
                    // onTap: (() {
                    //   Navigator.of(context).pushNamed("login");
                    // }),
                    textInputAction: TextInputAction.send,
                    onSubmitted: (value) {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Map2(place: value)));
                    },
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.search),

                        // border: OutlineInputBorder(
                        //   // borderRadius:
                        //   // new BorderRadius.all(Radius.circular(20.0)),
                        //   borderSide: BorderSide(
                        //       color: Color.fromARGB(255, 239, 240, 243),
                        //       width: 1.0,
                        //       style: BorderStyle.solid),
                        // ),
                        hintText: "Search what you want",
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        hintStyle: TextStyle(
                            color: Color.fromARGB(211, 255, 255, 255))),
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearch = Text(
                    "Decide For Me",
                    style: TextStyle(color: Colors.white),
                  );
                }
              });
            },
          ),
          IconButton(
              onPressed: () {
                sharedPref.clear();
                Navigator.of(context)
                    .pushNamedAndRemoveUntil("login", (route) => false);
              },
              icon: Icon(Icons.exit_to_app)),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(bottom: 55)),
            Container(
              padding: EdgeInsets.only(left: 0),
              alignment: Alignment.topLeft,
              margin: EdgeInsets.only(left: 30, top: 8, right: 30),
              child: Text(
                "Book your appointment now:",
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontSize: 22,
                    color: Color.fromARGB(255, 57, 147, 161),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 50)),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, top: 8, right: 30),

              // margin: EdgeInsets.only(left: 30, top: 8),
              child: Text(
                "Please fill you data to get your appointment!",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 60)),
            Card(
              color: Color.fromARGB(255, 243, 248, 248),
              shadowColor: Color(0xff2F8F9D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 15,
              // alignment: Alignment.center,
              child: Container(
                margin: EdgeInsets.all(20),
                // key: formstate,
                child: Column(children: [
                  CustTextFormSign(
                    icon: Icons.person,
                    valid: (val) {
                      return validInput(val, 3, 20);
                    },
                    mycontroller: firstname,
                    hint: "First Name",
                  ),
                  CustTextFormSign(
                    icon: Icons.person,
                    valid: (val) {
                      return validInput(val, 5, 40);
                    },
                    mycontroller: lasttname,
                    hint: "Last Name",
                  ),
                  CustTextFormSign(
                    icon: Icons.phone_android,
                    valid: (val) {
                      return validInput(val, 5, 20);
                    },
                    mycontroller: number,
                    hint: "Phone Number",
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 5.0)),
                  Container(
                    width: size.width * 0.8,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(29),
                      child: MaterialButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                        color: Color.fromARGB(255, 62, 147, 160),
                        child: Text(
                          "Book an appointment",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            fontSize: 18.0,
                          ),
                        ),
                        onPressed: () async {
                          await Book();
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
    );
  }
}
