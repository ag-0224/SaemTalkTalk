import 'package:saem_talk_talk/core/index.dart';
import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';
import 'package:saem_talk_talk/features/user/repositories/user_repository.dart';

final class CreateUserUseCase extends BaseUseCase<UserEntity, Result<void>> {
  CreateUserUseCase(
    this._userRepository,
  );

  final UserRepository _userRepository;

  @override
  Future<Result<void>> call(UserEntity data) async {
    return _userRepository.createUser(data);
  }
}
