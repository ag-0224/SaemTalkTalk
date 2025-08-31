part of '../company_select_page.dart';

class _CompanySearchedTerm extends ConsumerWidget with CompanySelectState {
  const _CompanySearchedTerm();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedTerm = searchedCompanyName(ref);

    final message = searchedTerm!.isNotEmpty
        ? '\'${searchedTerm}\' 검색결과'
        : '검색어를 입력해주세요';

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            message,
            style: AppTextStyle.body3.copyWith(color: AppColor.of.black),
          ),
        ],
      ),
    );
  }
}
