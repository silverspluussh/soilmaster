import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/main.dart';
import 'package:soilmaster/new_version/pages/addfertilizer.dart';
import 'package:soilmaster/new_version/pages/fertilizerrec.dart';
import 'package:soilmaster/new_version/widgets/navigation.dart';
import 'package:soilmaster/src/firebase/crops/crepo.dart';
import 'package:soilmaster/src/firebase/crops/cropdata.dart';
import 'package:soilmaster/src/widgets/cContainer.dart';
import 'package:soilmaster/src/widgets/formwidget.dart';
import 'package:soilmaster/tools/reminderprovider.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../src/models/crop/crop.dart';
import '../../tools/pushnotifications.dart';

class Plantcrop extends ConsumerStatefulWidget {
  const Plantcrop(this.crops, {super.key});
  final Crop crops;

  @override
  ConsumerState<Plantcrop> createState() => _PlantcropState();
}

class _PlantcropState extends ConsumerState<Plantcrop> {
  TextEditingController time = TextEditingController();

  TimeOfDay tod = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40,
        title: Text(
          'Overview',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showModalBottomSheet(
            context: context,
            builder: (context) {
              return SizedBox(
                width: size.width,
                height: size.height * 0.45,
                child: VStack(
                    alignment: MainAxisAlignment.center,
                    crossAlignment: CrossAxisAlignment.center,
                    [
                      InkWell(
                        onTap: () {},
                        child: Card(
                          child:
                              const Text('Add pests and disease record').p8(),
                        ),
                      ).py12(),
                      InkWell(
                        onTap: () => Pageroute.navigatePush(
                            context: context,
                            destination: AddFert(widget.crops)),
                        child: Card(
                          child: const Text('Add fertilizer record').p8(),
                        ),
                      ).py12(),
                    ]),
              );
            }),
        child: const Icon(Icons.add_box_outlined, size: 20),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        margin: const EdgeInsets.all(6),
        child: Stack(
          children: [
            Positioned(
                top: 5,
                child: CustomContainer(
                    img: 'assets/imgs/tomato.jpg',
                    height: size.height * 0.3,
                    width: size.width * 0.95,
                    child: const SizedBox())),
            Positioned(
                top: size.height * 0.25,
                left: 5,
                right: 5,
                child: CustomContainer(
                  img: '',
                  height: size.height * 0.4,
                  width: size.width * 0.8,
                  child: SingleChildScrollView(
                    child: VStack(crossAlignment: CrossAxisAlignment.center, [
                      ListTile(
                        title: Text(
                          'Crop name',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          widget.crops.cropname!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                const BorderSide(width: 2, color: Colors.grey)),
                      ),
                      const Divider(),
                      ListTile(
                        title: Text(
                          'Crop type',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          widget.crops.croptype!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                const BorderSide(width: 2, color: Colors.grey)),
                      ),
                      ListTile(
                        onTap: () => bottomPop(
                            context, MediaQuery.of(context).size.height * 0.3,
                            child: VStack(
                                alignment: MainAxisAlignment.center,
                                crossAlignment: CrossAxisAlignment.center,
                                [
                                  const SizedBox(height: 15),
                                  const Text('Set irrigation reminder'),
                                  MyFormField(
                                    label: 'Time',
                                    readonly: true,
                                    controller: time,
                                    hinttext: TimeOfDay.now().format(context),
                                    inputType: TextInputType.number,
                                    validator: (value) {
                                      return;
                                    },
                                    suffix: IconButton(
                                        onPressed: () => showTimePicker(
                                                    context: context,
                                                    initialTime:
                                                        TimeOfDay.now())
                                                .then((value) {
                                              tod = value!;
                                              time.text =
                                                  value.format(context) +
                                                      value.period
                                                          .toString()
                                                          .split('.')
                                                          .last;
                                            }),
                                        icon: const Icon(
                                            Icons.alarm_add_rounded)),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        NotificationBundle()
                                            .setreminder(
                                          body: 'Time to irrigate ',
                                          hour: tod.hour,
                                          minute: tod.minute,
                                          id: idgen().toString(),
                                          title: 'Irrigation',
                                        )
                                            .whenComplete(() {
                                          prefs.setString('time',
                                              '${tod.hour}: ${tod.minute} ${tod.period.name}');

                                          context.pop();
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(const SnackBar(
                                                  backgroundColor: Colors.green,
                                                  content: Text(
                                                      'Reminder added successfully.')));
                                        }).then((value) {
                                          ref
                                                  .read(
                                                      reminderProvider.notifier)
                                                  .state ==
                                              true;

                                          prefs.setBool('isreminder', true);
                                        });
                                      },
                                      child: const Text('Add Reminder').p4()),
                                  const SizedBox(height: 20)
                                ]).p12()),
                        title: Text(
                          'Irrigation time',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          prefs.getString('time') ?? '0:00 ',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        trailing: Icon(
                          prefs.getBool('isreminder') == true
                              ? Icons.check_box
                              : Icons.cancel,
                          color: prefs.getBool('isreminder') == true
                              ? Colors.green
                              : Colors.red,
                        ),
                        leading: const CircleAvatar(
                          radius: 35,
                          foregroundImage:
                              AssetImage('assets/imgs/watering.jpg'),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                const BorderSide(width: 2, color: Colors.grey)),
                      ).p8(),
                      const Divider(),
                      ListTile(
                        onTap: () => Pageroute.navigatePush(
                            context: context, destination: Fert(widget.crops)),
                        title: Text(
                          'Fertilizer',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        leading: const CircleAvatar(
                          radius: 35,
                          foregroundImage: AssetImage('assets/imgs/fert.jpg'),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side:
                                const BorderSide(width: 2, color: Colors.grey)),
                      ).p8(),
                    ]).p8(),
                  ),
                ).px8()),
            Positioned(
                bottom: 20,
                left: 10,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () => ref
                            .read(cropRepoProvider)
                            .delcrop(crop: widget.crops)
                            .then((value) => context.pop()),
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                          size: 30,
                        )),
                    const Text('Delete crop')
                  ],
                ))
          ],
        ),
      ),
    );
  }
}

bottomPop(context, double h, {required Widget child}) {
  return showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
            height: h,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: child,
            ),
          ));
}
