import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:saem_talk_talk/features/system/data_source/local/boxes/system_box.dart';

abstract class AppLocal {
  AppLocal._();

  /// Hive Box key값
  static String userBoxName = 'user';
  static String systemBoxName = 'system';

  //// Hive Box 인스턴스
  static late Box<SystemBox> systemBox;

  /// hive Local Storage 초기화
  static Future<void> initHive() async {
    final appDocumentDirectory = await getApplicationDocumentsDirectory();
    await Hive.initFlutter(appDocumentDirectory.path);

    /// 앱에서 정의된 BoxAdapter 등록
    Hive..registerAdapter(SystemBoxAdapter());

    /// Box 열기
    systemBox = await Hive.openBox<SystemBox>(systemBoxName);
  }

  ///
  /// 앱에 저장된 모든 로컬 데이터 제거
  ///
  static void clearAllLocalStorage() {
    systemBox.clear();
  }
}
