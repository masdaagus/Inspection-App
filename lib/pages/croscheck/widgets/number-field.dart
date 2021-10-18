import 'package:Inspection/pages/croscheck/controller/math.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NumberField extends StatelessWidget {
  const NumberField({
    this.hint = '0',
    this.controller,
    Key key,
  }) : super(key: key);

  final String hint;

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: Color(0xfffff4f1).withOpacity(.5),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.25),
            blurRadius: 12,
            offset: Offset(4, 4),
          ),
          BoxShadow(
            color: Colors.white.withOpacity(.70),
            blurRadius: 12,
            offset: Offset(-4, -4),
          ),
        ],
      ),
      child: Center(
        child: TextField(
          onChanged: (text) {
            final c = Get.find<MathCalculation>();
            c.all();
          },
          controller: controller,
          maxLength: 6,
          keyboardType: TextInputType.number,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey[800],
          ),
          decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            hintText: hint,
          ),
        ),
      ),
    );
  }
}
