import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/tools/pushnotifications.dart';
import 'package:velocity_x/velocity_x.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

const medColor = [
  Colors.purple,
  Colors.orange,
  Colors.pink,
  Colors.green,
  kPrimaryColor,
];

class _MenuState extends State<Menu> {
  @override
  Widget build(
    BuildContext context,
  ) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
        width: size.width,
        height: size.height,
        child: FutureBuilder(
            future: NotificationBundle().showReminders(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                    child: SpinKitChasingDots(
                  size: 60,
                  color: kPrimaryColor,
                ));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child: SpinKitChasingDots(
                  size: 60,
                  color: kPrimaryColor,
                ));
              }
              if (snapshot.connectionState == ConnectionState.active) {
                return const Center(
                    child: SpinKitChasingDots(
                  size: 60,
                  color: kPrimaryColor,
                ));
              }
              if (snapshot.hasError) {
                return const Center(
                    child: SpinKitChasingDots(
                  size: 60,
                  color: kPrimaryColor,
                ));
              }
              return ListView.builder(
                itemCount:
                    snapshot.data!.isNotEmpty ? snapshot.data!.length : 0,
                itemBuilder: (BuildContext context, int index) {
                  final r = snapshot.data ?? [];
                  return MedCard(
                      color: medColor[index % 4],
                      child: ListTile(
                          title: Text(index.toString()),
                          subtitle: Text('${r[index].body}'),
                          leading: CircleAvatar(
                            radius: 10,
                            foregroundColor: medColor[index % 4],
                            child: const Icon(Icons.check_circle, size: 21)
                                .centered(),
                          ),
                          trailing: PopupMenuButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              child: Card(
                                color: Colors.white,
                                child: Text(r[index]
                                        .payload!
                                        .split(' ')
                                        .last
                                        .split('.')
                                        .first)
                                    .px4()
                                    .py4(),
                              ),
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                        child: InkWell(
                                      onTap: () {
                                        context.pop(context);

                                        NotificationBundle()
                                            .deleteAlarm(id: r[index].id)
                                            .whenComplete(() {
                                          setState(() {});
                                        });
                                      },
                                      child: Card(
                                          color: Colors.red.withOpacity(0.7),
                                          child: const Text('Delete reminder')
                                              .p8()),
                                    )),
                                  ])));
                },
              );
            }));
  }
}

class MedCard extends ConsumerWidget {
  const MedCard({required this.color, required this.child, super.key});
  final Color color;
  final Widget child;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Size size = MediaQuery.sizeOf(context);
    return SizedBox(
      height: size.height * 0.12,
      width: size.width * 0.8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.12,
            width: size.width * 0.8,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [color.withOpacity(0.5), Colors.black45],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight),
                color: kPrimaryColor.withOpacity(0.6),
                borderRadius: BorderRadius.circular(15)),
            child: child,
          ),
          Container(
            color: color,
            padding: const EdgeInsets.all(0),
            width: 5,
            height: size.height * 0.1,
          )
        ],
      ),
    ).p8();
  }
}
