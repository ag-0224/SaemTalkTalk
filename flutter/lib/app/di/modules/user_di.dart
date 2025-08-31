import 'package:saem_talk_talk/app/di/app_binding.dart';
import 'package:saem_talk_talk/app/di/feature_di_interface.dart';
import 'package:saem_talk_talk/features/user/user.dart';

final class UserDependencyInjection extends FeatureDependencyInjection {
  @override
  void dataSources() {
    locator
      ..registerLazySingleton<UserRemoteDataSource>(
        UserRemoteDataSourceImpl.new,
      );
  }

  @override
  void repositories() {
    locator.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(
        userRemoteDataSource,
      ),
    );
  }

  @override
  void useCases() {
    locator
      ..registerFactory(
        () => GetUserDataUseCase(
          userRepository,
        ),
      )
      ..registerFactory(
        () => CreateUserUseCase(
          userRepository,
        ),
      );
  }
}
