// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pest.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$pestRepoHash() => r'9a936c70578437e7249baa38819245d5c92ce3a9';

/// See also [pestRepo].
@ProviderFor(pestRepo)
final pestRepoProvider = Provider<PestRepo>.internal(
  pestRepo,
  name: r'pestRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$pestRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PestRepoRef = ProviderRef<PestRepo>;
String _$pestsStreamHash() => r'5246aa01451900a18a61a722434ceaecac99c35b';

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

typedef PestsStreamRef = AutoDisposeStreamProviderRef<List<Pests>>;

/// See also [pestsStream].
@ProviderFor(pestsStream)
const pestsStreamProvider = PestsStreamFamily();

/// See also [pestsStream].
class PestsStreamFamily extends Family<AsyncValue<List<Pests>>> {
  /// See also [pestsStream].
  const PestsStreamFamily();

  /// See also [pestsStream].
  PestsStreamProvider call({
    required String fid,
  }) {
    return PestsStreamProvider(
      fid: fid,
    );
  }

  @override
  PestsStreamProvider getProviderOverride(
    covariant PestsStreamProvider provider,
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
  String? get name => r'pestsStreamProvider';
}

/// See also [pestsStream].
class PestsStreamProvider extends AutoDisposeStreamProvider<List<Pests>> {
  /// See also [pestsStream].
  PestsStreamProvider({
    required this.fid,
  }) : super.internal(
          (ref) => pestsStream(
            ref,
            fid: fid,
          ),
          from: pestsStreamProvider,
          name: r'pestsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pestsStreamHash,
          dependencies: PestsStreamFamily._dependencies,
          allTransitiveDependencies:
              PestsStreamFamily._allTransitiveDependencies,
        );

  final String fid;

  @override
  bool operator ==(Object other) {
    return other is PestsStreamProvider && other.fid == fid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$pestsListHash() => r'9565aca29ed0133d8d8817659797c625438bfdc3';
typedef PestsListRef = AutoDisposeFutureProviderRef<List<Pests>>;

/// See also [pestsList].
@ProviderFor(pestsList)
const pestsListProvider = PestsListFamily();

/// See also [pestsList].
class PestsListFamily extends Family<AsyncValue<List<Pests>>> {
  /// See also [pestsList].
  const PestsListFamily();

  /// See also [pestsList].
  PestsListProvider call({
    required String fid,
  }) {
    return PestsListProvider(
      fid: fid,
    );
  }

  @override
  PestsListProvider getProviderOverride(
    covariant PestsListProvider provider,
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
  String? get name => r'pestsListProvider';
}

/// See also [pestsList].
class PestsListProvider extends AutoDisposeFutureProvider<List<Pests>> {
  /// See also [pestsList].
  PestsListProvider({
    required this.fid,
  }) : super.internal(
          (ref) => pestsList(
            ref,
            fid: fid,
          ),
          from: pestsListProvider,
          name: r'pestsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$pestsListHash,
          dependencies: PestsListFamily._dependencies,
          allTransitiveDependencies: PestsListFamily._allTransitiveDependencies,
        );

  final String fid;

  @override
  bool operator ==(Object other) {
    return other is PestsListProvider && other.fid == fid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
