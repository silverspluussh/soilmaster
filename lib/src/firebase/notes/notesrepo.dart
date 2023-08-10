import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/notes/notesmodel.dart';
part 'notesrepo.g.dart';

class NotesRepo {
  FirebaseAuth? users;
  final FirebaseFirestore _firestore;

  NotesRepo(this._firestore);

  static String notespath(String uid) => 'users/$uid/notes';
  static String notepath({required String uid, required String nid}) =>
      'users/$uid/notes/$nid';

  Query<NotesModel> _notesref({required String uid}) =>
      _firestore.collection(notespath(uid)).withConverter(
          fromFirestore: (doc, _) =>
              NotesModel.fromJson(doc.data()!, nid: doc.id),
          toFirestore: (NotesModel notes, options) => notes.toJson());

  Future<List<NotesModel>> fetchNotes({required String uid}) async {
    final reference = _notesref(uid: uid);
    final notesnapshot = await reference.get();

    return notesnapshot.docs.map((notes) => notes.data()).toList();
  }

  Stream<List<NotesModel>> watchNotes({required String uid}) {
    final reference = _notesref(uid: uid);
    return reference
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  Future<void> createNote(NotesModel notes, {required String uid}) {
    return _firestore.collection(notespath(uid)).add(notes.toJson());
  }

  Future<List<NotesModel>> searchNotes(String search, String uid) async {
    final noteslist = await fetchNotes(uid: uid);

    return noteslist
        .where(
            (note) => note.title!.toLowerCase().contains(search.toLowerCase()))
        .toList();
  }

  Future<void> deleteNote(NotesModel note) {
    return _firestore
        .doc(notepath(
            nid: note.nid!, uid: FirebaseAuth.instance.currentUser!.uid))
        .delete();
  }
}

@Riverpod(keepAlive: true)
NotesRepo notesRepo(NotesRepoRef ref) {
  return NotesRepo(FirebaseFirestore.instance);
}

@riverpod
Stream<List<NotesModel>> notesStream(NotesStreamRef ref) {
  final notesRepo = ref.watch(notesRepoProvider);
  return notesRepo.watchNotes(uid: FirebaseAuth.instance.currentUser!.uid);
}

@riverpod
Future<List<NotesModel>> notesList(NotesListRef ref) {
  final notesRepo = ref.watch(notesRepoProvider);
  return notesRepo.fetchNotes(uid: FirebaseAuth.instance.currentUser!.uid);
}
