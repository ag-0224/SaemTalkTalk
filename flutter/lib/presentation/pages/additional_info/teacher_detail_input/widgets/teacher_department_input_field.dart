part of '../teacher_detail_input_page.dart';

class _TeacherDepartmentInputField extends ConsumerWidget
    with TeacherDetailInputEvent, TeacherDetailInputState {
  const _TeacherDepartmentInputField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return departmentList(ref).when(
      data: (departments) {
        return CustomDropdownButtonField(
          hint: '부서',
          value: teacherDepartment(ref),
          dropdownItems: departments,
          onChanged: (input) {
            onTeacherDepartmentInputChanged(ref, input: input);
          },
        );
      },
      error: (_, __) => const EmptyBox(),
      loading: () => const EmptyBox(),
    );
  }
}
