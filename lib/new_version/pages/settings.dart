import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:velocity_x/velocity_x.dart';

class Menu extends ConsumerWidget {
  const Menu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          const SizedBox(height: 30),
          Text('Menu').centered().py12(),
          const SizedBox(height: 30),
          Container(
            // height: size.height * 0.3,
            width: size.width,
            margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                  color: kPrimaryColor.withOpacity(0.2),
                  blurRadius: 2,
                  spreadRadius: 2)
            ], borderRadius: BorderRadius.circular(20), color: Colors.white),
            child: ListTile(
              leading: const Icon(Icons.person, color: kPrimaryColor),
              title: Text('Profile').centered(),
            ),
          ),
          const Spacer(),
          ListTile(
            onTap: () => showDialog(
                context: context, builder: (_) => _dialogue(size, context)),
            leading: Icon(Icons.exit_to_app, size: 25, color: Colors.red),
            title: Text('sign out').centered(),
          ),
          const SizedBox(height: 20),
          const SizedBox(height: 100),
        ],
      ).centered(),
    );
  }

  Dialog _dialogue(Size size, BuildContext context) {
    return Dialog(
      backgroundColor: Colors.green,
      child: Container(
        height: size.height * 0.25,
        width: size.width * 0.75,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'confirm',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 10),
            Text('sure',
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 15),
            SizedBox(
              height: 40,
              width: size.width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () async {
                      context.pop();
                      FirebaseAuth.instance.signOut();
                    },
                    child: Text(
                      'yes',
                      style: const TextStyle(
                          color: Colors.red, fontSize: 13, fontFamily: 'Pop'),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'no',
                      style: const TextStyle(
                          color: Colors.black, fontSize: 13, fontFamily: 'Pop'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
