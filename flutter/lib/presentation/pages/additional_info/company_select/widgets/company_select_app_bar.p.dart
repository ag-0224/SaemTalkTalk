part of '../company_select_page.dart';

class _AppBar extends HookConsumerWidget
    with CompanySelectState, CompanySelectEvent
    implements PreferredSizeWidget {
  const _AppBar(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  static const double appbarHeight = 56;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useTextEditingController(text: searchedCompanyName(ref));

    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        title: Container(
          padding: const EdgeInsets.only(right: 16),
          child: Form(
            key: formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: CustomTextField(
              controller: controller,
              textInputAction: TextInputAction.done,
              showPrefixIcon: true,
              hintText: '회사 이름 검색',
              inputDecoration: InputDecoration(
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: AppColor.of.gray2,
                  ),
                ),
              ),
              onClear: () {
                controller.clear();
                onSearchedCompanyNameFieldClear(ref);
              },
              onChanged: (input) {
                onSearchedCompanyNameChanged(ref, input: input);
              },
            ),
          ),
        ),
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.of.white,
        automaticallyImplyLeading: false,
        toolbarHeight: appbarHeight,
        leading: AppBackButton(
          onBackBtnTapped: context.pop,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
