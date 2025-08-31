part of '../teacher_detail_input_page.dart';

class _TeacherDetailInputButton extends HookConsumerWidget{
  const _TeacherDetailInputButton(this.nameFormKey, {super.key});

  final GlobalKey<FormState> nameFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBtnActivate = useState(false);

    return ActivationButton(
        text: '완료하기',
        onTap: isBtnActivate.value
            ? () {
        }
            : null,
        isActive: isBtnActivate.value
    );
  }
}