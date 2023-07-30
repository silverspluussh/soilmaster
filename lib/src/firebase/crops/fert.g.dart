// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fert.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fertRepoHash() => r'fb2b406439ec3209b4f9204f54e8d9bd06c98f1e';

/// See also [fertRepo].
@ProviderFor(fertRepo)
final fertRepoProvider = Provider<FertRepo>.internal(
  fertRepo,
  name: r'fertRepoProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$fertRepoHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef FertRepoRef = ProviderRef<FertRepo>;
String _$fertsStreamHash() => r'4914cab674bca1f3da0f27ab8858c56e6c7e56df';

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

typedef FertsStreamRef = AutoDisposeStreamProviderRef<List<Fertilizer>>;

/// See also [fertsStream].
@ProviderFor(fertsStream)
const fertsStreamProvider = FertsStreamFamily();

/// See also [fertsStream].
class FertsStreamFamily extends Family<AsyncValue<List<Fertilizer>>> {
  /// See also [fertsStream].
  const FertsStreamFamily();

  /// See also [fertsStream].
  FertsStreamProvider call({
    required String cid,
  }) {
    return FertsStreamProvider(
      cid: cid,
    );
  }

  @override
  FertsStreamProvider getProviderOverride(
    covariant FertsStreamProvider provider,
  ) {
    return call(
      cid: provider.cid,
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
  String? get name => r'fertsStreamProvider';
}

/// See also [fertsStream].
class FertsStreamProvider extends AutoDisposeStreamProvider<List<Fertilizer>> {
  /// See also [fertsStream].
  FertsStreamProvider({
    required this.cid,
  }) : super.internal(
          (ref) => fertsStream(
            ref,
            cid: cid,
          ),
          from: fertsStreamProvider,
          name: r'fertsStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fertsStreamHash,
          dependencies: FertsStreamFamily._dependencies,
          allTransitiveDependencies:
              FertsStreamFamily._allTransitiveDependencies,
        );

  final String cid;

  @override
  bool operator ==(Object other) {
    return other is FertsStreamProvider && other.cid == cid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cid.hashCode);

    return _SystemHash.finish(hash);
  }
}

String _$fertsListHash() => r'782e17bbc101ccec10725e42d07b083d7b03cee7';
typedef FertsListRef = AutoDisposeFutureProviderRef<List<Fertilizer>>;

/// See also [fertsList].
@ProviderFor(fertsList)
const fertsListProvider = FertsListFamily();

/// See also [fertsList].
class FertsListFamily extends Family<AsyncValue<List<Fertilizer>>> {
  /// See also [fertsList].
  const FertsListFamily();

  /// See also [fertsList].
  FertsListProvider call({
    required String cid,
  }) {
    return FertsListProvider(
      cid: cid,
    );
  }

  @override
  FertsListProvider getProviderOverride(
    covariant FertsListProvider provider,
  ) {
    return call(
      cid: provider.cid,
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
  String? get name => r'fertsListProvider';
}

/// See also [fertsList].
class FertsListProvider extends AutoDisposeFutureProvider<List<Fertilizer>> {
  /// See also [fertsList].
  FertsListProvider({
    required this.cid,
  }) : super.internal(
          (ref) => fertsList(
            ref,
            cid: cid,
          ),
          from: fertsListProvider,
          name: r'fertsListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fertsListHash,
          dependencies: FertsListFamily._dependencies,
          allTransitiveDependencies: FertsListFamily._allTransitiveDependencies,
        );

  final String cid;

  @override
  bool operator ==(Object other) {
    return other is FertsListProvider && other.cid == cid;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, cid.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
