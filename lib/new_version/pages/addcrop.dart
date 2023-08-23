import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:velocity_x/velocity_x.dart';
import '../../constants/colors.dart';
import '../../src/firebase/crops/crepo.dart';
import '../../src/models/crop/crop.dart';
import '../../src/widgets/formwidget.dart';

class AddCrop extends ConsumerStatefulWidget {
  const AddCrop({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddCropState();
}

class _AddCropState extends ConsumerState<AddCrop> {
  TextEditingController temp = TextEditingController();
  TextEditingController moisture = TextEditingController();
  TextEditingController humid = TextEditingController();

  TextEditingController croptype = TextEditingController();
  TextEditingController cropname = TextEditingController();
  TextEditingController plantingtime = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add crop '),
        centerTitle: true,
      ),
      body: VStack(alignment: MainAxisAlignment.start, [
        MyFormField(
          validator: (e) {
            return e != null ? null : 'field cannot be empty ';
          },
          readonly: true,
          hinttext: 'Type of crop',
          inputType: TextInputType.text,
          controller: croptype,
          label: 'Crop type',
          suffix: DropdownButton(
              underline: const SizedBox(),
              items: [
                ...['vegetables', 'cereals']
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
              ],
              onChanged: (e) {
                setState(() {
                  croptype.text = e!;
                });
              }),
        ),
        MyFormField(
          validator: (e) {
            return e != null ? null : 'field cannot be empty ';
          },
          readonly: false,
          hinttext: 'Crop name',
          inputType: TextInputType.text,
          controller: cropname,
          label: 'Crop name',
        ),
        MyFormField(
            validator: (e) {
              return e != null ? null : 'field cannot be empty ';
            },
            readonly: true,
            hinttext: 'time of planting',
            inputType: TextInputType.text,
            controller: plantingtime,
            label: 'Planting time',
            suffix: IconButton(
                onPressed: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now()
                                .add(const Duration(days: -36500)),
                            lastDate: DateTime.now().add(730.days))
                        .then((value) {
                      setState(() {
                        plantingtime.text = value.toString().split(' ').first;
                      });
                    }),
                icon: const Icon(Icons.calendar_month))),
        const Spacer(),
        Card(
          color: kPrimaryColor.withOpacity(0.5),
          child: InkWell(
            onTap: () async {
              final crop = ref.watch(cropRepoProvider);

              final cmodel = Crop(
                cropname: cropname.text,
                croptype: croptype.text,
                plantingtime: plantingtime.text,
              );

              crop.addCrop(model: cmodel);
            },
            child: const Text('Add crop').p8().centered(),
          ),
        ).px12(),
        const Spacer(),
      ]).p8(),
    );
  }
}
