import 'package:fluttertoast/fluttertoast.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/presentation/widgets/common/toast/app_toast.dart';

class ToastService {
  ToastService._();

  static final FToast _fToast = FToast()
    ..init(rootNavigatorKey.currentContext!);

  static void show(CustomToast toast) {
    _fToast
      ..removeQueuedCustomToasts()
      ..showToast(
        child: toast,
      );
  }
}
