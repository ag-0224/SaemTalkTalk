part of '../teacher_detail_input_page.dart';

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    super.key,
    required this.userNameTextField,
    required this.positionDropdownButtonFormField,
    required this.departmentDropdownButtonFormField,
    required this.bottomFixedBtn,
  });

  final Widget userNameTextField;
  final Widget positionDropdownButtonFormField;
  final Widget departmentDropdownButtonFormField;
  final Widget bottomFixedBtn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: userNameTextField,
        ),
        const Gap(4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: departmentDropdownButtonFormField,
        ),
        const Gap(4),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: positionDropdownButtonFormField,
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: bottomFixedBtn,
        ),
      ],
    );
  }
}
