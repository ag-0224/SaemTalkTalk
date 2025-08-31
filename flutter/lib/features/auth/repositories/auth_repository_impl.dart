import 'package:firebase_auth/firebase_auth.dart';
import 'package:saem_talk_talk/core/index.dart';
import 'package:saem_talk_talk/features/auth/data_source/remote/auth_remote_data_source.dart';
import 'package:saem_talk_talk/features/auth/repositories/auth_repository.dart';

final class AuthRepositoryImpl implements AuthRepository {
  const AuthRepositoryImpl(
    this._authRemoteDataSource,
  );

  final AuthRemoteDataSource _authRemoteDataSource;

  @override
  Future<Result<UserCredential>> signInAuth(
      String email, String password) async {
    try {
      final userCredential =
          await _authRemoteDataSource.signIn(email, password);

      return Result.success(userCredential);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<UserCredential>> signUpAuth(
      String email, String password) async {
    try {
      final userCredential =
          await _authRemoteDataSource.signUp(email, password);

      return Result.success(userCredential);
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> sendEmailVerificationByLink() async {
    try {
      return Result.success(
        await _authRemoteDataSource.sendEmailVerification(),
      );
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }

  @override
  Future<Result<void>> signOutAuth() async {
    try {
      return Result.success(
        await _authRemoteDataSource.signOut(),
      );
    } on Exception catch (e) {
      return Result.failure(e);
    }
  }
}
