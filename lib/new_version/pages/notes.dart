import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/new_version/pages/addnote.dart';
import 'package:soilmaster/new_version/widgets/navigation.dart';
import 'package:soilmaster/src/firebase/notes/notesrepo.dart';
import 'package:velocity_x/velocity_x.dart';

class Notes extends ConsumerWidget {
  const Notes({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notesC = ref.watch(notesStreamProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Notes'),
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
                              title: Text(data[index].date ?? 'no date'),
                              subtitle: Text(data[index].time!),
                              childrenPadding: const EdgeInsets.all(10),
                              backgroundColor: Colors.white,
                              children: [
                                Row(
                                  children: [
                                    const Text('Title:'),
                                    const SizedBox(width: 20),
                                    Text(data[index].title!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text('Body:'),
                                    const SizedBox(width: 20),
                                    Text(data[index].body!)
                                  ],
                                ),
                                const SizedBox(height: 10),
                                GestureDetector(
                                  onTap: () => ref
                                      .read(notesRepoProvider)
                                      .deleteNote(data[index]),
                                  child: Card(
                                    color: Colors.red[500],
                                    child:
                                        const Text('Delete note').px8().py4(),
                                  ),
                                )
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
