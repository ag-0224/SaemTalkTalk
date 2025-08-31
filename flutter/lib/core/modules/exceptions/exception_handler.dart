import 'package:saem_talk_talk/core/modules/exceptions/custom_exception.dart';
import 'package:saem_talk_talk/core/services/toast_service.dart';
import 'package:saem_talk_talk/presentation/widgets/common/toast/app_toast.dart';

class ExceptionHandler {
  static showToast(Exception e) {
    if (Exception is CustomException) {
      final exception = e as CustomException;
      ToastService.show(NormalToast(message: '${exception.message}'));
    } else {
      ToastService.show(NormalToast(message: '$e'));
    }
  }
}
