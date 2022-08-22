// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter_gmaps/mapPage.dart';
import 'package:flutter_gmaps/views/crud.dart';

import '../constant/linkapi.dart';
// import '../getData.dart';

class Bottom extends StatefulWidget {
  const Bottom({@required this.title});
  final String title;
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  var myResponse;
  Crud crud = Crud();
  bool isloading = false;

  TextEditingController question = TextEditingController();

  sendQuestion() async {
    isloading = true;
    setState(() {});
    var response = await crud.postRequest(linkAnswer, {
      "question": widget.title,
    });
    isloading = false;
    // setState(() {});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.only(top: 30.0),
        alignment: Alignment.topLeft,
        height: 300,
        decoration: BoxDecoration(
            boxShadow: [
              new BoxShadow(
                color: Colors.black38,
                offset: new Offset(0, 0.8),
                blurRadius: 27.0,
              )
            ],
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(45), topRight: Radius.circular(45))),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.white),
              // padding: EdgeInsets.only(left: 10),
              margin: EdgeInsets.only(
                left: 10,
                top: 40,
              ),
              height: 400,
              width: 250,
              child: ListView(
                children: [
                  FutureBuilder(
                      future: sendQuestion(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            children: [
                              ListView.builder(
                                  itemCount: snapshot.data['data1'].length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "${snapshot.data['data1'][i]['answer']}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400),
                                              // ),
                                              // onTap: () {
                                              //   Navigator.of(context).push(
                                              //       MaterialPageRoute(
                                              //           builder: (context) => MapScreen(
                                              //               place:
                                              //                   snapshot.data['data1']
                                              //                       [i]['place_id'])));
                                              // },
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Color.fromARGB(
                                                        255, 45, 118, 129),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) => MapScreen(
                                                                  place: snapshot
                                                                              .data[
                                                                          'data1'][i]
                                                                      [
                                                                      'place_id'])));
                                                    },
                                                    child: Text(
                                                      'Show on map?',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              45,
                                                              118,
                                                              129)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ));
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              ListView.builder(
                                  itemCount: snapshot.data['data2'].length,
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (context, i) {
                                    return Container(
                                        padding: EdgeInsets.only(left: 5),
                                        child: Column(
                                          children: [
                                            Text(
                                              "or maybe ${snapshot.data['data2'][i]['answer']}",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 20,
                                                  fontStyle: FontStyle.normal,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              child: Row(
                                                children: [
                                                  Icon(
                                                    Icons.location_on,
                                                    color: Color.fromARGB(
                                                        255, 45, 118, 129),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) => MapScreen(
                                                                  place: snapshot
                                                                              .data[
                                                                          'data2'][i]
                                                                      [
                                                                      'place_id'])));
                                                    },
                                                    child: Text(
                                                      'Show on map?',
                                                      style: TextStyle(
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Color.fromARGB(
                                                              255,
                                                              45,
                                                              118,
                                                              129)),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                        // ),
                                        // onTap: () {
                                        //   Navigator.of(context).push(
                                        //       MaterialPageRoute(
                                        //           builder: (context) => MapScreen(
                                        //               place:
                                        //                   snapshot.data['data2']
                                        //                       [i]['place_id'])));
                                        // },
                                        );
                                  }),
                            ],
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Container(
                            alignment: Alignment.center,
                            child: CircularProgressIndicator(),
                          );
                        }
                        return Container(
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(),
                        );
                      })
                ],
              ),
            ),
            Container(
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 65, left: 5),
              child: Image.asset(
                'assets/images/lolo.png',
                width: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
