import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';

mixin class UserVerificationState {
  ///
  /// 현재 유저의 이메일
  ///
  String? userEmail(WidgetRef ref) =>
      ref.watch(userAuthProvider)?.email;
}