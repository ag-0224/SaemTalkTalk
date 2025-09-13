part of '../user_request_page.dart';

class _UserRequestCompanyInfoCard extends ConsumerWidget with UserRequestState {
  const _UserRequestCompanyInfoCard({required this.title, super.key});

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return company(ref).when(
      data: (companyInfo) {
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
                    style:
                        AppTextStyle.body2.copyWith(color: AppColor.of.gray3),
                  ),
                  Gap(8),
                  Text(
                    '${companyInfo.companyName}(${companyInfo.phoneNumber.formatAsPhoneNumber})',
                    style:
                        AppTextStyle.body2.copyWith(color: AppColor.of.brand1),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      error: (_, __) => const EmptyBox(),
      loading: () => const EmptyBox(),
    );
  }
}
