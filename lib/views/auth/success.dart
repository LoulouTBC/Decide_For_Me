import 'package:flutter/material.dart';

class Success extends StatefulWidget {

  @override
  State<Success> createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Text("your acount is created,now you can login",
          style: TextStyle(fontSize: 20),),
        ),
        MaterialButton(
          textColor: Colors.white,
          color: Colors.black87,
          onPressed: () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil("login", (route) => false);
          },
          child: Text("Login"),
        )
      ]),
    );
  }
}
