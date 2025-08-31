part of '../user_verification_page.dart';

class _UserEmailInfoCard extends ConsumerWidget {
  const _UserEmailInfoCard({required this.title, this.subTitle, super.key});

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.of.gray2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                title,
                style: AppTextStyle.body2.copyWith(color: AppColor.of.gray3),
              ),
              Gap(8),
              Text(
                subTitle ?? '',
                style: AppTextStyle.body2.copyWith(color: AppColor.of.brand1),
              ),
            ],
          ),
        ],
      ),
    );
  }
}