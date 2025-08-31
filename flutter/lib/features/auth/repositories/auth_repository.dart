import 'package:firebase_auth/firebase_auth.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';

abstract interface class AuthRepository {
  ///
  /// [email]과 [password]를 통해 로그인
  ///
  Future<Result<UserCredential>> signInAuth(String email, String password);

  ///
  /// [email]과 [password]를 통해 회원가입
  ///
  Future<Result<UserCredential>> signUpAuth(String email, String password);

  ///
  /// [currentUser] 의 [email] 인증
  ///
  Future<Result<void>> sendEmailVerificationByLink();

  ///
  /// 로그아웃
  ///
  Future<Result<void>> signOutAuth();
}
