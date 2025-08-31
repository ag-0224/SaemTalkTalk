import 'package:firebase_auth/firebase_auth.dart';
import 'package:saem_talk_talk/features/auth/data_source/remote/auth_remote_data_source.dart';

final class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserCredential> signIn(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<UserCredential> signUp(String email, String password) {
    return _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> sendEmailVerification() {
    return _firebaseAuth.currentUser!.sendEmailVerification();
  }

  @override
  Future<void> signOut() {
    return _firebaseAuth.signOut();
  }
}
