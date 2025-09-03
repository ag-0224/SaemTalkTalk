import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/company_select_page.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/manager_detail_input_page.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_detail_input_route_arg_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/teacher_detail_input_page.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_type_select/user_type_select_page.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_verification/user_verification_page.dart';
import 'package:saem_talk_talk/presentation/pages/permission/permission_page.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/sign_in_page.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/sign_up_page.dart';
import 'package:saem_talk_talk/presentation/pages/splash/splash_page.dart';

part 'router.g.dart';

///
/// 부모 라우트가 [$extra]로 argument를 전달하고 있고
/// 자식 라우트도 동일하게 [$extra]로 argument을 전달하는 상황일 때
/// 부모 [$extra]값이 자식[$extra]를 덮어쓰는 고질적인 이슈가 존재.
///
/// 해당 이슈: https://github.com/flutter/flutter/issues/106121
///
/// 1년 반이 더 지난 이슈지만 Flutter tream에서 해결의지 크게 없어보임.
/// 이를 우회회할 수 있는 방법은 라우트를 부모와 자식으로 구분하지 않는 것인데,
/// 이렇게 되면 route path경로를 유동적으로 설정하지 못한다는 문제점이 발생.
/// 이러한 이유로 [ChatListRoute] 라우트 모듈의 경우 [$extra]를 통해 인자를 전달 받지 않고
/// Route 모듈의 전역변수 값을 외부에서 업데이트하여 필요한 섹션에 인자를 전달하는 중
///
///

final rootNavigatorKey = GlobalKey<NavigatorState>();

abstract final class AppRouter {
  static GoRouter appRouter(WidgetRef ref) => GoRouter(
        debugLogDiagnostics: true,
        navigatorKey: rootNavigatorKey,
        initialLocation: SplashRoute.path,
        routes: $appRoutes,
      );
}

///
/// splash
///
@TypedGoRoute<SplashRoute>(
  path: SplashRoute.path,
  name: SplashRoute.name,
)
class SplashRoute extends GoRouteData {
  const SplashRoute();

  static const String path = '/splash';
  static const String name = 'splash';

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween(begin: 1.0, end: 0.0).animate(secondaryAnimation),
          child: child,
        );
      },
      child: const SplashPage(),
    );
  }
}

///
/// permission Route
///
@TypedGoRoute<PermissionRoute>(
  path: PermissionRoute.path,
  name: PermissionRoute.name,
)
class PermissionRoute extends GoRouteData {
  const PermissionRoute();

  static const String path = '/permission';
  static const String name = 'permission';

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        );
      },
      child: const PermissionPage(),
    );
  }
}

///
/// Sign In Route
///
@TypedGoRoute<SignInRoute>(
  path: SignInRoute.path,
  name: SignInRoute.name,
)
class SignInRoute extends GoRouteData {
  const SignInRoute();

  static const String path = '/sign-in';
  static const String name = 'sign in';

  @override
  Page<Function> buildPage(BuildContext context, GoRouterState state) {
    return CustomTransitionPage(
      key: state.pageKey,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
          child: child,
        );
      },
      child: const SignInPage(),
    );
  }
}

///
/// Sign Up Route
///
@TypedGoRoute<SignUpRoute>(
  path: SignUpRoute.path,
  name: SignUpRoute.name,
)
class SignUpRoute extends GoRouteData {
  const SignUpRoute();

  static const String path = '/sign-up';
  static const String name = 'sign up';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SignUpPage();
  }
}

///
/// User Verification Route
///
@TypedGoRoute<UserVerificationRoute>(
  path: UserVerificationRoute.path,
  name: UserVerificationRoute.name,
)
class UserVerificationRoute extends GoRouteData {
  const UserVerificationRoute();

  static const String path = '/user-verification';
  static const String name = 'user verification';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserVerificationPage();
  }
}

///
/// User Type Select Route
///
@TypedGoRoute<UserTypeSelectRoute>(
  path: UserTypeSelectRoute.path,
  name: UserTypeSelectRoute.name,
)
class UserTypeSelectRoute extends GoRouteData {
  const UserTypeSelectRoute();

  static const String path = '/user-type-select';
  static const String name = 'user type select';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return UserTypeSelectPage();
  }
}

///
/// Manger Detail Input Route
///
@TypedGoRoute<ManagerDetailInputRoute>(
  path: ManagerDetailInputRoute.path,
  name: ManagerDetailInputRoute.name,
)
class ManagerDetailInputRoute extends GoRouteData {
  const ManagerDetailInputRoute();

  static const String path = '/manager-detail-input';
  static const String name = 'manager detail input';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ManagerDetailInputPage();
  }
}

///
/// Company Select Route
///
@TypedGoRoute<CompanySelectRoute>(
  path: CompanySelectRoute.path,
  name: CompanySelectRoute.name,
  routes: [
    TypedGoRoute<TeacherDetailInputRoute>(
      path: TeacherDetailInputRoute.path,
      name: TeacherDetailInputRoute.name,
    ),
  ],
)
class CompanySelectRoute extends GoRouteData {
  const CompanySelectRoute();

  static const String path = '/company-select-route';
  static const String name = 'company select route';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return CompanySelectPage();
  }
}

class TeacherDetailInputRoute extends GoRouteData {
  TeacherDetailInputRoute(this.$extra) : companyId = $extra.companyId;

  static const String path = 'teacher-detail-input/:companyId';
  static const String name = 'teacher detail input';
  static late TeacherDetailInputRouteArg arg;

  final TeacherDetailInputRouteArg $extra;

  final String companyId;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    arg = $extra;
    return TeacherDetailInputPage();
  }
}

//
// ///
// /// Main Route
// ///
// @TypedGoRoute<MainRoute>(
//   path: MainRoute.path,
//   name: MainRoute.name,
// )
// class MainRoute extends GoRouteData {
//   const MainRoute();
//
//   static const String path = '/main';
//   static const String name = 'main';
//
//   @override
//   Page<Function> buildPage(BuildContext context, GoRouterState state) {
//     return CustomTransitionPage(
//       key: state.pageKey,
//       transitionsBuilder: (context, animation, secondaryAnimation, child) {
//         return FadeTransition(
//           opacity: Tween(begin: 0.0, end: 1.0).animate(animation),
//           child: child,
//         );
//       },
//       child: const MainPage(),
//     );
//   }
//}
