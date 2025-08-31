part of '../company_select_page.dart';

class _Scaffold extends StatelessWidget {
  final Widget searchedTermView;
  final Widget contentListView;

  const _Scaffold({
    required this.searchedTermView,
    required this.contentListView,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        searchedTermView,
        const Gap(32),
        Expanded(child: contentListView),
      ],
    );
  }
}
