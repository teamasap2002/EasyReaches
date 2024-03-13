import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget{
  final String name;
  final double height;
  final double width;
  final Color buttonColor;
  final Color textColor;
  final double borderRadius;
  final Function onPressed;

   CustomButton({
      required this.name,
      required this.height,
      required this.width,
      required this.buttonColor,
      required this.textColor,
      required this.borderRadius,
      required this.onPressed,
});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        color: buttonColor,
      ),
      child: TextButton(
        onPressed: ()=>onPressed(),
        child: Text(
          name,
          style: TextStyle(
            fontSize: 22,
            color: textColor,
            height: 1.5,
          ),
        ),
      ),
    );
  }


}