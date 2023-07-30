import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/new_version/pages/addnote.dart';
import 'package:soilmaster/new_version/widgets/navigation.dart';
import 'package:soilmaster/src/firebase/crops/fert.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../src/models/crop/crop.dart';

class Fert extends ConsumerWidget {
  const Fert(this.crops, {super.key});
  final Crop crops;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesC = ref.watch(fertsStreamProvider(cid: crops.cid!));
    return Scaffold(
        appBar: AppBar(
          title: Text('Fertilizer'),
          centerTitle: true,
        ),
        body: notesC.when(
            data: (data) => data.isNotEmpty
                ? Stack(
                    children: [
                      ListView.builder(
                          itemCount: data.length,
                          itemBuilder: (snap, index) {
                            return ExpansionTile(
                              title: Text(data[index].dateofapp ?? 'no date'),
                              childrenPadding: const EdgeInsets.all(10),
                              backgroundColor: Colors.white,
                              children: [
                                Row(
                                  children: [
                                    const Text('Fertilizername:'),
                                    const SizedBox(width: 20),
                                    Text(data[index].name!)
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('Application method:'),
                                    const SizedBox(width: 20),
                                    Text(data[index].appmethod!)
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('Application quantity:'),
                                    const SizedBox(width: 20),
                                    Text(data[index].quantityapplied!)
                                  ],
                                ),
                              ],
                            );
                          }),
                      Positioned(
                          bottom: 40,
                          right: 20,
                          child: GestureDetector(
                            onTap: () => Pageroute.navigatePush(
                                context: context, destination: const Addnote()),
                            child: Card(
                              color: kPrimaryColor,
                              child: const Text(
                                'Add new note',
                                style: TextStyle(color: Colors.white),
                              ).px32().py8().centered(),
                            ),
                          ))
                    ],
                  )
                : Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () => Pageroute.navigatePush(
                              context: context, destination: const Addnote()),
                          child: Card(
                            color: kPrimaryColor,
                            child: const Text(
                              'Add a note',
                              style: TextStyle(color: Colors.white),
                            ).px64().py12(),
                          ),
                        )
                      ],
                    ),
                  ),
            error: (err, srk) => Center(
                  child: Text(err.toString()),
                ),
            loading: () => const CircularProgressIndicator().centered()));
  }
}
