import 'package:flutter/material.dart';
import 'package:flutter_gmaps/main.dart';
import 'package:flutter_gmaps/map2.dart';
import 'package:flutter_gmaps/mapPage.dart';
import 'package:flutter_gmaps/views/constant/linkapi.dart';
import 'package:flutter_gmaps/views/crud.dart';
import 'package:flutter_gmaps/views/mapType.dart';

class Doctor extends StatefulWidget {
  const Doctor({Key key}) : super(key: key);

  @override
  State<Doctor> createState() => _DoctorState();
}

Crud crud = Crud();
Future getContactData() async {
  var response = await crud.getRequest(linkDoctor);
  return response;
}

class _DoctorState extends State<Doctor> {
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
      body: FutureBuilder(
        future: getContactData(),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
              ? Padding(
                  padding: const EdgeInsets.only(bottom: 0),
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            // boxShadow: [
                            //   new BoxShadow(
                            //     color: Colors.black38,
                            //     offset: new Offset(0, 0.8),
                            //     blurRadius: 27.0,
                            //   )
                            // ],
                            // borderRadius: BorderRadius.only(
                            //     bottomLeft: Radius.circular(32),
                            //     bottomRight: Radius.circular(32)),
                            color: Colors.white),
                        height: 130,
                        width: 500,
                        // padding: EdgeInsets.only(top: 20, left: 60, right: 60),
                        child: Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 225,
                                  margin: EdgeInsets.only(
                                      right: 40, top: 20, left: 20),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'Here are our clinics:',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 45, 118, 129),
                                        fontSize: 22,
                                        // fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                  width: 225,
                                  margin: EdgeInsets.only(
                                      right: 40, top: 20, left: 20),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    'choose your doctor\'s clinic!',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                        // fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 0, top: 12),
                              // padding: ,
                              alignment: Alignment.topRight,
                              child: Image.asset(
                                'assets/images/searchdoctor2.png',
                                width: 110,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: GridView.builder(
                          itemCount: (snapshot.data as List).toList().length,
                          itemBuilder: (context, index) {
                            var data = (snapshot.data as List).toList();
                            return Container(
                              margin:
                                  EdgeInsets.only(top: 10, left: 7, right: 8),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 178, 228, 224),
                                  borderRadius: BorderRadius.circular(15)),
                              // child: SingleChildScrollView(
                              //   scrollDirection: Axis.horizontal,
                              //   child: Row(
                              //     children: [
                              //       Column(
                              //         children: [
                              //           Container(
                              //             padding:
                              //                 EdgeInsets.only(bottom: 5.0, top: 5.0),
                              child: ClipRRect(
                                child: MaterialButton(
                                  child: Text(
                                    data[index]['doctor_type'],
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 15, 70, 78),
                                        fontSize: 18,
                                        // fontStyle: FontStyle.italic,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => MapType(
                                                place: snapshot.data[index]
                                                    ['doctor_type'])));
                                  },
                                  // style: ElevatedButton.styleFrom(
                                  //   fixedSize: Size(150, 50),
                                  //   primary: Colors.blueGrey,
                                  // ),
                                ),
                              ),
                            );
                            // Container(
                            //   child: ElevatedButton(
                            //     child: Text("doctor"),
                            //     onPressed: () {
                            //       Navigator.of(context).pushNamed("doctor");
                            //     },
                            //     style: ElevatedButton.styleFrom(
                            //       fixedSize: Size(150, 50),
                            //       primary: Colors.blueGrey,
                            //     ),
                            //   ),
                            // ),
                          },
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 4 / 2,
                                  crossAxisSpacing: 7,
                                  mainAxisSpacing: 10),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                );

          /*return ElevatedButton(
                        child: Text(data[index]['name']),
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.purple,
                        ));*/
        },
      ),
    );
  }
}
