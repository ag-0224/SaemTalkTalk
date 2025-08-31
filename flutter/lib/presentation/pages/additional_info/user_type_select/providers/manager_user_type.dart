import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manager_user_type.g.dart';

@riverpod
class ManagerUserType extends _$ManagerUserType {
  @override
  bool build() => false;

  void toggle() {
    state = !state;
  }
}