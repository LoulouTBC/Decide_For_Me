import 'package:flutter/material.dart';


class ShowAnswer extends StatelessWidget {
  final void Function() ontap;
  
  final String content;
  const ShowAnswer({@required this.ontap, @required this.content});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        
        subtitle: Text("$content",style: TextStyle(color: Colors.amber),),
      ),
    );
  }
}
