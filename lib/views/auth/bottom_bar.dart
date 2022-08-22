import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  static ValueNotifier<String> enteredValue = ValueNotifier('');




// var myResponse;
//   Crud crud = Crud();
//   bool isloading = false;
//   TextEditingController question = TextEditingController();
//   sendQuestion() async {
//     isloading = true;
//     setState(() {});
//     var response = await crud.postRequest(linkAnswer, {
//       "question": question.text,
//     });
//     isloading = false;
//     setState(() {});
//     if (response["status"] == "success") {
//       Navigator.of(context)
//           .pushNamedAndRemoveUntil("newHome", (route) => false);
//     } else {
//       AwesomeDialog(
//           context: context,
//           title: "attention",
//           body: Text("incorrect user name or password"))
//         ..show();
//     }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: 
    Container(
      alignment: Alignment.center,
      height: 350,
      decoration: BoxDecoration(
                  color: Color.fromARGB(255, 235, 236, 167),
                  border: Border.all(
                    color: Color.fromARGB(255, 190, 36, 36),
                    width: 5,
                  )),
      child: Column(
        children: [
          SizedBox(height: 16),
          
          ValueListenableBuilder(
            valueListenable: enteredValue,
            builder: (BuildContext context, String newValue, Widget ) {
              return Text(
                newValue,
                style: TextStyle(fontSize: 24),
              );
            },
          ),
        ],
      ),
    ));
  }
}
