import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:soilmaster/src/models/fertilizer/fertilizer.dart';

part 'fert.g.dart';

class FertRepo {
  FirebaseAuth? users;
  final FirebaseFirestore _firestore;

  FertRepo(this._firestore);

  static String fpath(
          {required String uid, required String fiid, required String cid}) =>
      'users/$uid/crops/$cid/fertilizer/$fiid';

  static String fspath({required String uid, required String cid}) =>
      'users/$uid/crops/$cid/fertilizer';

  Future<void> addFert(
      {required String uid, required String cid, required Fertilizer model}) {
    return _firestore
        .collection(fspath(cid: cid, uid: uid))
        .add(model.toJson());
  }

  Future<List<Fertilizer>> fetchferts(
      {required String uid, required String cid}) async {
    final reference = queryFerts(uid: uid, cid: cid);
    final farmsnap = await reference.get();
    return farmsnap.docs.map((farm) => farm.data()).toList();
  }

  Future<void> delfert(
          {required String uid,
          required Fertilizer fert,
          required String cid}) =>
      _firestore.doc(fpath(fiid: fert.fiid!, uid: uid, cid: cid)).delete();

  Stream<List<Fertilizer>> streamFerts(
      {required String uid, required String cid}) {
    final reference = queryFerts(uid: uid, cid: cid);
    return reference
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  Query<Fertilizer> queryFerts({required String uid, required String cid}) =>
      _firestore.collection(fspath(uid: uid, cid: cid)).withConverter(
            fromFirestore: (snapshot, _) =>
                Fertilizer.fromJson(snapshot.data()!, fiid: snapshot.id),
            toFirestore: (job, _) => job.toJson(),
          );
}

@Riverpod(keepAlive: true)
FertRepo fertRepo(FertRepoRef ref) {
  return FertRepo(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Fertilizer>> fertsStream(FertsStreamRef ref,
    {required String cid}) {
  final cRepo = ref.watch(fertRepoProvider);

  return cRepo.streamFerts(
      uid: FirebaseAuth.instance.currentUser!.uid, cid: cid);
}

@riverpod
Future<List<Fertilizer>> fertsList(FertsListRef ref, {required String cid}) {
  final cRepo = ref.watch(fertRepoProvider);
  return cRepo.fetchferts(
      uid: FirebaseAuth.instance.currentUser!.uid, cid: cid);
}
