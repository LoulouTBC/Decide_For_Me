
import 'package:flutter/material.dart';
import 'package:flutter_gmaps/views/auth/bottom_bar2.dart';
import 'package:flutter_gmaps/views/crud.dart';

import '../constant/linkapi.dart';
import '../getData.dart';

class NewHome extends StatefulWidget {
  @override
  State<NewHome> createState() => _NewHomeState();
}

class _NewHomeState extends State<NewHome> with Crud {
  List<Widget> myContainer = [];
  List<String> Data = [];

  double paddingInset = 5;
  void initState() {
    myContainer = <Widget>[];
    super.initState();
  }
//if i wont to say is thiz
  // addDynamic() {
  //   // if(Product.length != 0){
  //   //   floatingIcon = new Icon(Icons.add);

  //   //   Product = [];
  //   //   Price = [];
  //   //   dynamicList = [];
  //   // }
  //   setState(() {});
  //   _widgetList.add(Bottom());
  // }

  List<Widget> bodyElements = [];
  void addBodyElement() {
    bodyElements.add(
      Padding(
        padding: EdgeInsets.all(paddingInset),
        child: Container(
          height: 500,
          width: double.infinity,
          child: Center(child: Text('This is section $num')),
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 121, 70, 70),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }

  getAnswer() async {
    var response = await postRequest(linkAnswer, {});
    return response;
  }

  // static ValueNotifier<String> enteredValue = ValueNotifier('');
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'widget 1',
            style: TextStyle(fontSize: 24, color: Colors.blue),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter Value',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
               
              if (myContainer.length < 1) {
                setState(() {
                  myContainer.add(Bottom(title: textEditingController.text));
                });
              }
              //  Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => Bottom(title: textEditingController.text),
              //   ),
              // );
              
            },
            child: Text('send'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: myContainer.length,
              itemBuilder: (context, index) => myContainer[index],
            ),
          ),
        ],
      ),
    );
    // return Container(
    //                   child: ListView(
    //                 children: [
    //                   FutureBuilder(
    //                       future: getAnswer(),
    //                       builder:
    //                           (BuildContext context, AsyncSnapshot snapshot) {
    //                         if (snapshot.hasData) {
    //                           return ListView.builder(
    //                             itemCount: snapshot.data['data'].length,
    //                             shrinkWrap: true,
    //                             physics: NeverScrollableScrollPhysics(),
    //                               itemBuilder: (context, i) {
    //                                 return ShowAnswer(
    //                                   ontap: (){},
    //                                   content: "${snapshot.data['data'][i]}",
    //                                 );

    //                           });
    //                         }
    //                         if (snapshot.connectionState ==
    //                             ConnectionState.waiting) {
    //                           return Center(
    //                             child: Text("Loading..."),
    //                           );
    //                         }
    //                         return Center(
    //                           child: Text("Loading..."),
    //                         );
    //                       })
    //                 ],
    //               )

    // );
  }
}
