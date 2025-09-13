part of '../user_request_page.dart';

class _UserRequestCompanyButton extends HookConsumerWidget {
  const _UserRequestCompanyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ActivationButton(
        text: '취소하기',
        onTap: () => {},
        isActive: true
    );
  }
}