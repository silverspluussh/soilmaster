import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/crop/crop.dart';

part 'crepo.g.dart';

class CropRepo {
  FirebaseAuth? users;
  final FirebaseFirestore _firestore;

  CropRepo(this._firestore);

  static String fpath({required String uid, required String cid}) =>
      'users/$uid/crops/$cid';

  static String fspath({
    required String uid,
  }) =>
      'users/$uid/crops';

  Future<void> addCrop({required Crop model}) {
    return _firestore
        .collection(fspath(uid: FirebaseAuth.instance.currentUser!.uid))
        .add(model.toJson());
  }

  Future<void> updateCrop({required String uid, required Crop model}) {
    return _firestore
        .doc(fpath(cid: model.cid!, uid: uid))
        .update(model.toJson());
  }

  Future<List<Crop>> fetchCrops({required String uid}) async {
    final reference = queryCrops(uid: uid);
    final farmsnap = await reference.get();
    return farmsnap.docs.map((farm) => farm.data()).toList();
  }

  Future<void> delcrop({required String uid, required Crop crop}) =>
      _firestore.doc(fpath(cid: crop.cid!, uid: uid)).delete();

  Stream<List<Crop>> streamCrops({required String uid}) {
    final reference = queryCrops(uid: uid);
    return reference
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  Query<Crop> queryCrops({required String uid}) =>
      _firestore.collection(fspath(uid: uid)).withConverter(
            fromFirestore: (snapshot, _) =>
                Crop.fromJson(snapshot.data()!, cid: snapshot.id),
            toFirestore: (job, _) => job.toJson(),
          );
}

@Riverpod(keepAlive: true)
CropRepo cropRepo(CropRepoRef ref) {
  return CropRepo(FirebaseFirestore.instance);
}

@riverpod
Stream<List<Crop>> cropsStream(CropsStreamRef ref) {
  final cRepo = ref.watch(cropRepoProvider);

  return cRepo.streamCrops(uid: FirebaseAuth.instance.currentUser!.uid);
}

@riverpod
Future<List<Crop>> cropsList(CropsListRef ref, {required String fid}) {
  final cRepo = ref.watch(cropRepoProvider);
  return cRepo.fetchCrops(uid: FirebaseAuth.instance.currentUser!.uid);
}
