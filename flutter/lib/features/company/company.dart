import 'package:saem_talk_talk/app/di/index.dart';
import 'package:saem_talk_talk/features/company/data_source/remote/company_remote_data_source.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/use_case/create_company_use_case.dart';
import 'package:saem_talk_talk/features/company/use_case/create_member_use_case.dart';
import 'package:saem_talk_talk/features/company/use_case/get_company_list_use_case.dart';
import 'package:saem_talk_talk/features/company/use_case/get_department_list_use_case.dart';
import 'package:saem_talk_talk/features/company/use_case/get_position_list_use_case.dart';

export 'package:saem_talk_talk/features/company/data_source/remote/company_remote_data_source.dart';
export 'package:saem_talk_talk/features/company/data_source/remote/company_remote_data_source_impl.dart';

final companyRemoteDataSource = locator<CompanyRemoteDataSource>();
final companyRepositoy = locator<CompanyRepository>();
final getCompanyListUseCase = locator<GetCompanyListUseCase>();
final getDepartmentListUseCase = locator<GetDepartmentListUseCase>();
final getPositionListUseCase = locator<GetPositionListUseCase>();
final createCompanyUseCase = locator<CreateCompanyUseCase>();
final createMemberUseCase = locator<CreateMemberUseCase>();