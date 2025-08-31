part of '../user_verification_page.dart';

class _UserVerificationInfoCard extends ConsumerWidget {
  const _UserVerificationInfoCard({required this.title, required this.content, super.key});

  final String title;
  final String content;

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
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipOval(
                child: Container(
                  decoration: BoxDecoration(color: AppColor.of.brand2),
                  width: 48,
                  height: 48,
                  child: Icon(
                    Icons.info_outline_rounded,
                    color: AppColor.of.brand1,
                  ),
                ),
              ),
              Gap(16),
              Text(
                title,
                style: AppTextStyle.headline1.copyWith(color: AppColor.of.black),
              ),
              Gap(8),
              Text(
                content,
                style: AppTextStyle.body2.copyWith(color: AppColor.of.gray3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}