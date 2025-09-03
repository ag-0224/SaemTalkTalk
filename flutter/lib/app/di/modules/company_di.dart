import 'package:saem_talk_talk/app/di/app_binding.dart';
import 'package:saem_talk_talk/app/di/feature_di_interface.dart';
import 'package:saem_talk_talk/core/query_constraints_applier.dart';
import 'package:saem_talk_talk/features/company/company.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/company_repositoy_impl.dart';
import 'package:saem_talk_talk/features/company/use_case/get_company_list_use_case.dart';
import 'package:saem_talk_talk/features/company/use_case/get_department_list_use_case.dart';
import 'package:saem_talk_talk/features/company/use_case/get_position_list_use_case.dart';

final class CompanyDependencyInjection extends FeatureDependencyInjection {
  @override
  void dataSources() {
    locator.registerLazySingleton<CompanyRemoteDataSource>(
      () => CompanyRemoteDataSourceImpl(QueryConstraintApplier()),
    );
  }

  @override
  void repositories() {
    locator.registerLazySingleton<CompanyRepository>(
      () => CompanyRepositoryImpl(companyRemoteDataSource),
    );
  }

  @override
  void useCases() {
    locator
      ..registerFactory(
        () => GetCompanyListUseCase(
          companyRepositoy,
        ),
      )
      ..registerFactory(
        () => GetDepartmentListUseCase(
          companyRepositoy,
        ),
      )
      ..registerFactory(
            () => GetPositionListUseCase(
          companyRepositoy,
        ),
      );
  }
}
