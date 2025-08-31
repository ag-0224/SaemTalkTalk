import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
/// Company list를 관리하는 provider
///
class CompanyListProvider extends ChangeNotifier {
  ///
  /// 페이지 컨트롤러
  ///
  PageController pageController = PageController();
}

final companyListProvider =
    ChangeNotifierProvider<CompanyListProvider>((ref) => CompanyListProvider());
