import 'package:flutter/material.dart';

class StyleText extends StatelessWidget{
  const StyleText(this.textt, {super.key});
  final String textt;
  @override
  Widget build(context) {
    return Text(textt,
            style: const TextStyle(
                color: Color.fromRGBO(251, 251, 251, 1), fontSize: 85));
  }
}