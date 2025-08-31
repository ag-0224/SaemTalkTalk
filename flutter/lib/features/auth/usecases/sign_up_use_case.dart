import 'package:firebase_auth/firebase_auth.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/auth/repositories/auth_repository.dart';

final class SignUpUseCase {
  const SignUpUseCase(this._authRepository);

  final AuthRepository _authRepository;

  Future<Result<UserCredential>> call(String email, String password) async {
    return _authRepository.signUpAuth(email, password);
  }
}