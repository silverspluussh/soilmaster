import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:soilmaster/constants/colors.dart';
import 'package:soilmaster/src/firebase/notes/notesrepo.dart';
import 'package:soilmaster/src/models/notes/notesmodel.dart';
import 'package:soilmaster/src/widgets/formwidget.dart';
import 'package:velocity_x/velocity_x.dart';

class Addnote extends ConsumerStatefulWidget {
  const Addnote({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AddnoteState();
}

class _AddnoteState extends ConsumerState<Addnote> {
  TextEditingController title = TextEditingController();
  TextEditingController body = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Note'),
        centerTitle: true,
      ),
      body: Form(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          MyFormField(
              validator: (validator) {
                return null;
              },
              readonly: false,
              hinttext: 'enter title',
              label: 'Note Title',
              inputType: TextInputType.name,
              controller: title),
          TextField(
            maxLines: 4,
            maxLength: 100,
            controller: body,
            decoration: InputDecoration(
                label: Text('Body'),
                hintText: 'note body',
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
                filled: true),
          ).py12().px12(),
          const Spacer(),
          GestureDetector(
              onTap: () {
                final contr = ref.watch(notesRepoProvider);
                final model = NotesModel(
                    body: body.text,
                    date: DateTime.now().toString().split(' ').first,
                    time:
                        '${TimeOfDay.now().format(context)} ${TimeOfDay.now().period.toString().split('.').last}',
                    title: title.text);
                contr
                    .createNote(model,
                        uid: FirebaseAuth.instance.currentUser!.uid)
                    .then((value) {
                  setState(() {
                    context.pop();
                  });
                });
              },
              child: Card(
                color: kPrimaryColor.withOpacity(0.6),
                child: Text('Add note').px64().py12(),
              )),
          const Spacer(),
        ],
      ).p12()),
    );
  }
}
