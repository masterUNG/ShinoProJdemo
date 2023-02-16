// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WidgetFormPhone extends StatelessWidget {
  const WidgetFormPhone({
    Key? key,
    required this.inputFormatters,
    required this.changeFunc,
  }) : super(key: key);

  final List<TextInputFormatter> inputFormatters;
  final Function(String) changeFunc;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: changeFunc,
      decoration: InputDecoration(
          hintText: '081 123 4567',
          hintStyle: TextStyle(color: Colors.grey.shade400)),
      inputFormatters: inputFormatters,
    );
  }
}
