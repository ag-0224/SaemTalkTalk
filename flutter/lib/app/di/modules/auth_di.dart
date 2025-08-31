import 'package:saem_talk_talk/app/di/app_binding.dart';
import 'package:saem_talk_talk/app/di/feature_di_interface.dart';
import 'package:saem_talk_talk/features/auth/auth.dart';

final class AuthDependencyInjection extends FeatureDependencyInjection {
  @override
  void dataSources() {
    locator.registerLazySingleton<AuthRemoteDataSource>(
      AuthRemoteDataSourceImpl.new,
    );
  }

  @override
  void repositories() {
    locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource),
    );
  }

  @override
  void useCases() {
    locator
      ..registerFactory(
        () => SignInUseCase(
          authRepository,
        ),
      )
      ..registerFactory(
        () => SignUpUseCase(
          authRepository,
        ),
      )
      ..registerFactory(
        () => SendEmailVerificationUseCase(
          authRepository,
        ),
      )
      ..registerFactory(
        () => SignOutUseCase(
          authRepository,
        ),
      );
  }
}
