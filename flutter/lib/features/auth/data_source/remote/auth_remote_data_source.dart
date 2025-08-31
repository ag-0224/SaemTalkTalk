import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthRemoteDataSource {
  ///
  /// Auth trigger
  ///
  Future<UserCredential> signIn(String email, String password);

  ///
  /// 회원가입
  ///
  Future<UserCredential> signUp(String email, String password);

  ///
  /// 이메일 인증
  ///
  Future<void> sendEmailVerification();

  ///
  /// Auth 로그아웃
  ///
  Future<void> signOut();
}
