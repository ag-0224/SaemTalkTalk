// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_list_pagination_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$companyListPaginationHash() =>
    r'7a9b778cbd8ee9c4247a4895c481820f5e29fee4';

/// See also [companyListPagination].
@ProviderFor(companyListPagination)
final companyListPaginationProvider = AutoDisposeProvider<
    Raw<
        PagingController<DocumentSnapshot<CompanyModel>?,
            CompanyEntity>>>.internal(
  companyListPagination,
  name: r'companyListPaginationProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$companyListPaginationHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CompanyListPaginationRef = AutoDisposeProviderRef<
    Raw<PagingController<DocumentSnapshot<CompanyModel>?, CompanyEntity>>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
