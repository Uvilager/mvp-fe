// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_projects_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sponsorProjectsHash() => r'aa80d7bd3419e4b88642dff9db0525c5e50b0eb3';

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

/// See also [sponsorProjects].
@ProviderFor(sponsorProjects)
const sponsorProjectsProvider = SponsorProjectsFamily();

/// See also [sponsorProjects].
class SponsorProjectsFamily extends Family<AsyncValue<List<SponsorProject>>> {
  /// See also [sponsorProjects].
  const SponsorProjectsFamily();

  /// See also [sponsorProjects].
  SponsorProjectsProvider call(int sponsorId) {
    return SponsorProjectsProvider(sponsorId);
  }

  @override
  SponsorProjectsProvider getProviderOverride(
    covariant SponsorProjectsProvider provider,
  ) {
    return call(provider.sponsorId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'sponsorProjectsProvider';
}

/// See also [sponsorProjects].
class SponsorProjectsProvider
    extends AutoDisposeFutureProvider<List<SponsorProject>> {
  /// See also [sponsorProjects].
  SponsorProjectsProvider(int sponsorId)
    : this._internal(
        (ref) => sponsorProjects(ref as SponsorProjectsRef, sponsorId),
        from: sponsorProjectsProvider,
        name: r'sponsorProjectsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$sponsorProjectsHash,
        dependencies: SponsorProjectsFamily._dependencies,
        allTransitiveDependencies:
            SponsorProjectsFamily._allTransitiveDependencies,
        sponsorId: sponsorId,
      );

  SponsorProjectsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.sponsorId,
  }) : super.internal();

  final int sponsorId;

  @override
  Override overrideWith(
    FutureOr<List<SponsorProject>> Function(SponsorProjectsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SponsorProjectsProvider._internal(
        (ref) => create(ref as SponsorProjectsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        sponsorId: sponsorId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SponsorProject>> createElement() {
    return _SponsorProjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SponsorProjectsProvider && other.sponsorId == sponsorId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, sponsorId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SponsorProjectsRef on AutoDisposeFutureProviderRef<List<SponsorProject>> {
  /// The parameter `sponsorId` of this provider.
  int get sponsorId;
}

class _SponsorProjectsProviderElement
    extends AutoDisposeFutureProviderElement<List<SponsorProject>>
    with SponsorProjectsRef {
  _SponsorProjectsProviderElement(super.provider);

  @override
  int get sponsorId => (origin as SponsorProjectsProvider).sponsorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
