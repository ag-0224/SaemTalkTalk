import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/core/index.dart';
import 'package:saem_talk_talk/presentation/pages/splash/splash_event.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';

class SplashPage extends BasePage with SplashEvent {
  const SplashPage({super.key});

  @override
  void onInit(WidgetRef ref) {
    Future.delayed(Duration(seconds: 1)).then(
          (_) async {
        await routeByUserAuthAndData(ref);
      },
    );
  }

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            Assets.logo,
            width: 150,
            height: 150,
          ),
        ],
      ),
    );
  }
}
