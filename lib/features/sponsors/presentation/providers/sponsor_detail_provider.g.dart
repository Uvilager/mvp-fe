// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sponsor_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$sponsorDetailHash() => r'896a9ff2f5c1e661898c4b43d0d9cc8cfc1ae347';

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

/// See also [sponsorDetail].
@ProviderFor(sponsorDetail)
const sponsorDetailProvider = SponsorDetailFamily();

/// See also [sponsorDetail].
class SponsorDetailFamily extends Family<AsyncValue<Sponsor>> {
  /// See also [sponsorDetail].
  const SponsorDetailFamily();

  /// See also [sponsorDetail].
  SponsorDetailProvider call(int sponsorId) {
    return SponsorDetailProvider(sponsorId);
  }

  @override
  SponsorDetailProvider getProviderOverride(
    covariant SponsorDetailProvider provider,
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
  String? get name => r'sponsorDetailProvider';
}

/// See also [sponsorDetail].
class SponsorDetailProvider extends AutoDisposeFutureProvider<Sponsor> {
  /// See also [sponsorDetail].
  SponsorDetailProvider(int sponsorId)
    : this._internal(
        (ref) => sponsorDetail(ref as SponsorDetailRef, sponsorId),
        from: sponsorDetailProvider,
        name: r'sponsorDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$sponsorDetailHash,
        dependencies: SponsorDetailFamily._dependencies,
        allTransitiveDependencies:
            SponsorDetailFamily._allTransitiveDependencies,
        sponsorId: sponsorId,
      );

  SponsorDetailProvider._internal(
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
    FutureOr<Sponsor> Function(SponsorDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SponsorDetailProvider._internal(
        (ref) => create(ref as SponsorDetailRef),
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
  AutoDisposeFutureProviderElement<Sponsor> createElement() {
    return _SponsorDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SponsorDetailProvider && other.sponsorId == sponsorId;
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
mixin SponsorDetailRef on AutoDisposeFutureProviderRef<Sponsor> {
  /// The parameter `sponsorId` of this provider.
  int get sponsorId;
}

class _SponsorDetailProviderElement
    extends AutoDisposeFutureProviderElement<Sponsor>
    with SponsorDetailRef {
  _SponsorDetailProviderElement(super.provider);

  @override
  int get sponsorId => (origin as SponsorDetailProvider).sponsorId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
