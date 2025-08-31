// import 'package:flutter/material.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';
// import 'package:saem_talk_talk/app/router/router.dart';
// import 'package:saem_talk_talk/core/modules/local/app_secure_local.dart';
// import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';
// import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
// import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
//
// class MainPage extends BasePage {
//   const MainPage({super.key});
//
//   @override
//   Widget buildPage(BuildContext context, WidgetRef ref) {
//     return Center(
//       child: Column(
//         children: [
//           ElevatedButton(
//               onPressed: () async {
//                 ref.read(userAuthProvider.notifier).signOut();
//                 const SignInRoute().go(ref.context);
//               },
//               child: Text('로그아웃')),
//         ],
//       ),
//     );
//   }
//
//   @override
//   PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
//     return const CustomAppBar(title: '쌤톡톡');
//   }
// }
