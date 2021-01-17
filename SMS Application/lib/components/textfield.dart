import 'package:flutter/material.dart';
class Text_Field extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const Text_Field({Key key, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Container(
      width: size.width*0.7,
      child: TextField(
            onChanged: onChanged,
            decoration: InputDecoration(
              labelText: 'Enter Mobile No',
              labelStyle: TextStyle(
                color: Colors.white
              )
            ),
      ),
    );
  }
}
