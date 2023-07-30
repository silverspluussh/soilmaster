import 'package:flutter/material.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

// ignore: must_be_immutable
class MyFormField extends StatelessWidget {
  MyFormField(
      {super.key,
      this.suffix,
      this.prefixicon,
      required this.validator,
      required this.readonly,
      required this.hinttext,
      required this.label,
      required this.inputType,
      required this.controller});

  TextEditingController controller;
  FormFieldValidator validator;
  bool readonly;
  Widget? suffix;
  Icon? prefixicon;
  String hinttext;
  String label;
  TextInputType inputType;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: inputType,
        readOnly: readonly,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        decoration: InputDecoration(
            label: Text(label),
            hintText: hinttext,
            fillColor: kWhiteColor,
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 0, color: kWhiteColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 0, color: kWhiteColor)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 0, color: kWhiteColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(width: 0, color: kWhiteColor)),
            contentPadding: const EdgeInsets.all(10),
            suffix: suffix,
            prefixIcon: prefixicon,
            prefixIconColor: kSecondaryColor,
            filled: true),
      ).px20().py12(),
    );
  }
}
