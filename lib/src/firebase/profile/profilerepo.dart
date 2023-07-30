import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../models/profile/profilemodel.dart';

part 'profilerepo.g.dart';

class ProfileRepository {
  FirebaseAuth? users;
  final FirebaseFirestore _firestore;

  ProfileRepository(this._firestore);

  static String profilepath(String uid) => 'users/$uid/profile';
  static String profilep(String pid, String uid) => 'users/$uid/profile/$pid';

  Query<ProfileModel> qProfile({required String uid}) {
    return _firestore.collection(profilepath(uid)).withConverter(
          fromFirestore: (snapshot, _) =>
              ProfileModel.fromJson(snapshot.data()!),
          toFirestore: (job, _) => job.toJson(),
        );
  }

  Stream<List<ProfileModel>> strProfs({required String uid}) {
    return qProfile(uid: uid)
        .snapshots()
        .map((event) => event.docs.map((e) => e.data()).toList());
  }

  Future<void> addProfile(
    ProfileModel prof,
    String uid,
  ) {
    return _firestore
        .collection('users')
        .doc(uid)
        .collection('profile')
        .doc('${uid}001')
        .set(prof.toJson());
  }
}

@Riverpod(keepAlive: true)
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepository(FirebaseFirestore.instance);
}

@riverpod
Stream<List<ProfileModel>> streamProfs(StreamProfsRef ref) {
  final repo = ref.watch(profileRepositoryProvider);
  return repo.strProfs(uid: FirebaseAuth.instance.currentUser!.uid);
}
