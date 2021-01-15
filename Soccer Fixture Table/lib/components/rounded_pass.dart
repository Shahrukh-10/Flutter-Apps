import 'package:auth_ui/components/text_field.dart';
import 'package:auth_ui/constants/constant.dart';
import 'package:flutter/material.dart';

class RoundedPassField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPassField({
    Key key,
    this.onChanged,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        decoration: InputDecoration(
          hintText: 'Your Email',
          icon: Icon(
            Icons.lock,
            color:kprimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color:kprimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
