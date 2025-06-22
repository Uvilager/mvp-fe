// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_request_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$districtsHash() => r'cb89802a47817baeb4657ab71028f25ae103408f';

/// See also [districts].
@ProviderFor(districts)
final districtsProvider = AutoDisposeFutureProvider<List<District>>.internal(
  districts,
  name: r'districtsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$districtsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef DistrictsRef = AutoDisposeFutureProviderRef<List<District>>;
String _$projectRequestsHash() => r'85a970bb1d8645897a7d9731f36f3dc2db653fd9';

/// See also [projectRequests].
@ProviderFor(projectRequests)
final projectRequestsProvider =
    AutoDisposeFutureProvider<List<ProjectRequestResponse>>.internal(
      projectRequests,
      name: r'projectRequestsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$projectRequestsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProjectRequestsRef =
    AutoDisposeFutureProviderRef<List<ProjectRequestResponse>>;
String _$projectRequestHash() => r'71e12e83233f5742b52d255fd26821b3ddf1f9d7';

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

/// See also [projectRequest].
@ProviderFor(projectRequest)
const projectRequestProvider = ProjectRequestFamily();

/// See also [projectRequest].
class ProjectRequestFamily extends Family<AsyncValue<ProjectRequestResponse>> {
  /// See also [projectRequest].
  const ProjectRequestFamily();

  /// See also [projectRequest].
  ProjectRequestProvider call(int id) {
    return ProjectRequestProvider(id);
  }

  @override
  ProjectRequestProvider getProviderOverride(
    covariant ProjectRequestProvider provider,
  ) {
    return call(provider.id);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectRequestProvider';
}

/// See also [projectRequest].
class ProjectRequestProvider
    extends AutoDisposeFutureProvider<ProjectRequestResponse> {
  /// See also [projectRequest].
  ProjectRequestProvider(int id)
    : this._internal(
        (ref) => projectRequest(ref as ProjectRequestRef, id),
        from: projectRequestProvider,
        name: r'projectRequestProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$projectRequestHash,
        dependencies: ProjectRequestFamily._dependencies,
        allTransitiveDependencies:
            ProjectRequestFamily._allTransitiveDependencies,
        id: id,
      );

  ProjectRequestProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<ProjectRequestResponse> Function(ProjectRequestRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectRequestProvider._internal(
        (ref) => create(ref as ProjectRequestRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<ProjectRequestResponse> createElement() {
    return _ProjectRequestProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectRequestProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectRequestRef
    on AutoDisposeFutureProviderRef<ProjectRequestResponse> {
  /// The parameter `id` of this provider.
  int get id;
}

class _ProjectRequestProviderElement
    extends AutoDisposeFutureProviderElement<ProjectRequestResponse>
    with ProjectRequestRef {
  _ProjectRequestProviderElement(super.provider);

  @override
  int get id => (origin as ProjectRequestProvider).id;
}

String _$projectRequestNotifierHash() =>
    r'3d1ae1f8fa026b90085063e6b2ca7240b7115631';

/// See also [ProjectRequestNotifier].
@ProviderFor(ProjectRequestNotifier)
final projectRequestNotifierProvider = AutoDisposeAsyncNotifierProvider<
  ProjectRequestNotifier,
  ProjectRequestResponse?
>.internal(
  ProjectRequestNotifier.new,
  name: r'projectRequestNotifierProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$projectRequestNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$ProjectRequestNotifier =
    AutoDisposeAsyncNotifier<ProjectRequestResponse?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
