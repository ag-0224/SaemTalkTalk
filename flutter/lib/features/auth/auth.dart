import 'package:saem_talk_talk/app/di/app_binding.dart';
import 'package:saem_talk_talk/features/auth/data_source/remote/auth_remote_data_source.dart';
import 'package:saem_talk_talk/features/auth/repositories/auth_repository.dart';
import 'package:saem_talk_talk/features/auth/usecases/send_email_verification_use_case.dart';
import 'package:saem_talk_talk/features/auth/usecases/sign_in_use_case.dart';
import 'package:saem_talk_talk/features/auth/usecases/sign_out_use_case.dart';
import 'package:saem_talk_talk/features/auth/usecases/sign_up_use_case.dart';

export 'auth.dart';
export 'data_source/remote/auth_remote_data_source.dart';
export 'data_source/remote/auth_remote_data_source_impl.dart';
export 'repositories/auth_repository.dart';
export 'repositories/auth_repository_impl.dart';
export 'usecases/sign_in_use_case.dart';
export 'usecases/sign_up_use_case.dart';
export 'usecases/send_email_verification_use_case.dart';
export 'usecases/sign_out_use_case.dart';

final authRemoteDataSource = locator<AuthRemoteDataSource>();
final authRepository = locator<AuthRepository>();
final signInUseCase = locator<SignInUseCase>();
final signUpUseCase = locator<SignUpUseCase>();
final sendEmailVerificationUseCase = locator<SendEmailVerificationUseCase>();
final signOutUseCase = locator<SignOutUseCase>();