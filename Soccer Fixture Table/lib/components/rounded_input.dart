import 'package:auth_ui/components/text_field.dart';
import 'package:auth_ui/constants/constant.dart';
import 'package:flutter/material.dart';

class RoundedInputField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final ValueChanged<String> onChanged;
  const RoundedInputField({
    Key key,
    this.hintText,
    this.icon = Icons.person,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        decoration: InputDecoration(
            icon:Icon(
              icon,
              color: kprimaryColor,
            ),
            border: InputBorder.none,
            hintText: hintText
        ),
      ),
    );
  }
}