import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:soilmaster/src/models/pests/pests.dart';

part 'pest.g.dart';

class PestRepo {
  FirebaseAuth? users;
  final FirebaseFirestore _firestore;

  PestRepo(this._firestore);

  static String fpath(
          {required String uid, required String cid, required String pid}) =>
      'users/$uid/crops/$cid/pest/$pid';

  static String fspath({
    required String uid,
    required String cid,
  }) =>
      'users/$uid/crops/$cid/fertilizer';

  Future<void> addPest(
      {required String uid, required Pests model, required String fid}) {
    return _firestore
        .collection(fspath(cid: fid, uid: uid))
        .add(model.toJson());
  }

  Future<List<Pests>> fetchPests(
      {required String uid, required String fid}) async {
    final reference = queryPests(uid: uid, fid: fid);
    final farmsnap = await reference.get();
    return farmsnap.docs.map((farm) => farm.data()).toList();
  }

  Future<void> delPest(
          {required String uid, required Pests fert, required String fid}) =>
      _firestore.doc(fpath(pid: fert.pid!, cid: fid, uid: uid)).delete();

  Stream<List<Pests>> streamPests({required String uid, required String fid}) {
    final reference = queryPests(uid: uid, fid: fid);
    return reference
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  Query<Pests> queryPests({required String uid, required String fid}) =>
      _firestore.collection(fspath(cid: fid, uid: uid)).withConverter(
            fromFirestore: (snapshot, _) =>
                Pests.fromJson(snapshot.data()!, pid: snapshot.id),
            toFirestore: (job, _) => job.toJson(),
          );
}

@Riverpod(keepAlive: true)
PestRepo pestRepo(PestRepoRef ref) {
  return PestRepo(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Pests>> pestsStream(PestsStreamRef ref, {required String fid}) {
  final cRepo = ref.watch(pestRepoProvider);

  return cRepo.streamPests(
      uid: FirebaseAuth.instance.currentUser!.uid, fid: fid);
}

@riverpod
Future<List<Pests>> pestsList(PestsListRef ref, {required String fid}) {
  final cRepo = ref.watch(pestRepoProvider);
  return cRepo.fetchPests(
      uid: FirebaseAuth.instance.currentUser!.uid, fid: fid);
}
