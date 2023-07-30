import 'package:freezed_annotation/freezed_annotation.dart';

part 'profilemodel.freezed.dart';
part 'profilemodel.g.dart';

@freezed
class ProfileModel with _$ProfileModel {
  factory ProfileModel(
      {required String fullname,
      required String phoneNumber,
      required String email,
      required String address,
      required String experience,
      required String pfp}) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}
