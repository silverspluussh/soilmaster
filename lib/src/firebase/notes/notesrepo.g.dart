// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notesrepo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notesRepoHash() => r'3822cda189d4dfdb012e97f67a6988b07903ffef';

/// See also [notesRepo].
@ProviderFor(notesRepo)
final notesRepoProvider = Provider<NotesRepo>.internal(
  notesRepo,
  name: r'notesRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notesRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotesRepoRef = ProviderRef<NotesRepo>;
String _$notesStreamHash() => r'04f77e201237c7fec6c364036a30e9da145cc90d';

/// See also [notesStream].
@ProviderFor(notesStream)
final notesStreamProvider =
    AutoDisposeStreamProvider<List<NotesModel>>.internal(
  notesStream,
  name: r'notesStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notesStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotesStreamRef = AutoDisposeStreamProviderRef<List<NotesModel>>;
String _$notesListHash() => r'501d73f6f4a003ace4d61e276f078e5ca8de5657';

/// See also [notesList].
@ProviderFor(notesList)
final notesListProvider = AutoDisposeFutureProvider<List<NotesModel>>.internal(
  notesList,
  name: r'notesListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$notesListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NotesListRef = AutoDisposeFutureProviderRef<List<NotesModel>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
