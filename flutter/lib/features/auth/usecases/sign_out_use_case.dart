import 'dart:async';

import 'package:saem_talk_talk/core/modules/base_use_case/base_no_param_use_case.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/auth/repositories/auth_repository.dart';

final class SignOutUseCase extends BaseNoParamUseCase<Result<void>> {
  SignOutUseCase(this._authRepository);

  final AuthRepository _authRepository;

  @override
  FutureOr<Result<void>> call() async => _authRepository.signOutAuth();
}