// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_with_projects_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sponsorWithProjectsHash() =>
    r'b5dc0fb2c7a0164ccc59a2f6e1dc214a4ede3502';

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

/// See also [sponsorWithProjects].
@ProviderFor(sponsorWithProjects)
const sponsorWithProjectsProvider = SponsorWithProjectsFamily();

/// See also [sponsorWithProjects].
class SponsorWithProjectsFamily
    extends Family<AsyncValue<Map<String, dynamic>>> {
  /// See also [sponsorWithProjects].
  const SponsorWithProjectsFamily();

  /// See also [sponsorWithProjects].
  SponsorWithProjectsProvider call(int sponsorId) {
    return SponsorWithProjectsProvider(sponsorId);
  }

  @override
  SponsorWithProjectsProvider getProviderOverride(
    covariant SponsorWithProjectsProvider provider,
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
  String? get name => r'sponsorWithProjectsProvider';
}

/// See also [sponsorWithProjects].
class SponsorWithProjectsProvider
    extends AutoDisposeFutureProvider<Map<String, dynamic>> {
  /// See also [sponsorWithProjects].
  SponsorWithProjectsProvider(int sponsorId)
    : this._internal(
        (ref) => sponsorWithProjects(ref as SponsorWithProjectsRef, sponsorId),
        from: sponsorWithProjectsProvider,
        name: r'sponsorWithProjectsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$sponsorWithProjectsHash,
        dependencies: SponsorWithProjectsFamily._dependencies,
        allTransitiveDependencies:
            SponsorWithProjectsFamily._allTransitiveDependencies,
        sponsorId: sponsorId,
      );

  SponsorWithProjectsProvider._internal(
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
    FutureOr<Map<String, dynamic>> Function(SponsorWithProjectsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SponsorWithProjectsProvider._internal(
        (ref) => create(ref as SponsorWithProjectsRef),
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
  AutoDisposeFutureProviderElement<Map<String, dynamic>> createElement() {
    return _SponsorWithProjectsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SponsorWithProjectsProvider && other.sponsorId == sponsorId;
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
mixin SponsorWithProjectsRef
    on AutoDisposeFutureProviderRef<Map<String, dynamic>> {
  /// The parameter `sponsorId` of this provider.
  int get sponsorId;
}

class _SponsorWithProjectsProviderElement
    extends AutoDisposeFutureProviderElement<Map<String, dynamic>>
    with SponsorWithProjectsRef {
  _SponsorWithProjectsProviderElement(super.provider);

  @override
  int get sponsorId => (origin as SponsorWithProjectsProvider).sponsorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
