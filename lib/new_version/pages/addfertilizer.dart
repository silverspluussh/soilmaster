import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/src/firebase/crops/fert.dart';
import 'package:soilmaster/src/models/fertilizer/fertilizer.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../constants/colors.dart';
import '../../src/models/crop/crop.dart';
import '../../src/widgets/formwidget.dart';

class AddFert extends ConsumerStatefulWidget {
  const AddFert(this.crops, {super.key});
  final Crop crops;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddFertState();
}

class _AddFertState extends ConsumerState<AddFert> {
  TextEditingController name = TextEditingController();
  TextEditingController quantity = TextEditingController();
  TextEditingController method = TextEditingController();

  TextEditingController date = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add fertilizer '),
        centerTitle: true,
      ),
      body: VStack(alignment: MainAxisAlignment.start, [
        MyFormField(
          validator: (e) {
            return e != null ? null : 'field cannot be empty ';
          },
          readonly: false,
          hinttext: 'Fertilizer name',
          inputType: TextInputType.text,
          controller: name,
          label: 'Fertilizer  name',
        ),
        MyFormField(
          validator: (e) {
            return e != null ? null : 'field cannot be empty ';
          },
          readonly: false,
          hinttext: 'Quantity applied',
          inputType: TextInputType.text,
          controller: quantity,
          label: 'Quantity',
        ),
        MyFormField(
          validator: (e) {
            return e != null ? null : 'field cannot be empty ';
          },
          readonly: true,
          hinttext: 'Method of application',
          inputType: TextInputType.text,
          controller: method,
          label: 'Method of application',
          suffix: DropdownButton(
              underline: const SizedBox(),
              items: [
                ...['vegetables', 'cereals']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              ],
              onChanged: (e) {
                setState(() {
                  method.text = e!;
                });
              }),
        ),
        MyFormField(
            validator: (e) {
              return e != null ? null : 'field cannot be empty ';
            },
            readonly: true,
            hinttext: 'Date of application',
            inputType: TextInputType.text,
            controller: date,
            label: 'Application  date',
            suffix: IconButton(
                onPressed: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .add(const Duration(days: -36500)),
                            lastDate: DateTime.now().add(730.days))
                        .then((value) {
                      setState(() {
                        date.text = value.toString().split(' ').first;
                      });
                    }),
                icon: const Icon(Icons.calendar_month))),
        const Spacer(),
        Card(
          color: kPrimaryColor.withOpacity(0.5),
          child: InkWell(
            onTap: () {
              final crop = ref.watch(fertRepoProvider);

              final cmodel = Fertilizer(
                  appmethod: method.text,
                  dateofapp: date.text,
                  name: name.text,
                  quantityapplied: quantity.text);

              crop
                  .addFert(
                      uid: FirebaseAuth.instance.currentUser!.uid,
                      model: cmodel,
                      cid: widget.crops.cid!)
                  .whenComplete(() {
                context.pop();
                return VxToast.show(context,
                    textSize: 11,
                    msg: 'fertilizer added successfully.',
                    bgColor: const Color.fromARGB(255, 38, 99, 40),
                    textColor: Colors.white,
                    pdHorizontal: 30,
                    pdVertical: 20);
              }).then((value) {});
            },
            child: const Text('Add fertilizer').p8().centered(),
          ),
        ).px12(),
        const Spacer(),
      ]).p8(),
    );
  }
}
