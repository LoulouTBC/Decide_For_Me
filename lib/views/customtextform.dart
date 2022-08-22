import 'package:flutter/material.dart';

class CustTextFormSign extends StatelessWidget {
  final String hint;
  final String Function(String) valid;
  final TextEditingController mycontroller;
  final IconData icon;
  const CustTextFormSign(
      {@required this.hint,
      @required this.icon,
      @required this.mycontroller,
      @required this.valid});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 2.5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 204, 231, 229),
        borderRadius: BorderRadius.circular(29),
      ),
      child: TextFormField(
        controller: mycontroller,
        validator: valid,
        // onChanged: onChanged,mayaa
        cursorColor: Color.fromARGB(255, 20, 16, 16),
        decoration: InputDecoration(
          // icon: Icon(
          // icon,
          // color: kPrimaryColor,
          // ),
          icon: Icon(icon),
          hintText: hint,
          border: InputBorder.none,
        ),
      ),
    );
    // return Container(
    //   margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
    //   child: TextFormField(
    //     validator: valid,
    //     controller: mycontroller,
    //     decoration: InputDecoration(
    //       suffixIcon: Icon(
    //         Icons.search,
    //         color: Colors.amberAccent,
    //       ),
    //       contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
    //       hintText: hint,
    //       // border: OutlineInputBorder(
    //       //     borderSide: BorderSide(color: Colors.black, width: 1),
    //       //     borderRadius: BorderRadius.all(Radius.circular(10))),
    //     ),
    //   ),
    // );
  }
}
