// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profilerepo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileRepositoryHash() => r'c1e1c5e820702a3d191905477db9aba9b798dc36';

/// See also [profileRepository].
@ProviderFor(profileRepository)
final profileRepositoryProvider = Provider<ProfileRepository>.internal(
  profileRepository,
  name: r'profileRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$profileRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef ProfileRepositoryRef = ProviderRef<ProfileRepository>;
String _$streamProfsHash() => r'f9f69a3630d03dc1fb7ff9f5ca2d748175387cfe';

/// See also [streamProfs].
@ProviderFor(streamProfs)
final streamProfsProvider =
    AutoDisposeStreamProvider<List<ProfileModel>>.internal(
  streamProfs,
  name: r'streamProfsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$streamProfsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef StreamProfsRef = AutoDisposeStreamProviderRef<List<ProfileModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
