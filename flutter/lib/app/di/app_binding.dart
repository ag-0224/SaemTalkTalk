import 'package:get_it/get_it.dart';
import 'package:saem_talk_talk/app/di/modules/auth_di.dart';
import 'package:saem_talk_talk/app/di/modules/company_di.dart';
import 'package:saem_talk_talk/app/di/modules/user_di.dart';

final GetIt locator = GetIt.I;

// 안전하게 등록된 인스턴스를 해제하는 메소드
void safeUnregister<T extends Object>() {
  if (locator.isRegistered<T>()) {
    locator.unregister<T>();
  }
}

// 안전하게 Factory 인스턴스를 등록하는 메소드
void safeRegisterFactory<T extends Object>(FactoryFunc<T> factoryFunc) {
  if (!locator.isRegistered<T>()) {
    locator.registerFactory<T>(factoryFunc);
  }
}

final class AppBinder {
  AppBinder._();

  /// 'Splash' 단계에서 우선적으로 Binding 해야되는 모듈들은
  /// 아래 메소드에서 처리합
  static Future<void> _initTopPriority() async {}

  static void init() {
    _initTopPriority();

    for (final di in [
      AuthDependencyInjection(),
      UserDependencyInjection(),
      CompanyDependencyInjection(),
    ]) {
      di.init();
    }
  }
}
