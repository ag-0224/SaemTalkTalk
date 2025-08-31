part of '../user_type_select_page.dart';

class _UserTypeSelectCards extends ConsumerWidget
    with UserTypeSelectState, UserTypeSelectEvent {
  const _UserTypeSelectCards({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isSelectedManager = selectedManager(ref);

    return Column(
      children: [
        _MemberTypeCard(
          icon: Icons.person_outline,
          title: '교사',
          description: '학급을 담당하고 학생들을\n지도하는 선생님',
          isSelected: !isSelectedManager,
          onTap: () =>
              isSelectedManager ? onUserTypeSelectCardTapped(ref) : null,
        ),
        Gap(16),
        _MemberTypeCard(
          icon: Icons.supervisor_account_outlined,
          title: '원장',
          description: '유치원 또는 어린이집을\n운영하는 책임자',
          isSelected: isSelectedManager,
          onTap: () =>
              isSelectedManager ? null : onUserTypeSelectCardTapped(ref),
        ),
      ],
    );
  }
}

class _MemberTypeCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final bool isSelected;
  final VoidCallback onTap;

  const _MemberTypeCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderColor = isSelected ? AppColor.of.brand1 : AppColor.of.gray2;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      splashColor: AppColor.of.brand1.withOpacity(0.05),     // 터치 시 퍼지는 물결 색상
      highlightColor: AppColor.of.brand1.withOpacity(0.05),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: borderColor, width: isSelected ? 2 : 1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipOval(
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.of.brand2),
                    width: 48,
                    height: 48,
                    child: Icon(
                      icon,
                      color: AppColor.of.brand1,
                    ),
                  ),
                ),
                SvgPicture.asset(
                  isSelected
                      ? Assets.selected_check_circle_rounded
                      : Assets.check_circle_rounded,
                  width: 20,
                  height: 20,
                ),
              ],
            ),
            Gap(16),
            Text(
              title,
              style: AppTextStyle.headline1.copyWith(color: AppColor.of.black),
            ),
            Gap(8),
            Text(
              description,
              style: AppTextStyle.body2.copyWith(color: AppColor.of.gray3),
            ),
          ],
        ),
      ),
    );
  }
}
