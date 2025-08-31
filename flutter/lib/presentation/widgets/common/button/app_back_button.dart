import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({
    super.key,
    this.onBackBtnTapped,
  });

  final VoidCallback? onBackBtnTapped;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(100),
      radius: 18,
      onTap: onBackBtnTapped ?? context.pop,
      child: const Icon(Icons.arrow_back_outlined),
    );
  }
}
