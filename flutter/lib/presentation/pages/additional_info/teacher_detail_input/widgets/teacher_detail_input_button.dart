part of '../teacher_detail_input_page.dart';

class _TeacherDetailInputButton extends HookConsumerWidget
    with TeacherDetailInputState, TeacherDetailInputEvent {
  const _TeacherDetailInputButton(this.nameFormKey, {super.key});

  final GlobalKey<FormState> nameFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBtnActivate = useState(false);

    // 공통 유효성 검사 함수
    void validateAllForms() {
      if (nameFormKey.currentState != null) {
        isBtnActivate.value =
            nameFormKey.currentState!.validate() && hasNameEntered(ref);
      }
    }

    ref.listen(teacherNameInputProvider, (_, next) => validateAllForms());

    return ActivationButton(
        text: '완료하기',
        onTap: isBtnActivate.value ? () {
          onCompletedBtnTapped(ref);
        } : null,
        isActive: isBtnActivate.value);
  }
}
