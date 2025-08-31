import 'package:saem_talk_talk/core/index.dart';
import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';
import 'package:saem_talk_talk/features/user/repositories/user_repository.dart';

final class GetUserDataUseCase extends BaseNoParamUseCase<Result<UserEntity>> {
  GetUserDataUseCase(
    this._userRepository,
  );

  final UserRepository _userRepository;

  Future<Result<UserEntity>> call() async {
    return _userRepository.getUser();
  }
}
