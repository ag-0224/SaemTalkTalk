import 'package:flutter/material.dart';
import 'package:saem_talk_talk/app/style/index.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) { 
    return Center(
      child: SizedBox(
        width: 40,
        height: 40,
        child: CircularProgressIndicator(
          strokeCap: StrokeCap.round,
          color: AppColor.of.brand1,
          backgroundColor: AppColor.of.brand2,
        ),
      ),
    );
  }
}
