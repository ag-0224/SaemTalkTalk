// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [
      $splashRoute,
      $permissionRoute,
      $signInRoute,
      $signUpRoute,
      $userVerificationRoute,
      $userTypeSelectRoute,
      $managerDetailInputRoute,
      $companySelectRoute,
      $mainRoute,
    ];

RouteBase get $splashRoute => GoRouteData.$route(
      path: '/splash',
      name: 'splash',
      factory: $SplashRouteExtension._fromState,
    );

extension $SplashRouteExtension on SplashRoute {
  static SplashRoute _fromState(GoRouterState state) => const SplashRoute();

  String get location => GoRouteData.$location(
        '/splash',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $permissionRoute => GoRouteData.$route(
      path: '/permission',
      name: 'permission',
      factory: $PermissionRouteExtension._fromState,
    );

extension $PermissionRouteExtension on PermissionRoute {
  static PermissionRoute _fromState(GoRouterState state) =>
      const PermissionRoute();

  String get location => GoRouteData.$location(
        '/permission',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signInRoute => GoRouteData.$route(
      path: '/sign-in',
      name: 'sign in',
      factory: $SignInRouteExtension._fromState,
    );

extension $SignInRouteExtension on SignInRoute {
  static SignInRoute _fromState(GoRouterState state) => const SignInRoute();

  String get location => GoRouteData.$location(
        '/sign-in',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $signUpRoute => GoRouteData.$route(
      path: '/sign-up',
      name: 'sign up',
      factory: $SignUpRouteExtension._fromState,
    );

extension $SignUpRouteExtension on SignUpRoute {
  static SignUpRoute _fromState(GoRouterState state) => const SignUpRoute();

  String get location => GoRouteData.$location(
        '/sign-up',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userVerificationRoute => GoRouteData.$route(
      path: '/user-verification',
      name: 'user verification',
      factory: $UserVerificationRouteExtension._fromState,
    );

extension $UserVerificationRouteExtension on UserVerificationRoute {
  static UserVerificationRoute _fromState(GoRouterState state) =>
      const UserVerificationRoute();

  String get location => GoRouteData.$location(
        '/user-verification',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $userTypeSelectRoute => GoRouteData.$route(
      path: '/user-type-select',
      name: 'user type select',
      factory: $UserTypeSelectRouteExtension._fromState,
    );

extension $UserTypeSelectRouteExtension on UserTypeSelectRoute {
  static UserTypeSelectRoute _fromState(GoRouterState state) =>
      const UserTypeSelectRoute();

  String get location => GoRouteData.$location(
        '/user-type-select',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $managerDetailInputRoute => GoRouteData.$route(
      path: '/manager-detail-input',
      name: 'manager detail input',
      factory: $ManagerDetailInputRouteExtension._fromState,
    );

extension $ManagerDetailInputRouteExtension on ManagerDetailInputRoute {
  static ManagerDetailInputRoute _fromState(GoRouterState state) =>
      const ManagerDetailInputRoute();

  String get location => GoRouteData.$location(
        '/manager-detail-input',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

RouteBase get $companySelectRoute => GoRouteData.$route(
      path: '/company-select-route',
      name: 'company select route',
      factory: $CompanySelectRouteExtension._fromState,
      routes: [
        GoRouteData.$route(
          path: 'teacher-detail-input/:companyId',
          name: 'teacher detail input',
          factory: $TeacherDetailInputRouteExtension._fromState,
        ),
      ],
    );

extension $CompanySelectRouteExtension on CompanySelectRoute {
  static CompanySelectRoute _fromState(GoRouterState state) =>
      const CompanySelectRoute();

  String get location => GoRouteData.$location(
        '/company-select-route',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}

extension $TeacherDetailInputRouteExtension on TeacherDetailInputRoute {
  static TeacherDetailInputRoute _fromState(GoRouterState state) =>
      TeacherDetailInputRoute(
        state.extra as TeacherDetailInputRouteArg,
      );

  String get location => GoRouteData.$location(
        '/company-select-route/teacher-detail-input/${Uri.encodeComponent(companyId)}',
      );

  void go(BuildContext context) => context.go(location, extra: $extra);

  Future<T?> push<T>(BuildContext context) =>
      context.push<T>(location, extra: $extra);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location, extra: $extra);

  void replace(BuildContext context) =>
      context.replace(location, extra: $extra);
}

RouteBase get $mainRoute => GoRouteData.$route(
      path: '/main',
      name: 'main',
      factory: $MainRouteExtension._fromState,
    );

extension $MainRouteExtension on MainRoute {
  static MainRoute _fromState(GoRouterState state) => const MainRoute();

  String get location => GoRouteData.$location(
        '/main',
      );

  void go(BuildContext context) => context.go(location);

  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  void replace(BuildContext context) => context.replace(location);
}
