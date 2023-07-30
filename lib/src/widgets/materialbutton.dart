import 'package:flutter/material.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class AppButton extends StatelessWidget {
  const AppButton({super.key, required this.onpress, required this.label});

  final VoidCallback onpress;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(9),
      child: MaterialButton(
        onPressed: onpress,
        elevation: 5,
        color: kBlueColor,
        height: 50,
        minWidth: 150,
        padding: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Text(
          label,
          style: Theme.of(context).textTheme.titleSmall,
        ).centered(),
      ),
    );
  }
}
