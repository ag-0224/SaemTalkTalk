part of '../company_select_page.dart';

class _CompanyListView extends HookConsumerWidget
    with CompanySelectState, CompanySelectEvent {
  const _CompanyListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: PageView.builder(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController(ref),
          itemBuilder: (context, index) {
            final targetController = pagingController(ref);
            return KeepAliveView(
              child:
                  PagedListView<DocumentSnapshot<CompanyModel>?, CompanyEntity>(
                pagingController: targetController,
                physics: const BouncingScrollPhysics(),
                builderDelegate: PagedChildBuilderDelegate<CompanyEntity>(
                  itemBuilder: (context, item, index) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              onCompanyContentTapped(
                                  context, item.id, item.companyName);
                            },
                            child: CompanyContentItemView(
                              companyName: item.companyName,
                              ceoName: item.ceoName,
                              phoneNumber: item.phoneNumber,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  firstPageProgressIndicatorBuilder: (_) =>
                      const Center(child: LoadingIndicator()),
                  newPageProgressIndicatorBuilder: (_) =>
                      const Center(child: LoadingIndicator()),
                  firstPageErrorIndicatorBuilder: (_) =>
                      _buildErrorOccuredView(targetController),
                  newPageErrorIndicatorBuilder: (_) =>
                      _buildErrorOccuredView(targetController),
                  noItemsFoundIndicatorBuilder: (_) =>
                      _buildNoItemFoundView(targetController),
                ),
              ),
            );
          }),
    );
  }

  ///
  /// 호출 중 오류 발생
  ///
  Widget _buildErrorOccuredView(
      PagingController<DocumentSnapshot<CompanyModel>?, CompanyEntity>
          controller) {
    return CompanyPaginationIndicatorView(
      title: '오류가 발생하였습니다.',
      description: '호출 중에 오류가 발생하였습니다.',
      btnText: '다시 시도해주세요.',
      onBtnTapped: () {
        controller.refresh();
      },
    );
  }

  ///
  /// 검색된 항목 없음
  ///
  Widget _buildNoItemFoundView(
      PagingController<DocumentSnapshot<CompanyModel>?, CompanyEntity>
          controller) {
    return CompanyPaginationIndicatorView(
      title: '검색 항목 없음',
      description: '검색된 항목이 없습니다.',
      btnText: '재시도',
      onBtnTapped: () {
        controller.refresh();
      },
    );
  }
}
