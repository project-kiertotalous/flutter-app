import 'package:flutter/material.dart';

class GreyCell extends StatelessWidget {
  const GreyCell({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFFB9B9B9),
        border: Border.all(
          width: 1,
        ),
      ),
    );
  }
}
