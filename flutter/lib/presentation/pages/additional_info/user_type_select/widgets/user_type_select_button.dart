part of '../user_type_select_page.dart';

class _UserTypeSelectButton extends HookConsumerWidget with UserTypeSelectState, UserTypeSelectEvent {
  const _UserTypeSelectButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ActivationButton(
        text: '계속하기',
        onTap: () => onUserTypeSelectBtnTapped(ref),
        isActive: true
    );
  }
}