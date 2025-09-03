part of '../teacher_detail_input_page.dart';

class _TeacherPositionInputField extends ConsumerWidget
    with TeacherDetailInputEvent, TeacherDetailInputState {
  const _TeacherPositionInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return positionList(ref).when(
      data: (positions) {
        return CustomDropdownButtonField(
          hint: '직급',
          value: teacherPosition(ref),
          dropdownItems: positions,
          onChanged: (input) {
            onTeacherPositionInputChanged(ref, input: input);
          },
        );
      },
      error: (_, __) => const EmptyBox(),
      loading: () => const EmptyBox(),
    );
  }
}
