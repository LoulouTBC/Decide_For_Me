import 'package:flutter/material.dart';
import 'package:flutter_gmaps/main.dart';
import 'package:flutter_gmaps/map2.dart';
import 'package:flutter_gmaps/views/constant/linkapi.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';
import '../crud.dart';
import '../customtextform.dart';
import '../valid.dart';
import 'bottom_bar2.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with Crud {
  List<Widget> myContainer = [];
  void initState() {
    myContainer = <Widget>[];
    super.initState();
  }

  GlobalKey<FormState> formstate = GlobalKey();
  var myResponse;
  Crud crud = Crud();
  bool isloading = false;

  TextEditingController question = TextEditingController();
  // sendQuestion() async {
  //   // isloading = true;
  //   setState(() {});
  //   var response = await crud.postRequest(linkAnswer, {
  //     "question": question.text,
  //   });
  //   // isloading = false;
  //   setState(() {});
  //   if (response["status"] == "success") {
  //     void initState() {
  //       myContainer = <Widget>[];
  //       super.initState();
  //     }
  //   }
  //   //   AwesomeDialog(
  //   //       context: context,
  //   //       title: "attention",
  //   //       body: Text("success"))
  //   //     ..show();
  //   //   Navigator.of(context)
  //   //       .pushNamedAndRemoveUntil("newHome", (route) => false);
  //   // } else {
  //   //   AwesomeDialog(
  //   //       context: context,
  //   //       title: "attention",
  //   //       body: Text("incorrect user name or password"))
  //   //     ..show();
  //   // }
  // }
  var listsearch = [];
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearch = Text("Decide For Me");
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
    return GestureDetector(
      onTap: () =>
          FocusManager.instance.primaryFocus?.unfocus(), //بس اضغط بشيل الكيبورد
      child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            hintStyle: TextStyle(
                                color: Color.fromARGB(211, 255, 255, 255))),
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      );
                    } else {
                      this.cusIcon = Icon(Icons.search);
                      this.cusSearch = Text("Decide For Me");
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
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {},
          //   child: Icon(Icons.add),
          // ),
          body: Column(
            children: [
              // SizedBox(height: 20),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(color: Colors.white),
                    padding: EdgeInsets.only(top: 0),
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30, top: 0),
                    child: Text(
                      "Are you confused ?!",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color.fromARGB(255, 45, 118, 129),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 60,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Image.asset(
                      'assets/images/think.png',
                      width: 130,
                    ),
                  ),
                ],
              ),
              Container(
                alignment: Alignment.topLeft,
                margin: EdgeInsets.only(left: 30, top: 0),
                child: Text(
                  "You can say what\'s on your mind\nand let us to decide for you!",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 15),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                child: TextField(
                  onSubmitted: (value) {
                    if (myContainer.length < 1) {
                      setState(() {
                        myContainer.add(Bottom(title: value));
                      });
                    } else {
                      setState(() {
                        myContainer.clear();
                      });
                      // setState(() {});
                      setState(() {
                        myContainer.add(Bottom(title: question.text));
                      });
                    }
                  },
                  controller: question,
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.edit,
                      color: Colors.black,
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 13, horizontal: 10),
                    hintText: "What\'s on your mind?",
                    // prefixIconColor: MaterialStateColor.resolveWith(
                    //     (Set<MaterialState> states) {
                    //   if (states.contains(MaterialState.focused)) {
                    //     return Colors.green;
                    //   }
                    //   if (states.contains(MaterialState.error)) {
                    //     return Colors.red;
                    //   }
                    //   return Colors.grey;
                    // }),
                    // border: OutlineInputBorder(
                    //     borderSide: BorderSide(color: Colors.black, width: 1),
                    //     borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                ),
              ),
              Row(
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 30, top: 10, bottom: 8),
                    child: Text(
                      "or you can see our places ",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    margin: EdgeInsets.only(left: 0, top: 10, bottom: 8),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed("direct");
                      },
                      child: Text(
                        'Directly!',
                        style: TextStyle(
                            color: Color.fromARGB(255, 45, 118, 129),
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: myContainer.length,
                  itemBuilder: (context, index) => myContainer[index],
                ),
              ),
            ],
          )),
    );
  }
}
