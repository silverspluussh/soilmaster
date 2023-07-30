import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/new_version/pages/addcrop.dart';
import 'package:soilmaster/src/firebase/crops/crepo.dart';
import 'package:soilmaster/src/models/crop/crop.dart';
import 'package:soilmaster/src/utils/navigation.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/colors.dart';
import 'plantpage.dart';
import '../../src/widgets/cContainer.dart';

class Croppage extends ConsumerStatefulWidget {
  const Croppage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CroppageState();
}

class _CroppageState extends ConsumerState<Croppage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    final c = ref.watch(cropRepoProvider);

    return SafeArea(
      child: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: StreamBuilder(
            stream: c.streamCrops(uid: FirebaseAuth.instance.currentUser!.uid),
            builder: (context, crop) {
              List<Crop> data = crop.data ?? [];
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Row(
                      children: [
                        const Text('Registered field crops'),
                        const Spacer(),
                        Card(
                          color: kPrimaryColor,
                          child: GestureDetector(
                            onTap: () => Pageroute.navigatePush(
                                context: context, destination: const AddCrop()),
                            child: const Text(
                              'Add new crop',
                              style: TextStyle(
                                  fontFamily: 'Go',
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ).p8(),
                          ),
                        )
                      ],
                    ).py12(),
                  ),
                  SliverGrid.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: data.isNotEmpty ? 2 : 1),
                      itemCount: data.isNotEmpty ? data.length : 1,
                      itemBuilder: (context, index) {
                        return data.isNotEmpty
                            ? CustomContainer(
                                img: 'assets/imgs/tomato.jpg',
                                height: size.height * 0.2,
                                width: size.width * 0.2,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InkWell(
                                        onDoubleTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Plantcrop(data[index])));
                                        },
                                        child: const Icon(
                                          Icons.file_open_rounded,
                                          size: 50,
                                          color: kWhiteColor,
                                        )),
                                    Card(
                                      color: kWhiteColor,
                                      child: Text(data[index].cropname!)
                                          .py4()
                                          .px8(),
                                    ).p8(),
                                  ],
                                ),
                              ).px4()
                            : SizedBox(
                                child: Card(
                                    child: const Text('No crops added').p32()),
                              ).centered();
                      })
                ],
              );
            }),
      ),
    );
  }
}
