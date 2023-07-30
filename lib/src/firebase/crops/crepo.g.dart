// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crepo.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$cropRepoHash() => r'4aefb4c09a2b904c6efecdefc1fe22912f51c95b';

/// See also [cropRepo].
@ProviderFor(cropRepo)
final cropRepoProvider = Provider<CropRepo>.internal(
  cropRepo,
  name: r'cropRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cropRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CropRepoRef = ProviderRef<CropRepo>;
String _$cropsStreamHash() => r'cd25cc177a900c16e1cfa91f4d8303ece88c354b';

/// See also [cropsStream].
@ProviderFor(cropsStream)
final cropsStreamProvider = AutoDisposeStreamProvider<List<Crop>>.internal(
  cropsStream,
  name: r'cropsStreamProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$cropsStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CropsStreamRef = AutoDisposeStreamProviderRef<List<Crop>>;
String _$cropsListHash() => r'1b4ace1a9d0575f3e7d9756af2929f6658546c9c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef CropsListRef = AutoDisposeFutureProviderRef<List<Crop>>;

/// See also [cropsList].
@ProviderFor(cropsList)
const cropsListProvider = CropsListFamily();

/// See also [cropsList].
class CropsListFamily extends Family<AsyncValue<List<Crop>>> {
  /// See also [cropsList].
  const CropsListFamily();

  /// See also [cropsList].
  CropsListProvider call({
    required String fid,
  }) {
    return CropsListProvider(
      fid: fid,
    );
  }

  @override
  CropsListProvider getProviderOverride(
    covariant CropsListProvider provider,
  ) {
    return call(
      fid: provider.fid,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'cropsListProvider';
}

/// See also [cropsList].
class CropsListProvider extends AutoDisposeFutureProvider<List<Crop>> {
  /// See also [cropsList].
  CropsListProvider({
    required this.fid,
  }) : super.internal(
          (ref) => cropsList(
            ref,
            fid: fid,
          ),
          from: cropsListProvider,
          name: r'cropsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$cropsListHash,
          dependencies: CropsListFamily._dependencies,
          allTransitiveDependencies: CropsListFamily._allTransitiveDependencies,
        );

  final String fid;

  @override
  bool operator ==(Object other) {
    return other is CropsListProvider && other.fid == fid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
