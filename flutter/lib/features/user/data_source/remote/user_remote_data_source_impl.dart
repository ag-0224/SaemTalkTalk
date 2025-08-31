import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:saem_talk_talk/core/modules/exceptions/custom_exception.dart';
import 'package:saem_talk_talk/features/user/data_source/remote/models/user_model.dart';
import 'package:saem_talk_talk/features/user/data_source/remote/user_remote_data_source.dart';
import 'package:saem_talk_talk/features/user/data_source/remote/users_ref.dart';
import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';

final class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  @override
  Future<void> createUser(UserEntity data) async {
    if (await FirestoreUsersRef.isExist()) {
      throw const AlreadyExistUserDataException();
    }

    final userData = FirestoreUsersRef.doc();
    final user = UserModel.fromEntity(data);

    await userData.set(user);
  }

  @override
  Future<UserModel> getUser([String? uid]) async {
    if (!await FirestoreUsersRef.isExist()) {
      throw const NoUserDataException();
    }

    final snapshot = await FirestoreUsersRef.doc(uid).get();

    await FirestoreUsersRef.doc(uid).update({
      FirestoreUsersRef.lastLoginDateField: FieldValue.serverTimestamp(),
      FirestoreUsersRef.loginCountField: FieldValue.increment(1),
    });

    return snapshot.data()!;
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    if (!await FirestoreUsersRef.isExist()) {
      throw const NoUserDataException();
    }

    final userModel = UserModel.fromEntity(user);

    await FirestoreUsersRef.doc().update(
      userModel.updatedFieldToJson(),
    );
  }

  @override
  Future<void> updateLastLoginDate() async {
    if (!await FirestoreUsersRef.isExist()) {
      throw const NoUserDataException();
    }

    await FirestoreUsersRef.doc().update({
      FirestoreUsersRef.lastLoginDateField: FieldValue.serverTimestamp(),
    });
  }
}
