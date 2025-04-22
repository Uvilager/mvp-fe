// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fundraiser_detail_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fundraiserDetailHash() => r'9390ed51983175f34563d9830ad1ab276f1c119f';

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

/// See also [fundraiserDetail].
@ProviderFor(fundraiserDetail)
const fundraiserDetailProvider = FundraiserDetailFamily();

/// See also [fundraiserDetail].
class FundraiserDetailFamily extends Family<AsyncValue<Fundraiser>> {
  /// See also [fundraiserDetail].
  const FundraiserDetailFamily();

  /// See also [fundraiserDetail].
  FundraiserDetailProvider call(int fundraiserId) {
    return FundraiserDetailProvider(fundraiserId);
  }

  @override
  FundraiserDetailProvider getProviderOverride(
    covariant FundraiserDetailProvider provider,
  ) {
    return call(provider.fundraiserId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'fundraiserDetailProvider';
}

/// See also [fundraiserDetail].
class FundraiserDetailProvider extends AutoDisposeFutureProvider<Fundraiser> {
  /// See also [fundraiserDetail].
  FundraiserDetailProvider(int fundraiserId)
    : this._internal(
        (ref) => fundraiserDetail(ref as FundraiserDetailRef, fundraiserId),
        from: fundraiserDetailProvider,
        name: r'fundraiserDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$fundraiserDetailHash,
        dependencies: FundraiserDetailFamily._dependencies,
        allTransitiveDependencies:
            FundraiserDetailFamily._allTransitiveDependencies,
        fundraiserId: fundraiserId,
      );

  FundraiserDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.fundraiserId,
  }) : super.internal();

  final int fundraiserId;

  @override
  Override overrideWith(
    FutureOr<Fundraiser> Function(FundraiserDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FundraiserDetailProvider._internal(
        (ref) => create(ref as FundraiserDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        fundraiserId: fundraiserId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Fundraiser> createElement() {
    return _FundraiserDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FundraiserDetailProvider &&
        other.fundraiserId == fundraiserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, fundraiserId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FundraiserDetailRef on AutoDisposeFutureProviderRef<Fundraiser> {
  /// The parameter `fundraiserId` of this provider.
  int get fundraiserId;
}

class _FundraiserDetailProviderElement
    extends AutoDisposeFutureProviderElement<Fundraiser>
    with FundraiserDetailRef {
  _FundraiserDetailProviderElement(super.provider);

  @override
  int get fundraiserId => (origin as FundraiserDetailProvider).fundraiserId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
