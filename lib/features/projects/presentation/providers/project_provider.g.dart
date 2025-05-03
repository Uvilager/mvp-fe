// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$projectDetailHash() => r'c29b01eb1c6fd68a66fe963d6eed3549ab36aab9';

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

/// See also [projectDetail].
@ProviderFor(projectDetail)
const projectDetailProvider = ProjectDetailFamily();

/// See also [projectDetail].
class ProjectDetailFamily extends Family<AsyncValue<Project>> {
  /// See also [projectDetail].
  const ProjectDetailFamily();

  /// See also [projectDetail].
  ProjectDetailProvider call(int projectId) {
    return ProjectDetailProvider(projectId);
  }

  @override
  ProjectDetailProvider getProviderOverride(
    covariant ProjectDetailProvider provider,
  ) {
    return call(provider.projectId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'projectDetailProvider';
}

/// See also [projectDetail].
class ProjectDetailProvider extends AutoDisposeFutureProvider<Project> {
  /// See also [projectDetail].
  ProjectDetailProvider(int projectId)
    : this._internal(
        (ref) => projectDetail(ref as ProjectDetailRef, projectId),
        from: projectDetailProvider,
        name: r'projectDetailProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$projectDetailHash,
        dependencies: ProjectDetailFamily._dependencies,
        allTransitiveDependencies:
            ProjectDetailFamily._allTransitiveDependencies,
        projectId: projectId,
      );

  ProjectDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  Override overrideWith(
    FutureOr<Project> Function(ProjectDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectDetailProvider._internal(
        (ref) => create(ref as ProjectDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Project> createElement() {
    return _ProjectDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectDetailProvider && other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProjectDetailRef on AutoDisposeFutureProviderRef<Project> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _ProjectDetailProviderElement
    extends AutoDisposeFutureProviderElement<Project>
    with ProjectDetailRef {
  _ProjectDetailProviderElement(super.provider);

  @override
  int get projectId => (origin as ProjectDetailProvider).projectId;
}

String _$projectsBySponsorHash() => r'cebde5a112d519649af7373ab41d04438ca58e19';

/// See also [projectsBySponsor].
@ProviderFor(projectsBySponsor)
const projectsBySponsorProvider = ProjectsBySponsorFamily();

/// See also [projectsBySponsor].
class ProjectsBySponsorFamily extends Family<AsyncValue<List<Project>>> {
  /// See also [projectsBySponsor].
  const ProjectsBySponsorFamily();

  /// See also [projectsBySponsor].
  ProjectsBySponsorProvider call(int sponsorId) {
    return ProjectsBySponsorProvider(sponsorId);
  }

  @override
  ProjectsBySponsorProvider getProviderOverride(
    covariant ProjectsBySponsorProvider provider,
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
  String? get name => r'projectsBySponsorProvider';
}

/// See also [projectsBySponsor].
class ProjectsBySponsorProvider
    extends AutoDisposeFutureProvider<List<Project>> {
  /// See also [projectsBySponsor].
  ProjectsBySponsorProvider(int sponsorId)
    : this._internal(
        (ref) => projectsBySponsor(ref as ProjectsBySponsorRef, sponsorId),
        from: projectsBySponsorProvider,
        name: r'projectsBySponsorProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$projectsBySponsorHash,
        dependencies: ProjectsBySponsorFamily._dependencies,
        allTransitiveDependencies:
            ProjectsBySponsorFamily._allTransitiveDependencies,
        sponsorId: sponsorId,
      );

  ProjectsBySponsorProvider._internal(
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
    FutureOr<List<Project>> Function(ProjectsBySponsorRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProjectsBySponsorProvider._internal(
        (ref) => create(ref as ProjectsBySponsorRef),
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
  AutoDisposeFutureProviderElement<List<Project>> createElement() {
    return _ProjectsBySponsorProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProjectsBySponsorProvider && other.sponsorId == sponsorId;
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
mixin ProjectsBySponsorRef on AutoDisposeFutureProviderRef<List<Project>> {
  /// The parameter `sponsorId` of this provider.
  int get sponsorId;
}

class _ProjectsBySponsorProviderElement
    extends AutoDisposeFutureProviderElement<List<Project>>
    with ProjectsBySponsorRef {
  _ProjectsBySponsorProviderElement(super.provider);

  @override
  int get sponsorId => (origin as ProjectsBySponsorProvider).sponsorId;
}

String _$volunteerProjectDataHash() =>
    r'dc6b29f8a5ad571a57554dc72cdc4200a98235ff';

/// See also [volunteerProjectData].
@ProviderFor(volunteerProjectData)
const volunteerProjectDataProvider = VolunteerProjectDataFamily();

/// See also [volunteerProjectData].
class VolunteerProjectDataFamily
    extends Family<AsyncValue<VolunteerProjectData>> {
  /// See also [volunteerProjectData].
  const VolunteerProjectDataFamily();

  /// See also [volunteerProjectData].
  VolunteerProjectDataProvider call(int projectId) {
    return VolunteerProjectDataProvider(projectId);
  }

  @override
  VolunteerProjectDataProvider getProviderOverride(
    covariant VolunteerProjectDataProvider provider,
  ) {
    return call(provider.projectId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'volunteerProjectDataProvider';
}

/// See also [volunteerProjectData].
class VolunteerProjectDataProvider
    extends AutoDisposeFutureProvider<VolunteerProjectData> {
  /// See also [volunteerProjectData].
  VolunteerProjectDataProvider(int projectId)
    : this._internal(
        (ref) =>
            volunteerProjectData(ref as VolunteerProjectDataRef, projectId),
        from: volunteerProjectDataProvider,
        name: r'volunteerProjectDataProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$volunteerProjectDataHash,
        dependencies: VolunteerProjectDataFamily._dependencies,
        allTransitiveDependencies:
            VolunteerProjectDataFamily._allTransitiveDependencies,
        projectId: projectId,
      );

  VolunteerProjectDataProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.projectId,
  }) : super.internal();

  final int projectId;

  @override
  Override overrideWith(
    FutureOr<VolunteerProjectData> Function(VolunteerProjectDataRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: VolunteerProjectDataProvider._internal(
        (ref) => create(ref as VolunteerProjectDataRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        projectId: projectId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<VolunteerProjectData> createElement() {
    return _VolunteerProjectDataProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is VolunteerProjectDataProvider &&
        other.projectId == projectId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, projectId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin VolunteerProjectDataRef
    on AutoDisposeFutureProviderRef<VolunteerProjectData> {
  /// The parameter `projectId` of this provider.
  int get projectId;
}

class _VolunteerProjectDataProviderElement
    extends AutoDisposeFutureProviderElement<VolunteerProjectData>
    with VolunteerProjectDataRef {
  _VolunteerProjectDataProviderElement(super.provider);

  @override
  int get projectId => (origin as VolunteerProjectDataProvider).projectId;
}

String _$projectsHash() => r'007424f0136d6400cb9f51c7b2e055d949a81fa8';

/// See also [Projects].
@ProviderFor(Projects)
final projectsProvider =
    AutoDisposeAsyncNotifierProvider<Projects, List<Project>>.internal(
      Projects.new,
      name: r'projectsProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product') ? null : _$projectsHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$Projects = AutoDisposeAsyncNotifier<List<Project>>;
String _$projectMessagingHash() => r'c32c754f69471ba24e486ab0e764803f1940be56';

/// See also [ProjectMessaging].
@ProviderFor(ProjectMessaging)
final projectMessagingProvider =
    AsyncNotifierProvider<ProjectMessaging, List<String>>.internal(
      ProjectMessaging.new,
      name: r'projectMessagingProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$projectMessagingHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProjectMessaging = AsyncNotifier<List<String>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
