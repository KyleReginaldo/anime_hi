import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextOverflow? overflow;
  final TextAlign? textAlign;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  const CustomText(
    this.text, {
    super.key,
    this.overflow,
    this.textAlign,
    this.size,
    this.weight,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        fontFamily: 'Rubik',
        color: color,
      ),
    );
  }
}
