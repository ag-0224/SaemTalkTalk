import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/presentation/pages/permission/permission_event.dart';
import 'package:saem_talk_talk/presentation/widgets/avatar/clip_oval_circle_avatar.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';

class PermissionPage extends BasePage {
  const PermissionPage({Key? key}) : super(key: key);

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 72.0,
              ),
              Text(
                '앱 이용을 위해\n아래 접근 권한 허용이 필요해요',
                style: AppTextStyle.highlight,
              ),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                '접근 권한 요청을 받으면 허용해 주세요',
                style: AppTextStyle.body2.copyWith(color: AppColor.of.gray3),
              ),
              const SizedBox(
                height: 32.0,
              ),
              ClipOvalCircleAvatar(
                icon: Icons.camera_alt_outlined,
                title: '카메라',
                content: '이미지 업로드를 위한 카메라 촬영 시',
                titleSmall: true,
              ),
              const SizedBox(
                height: 32.0,
              ),
              ClipOvalCircleAvatar(
                icon: Icons.image_outlined,
                title: '사진 및 동영상',
                content: '이미지 업로드 시',
                titleSmall: true,
              ),
              const SizedBox(
                height: 32.0,
              ),
              ClipOvalCircleAvatar(
                icon: Icons.notifications_none_outlined,
                title: '알림',
                content: '새로운 메시지 수신 시',
                titleSmall: true,
              ),
              const SizedBox(
                height: 32.0,
              ),
              ClipOvalCircleAvatar(
                icon: Icons.sd_storage_outlined,
                title: '저장공간',
                content: '파일 업로드 시',
                titleSmall: true,
              ),
              const SizedBox(
                height: 32.0,
              ),
              const Spacer(),
              ActivationButton(
                  text: '시작하기',
                  onTap: () {
                    // routeToSignInPage(ref);
                  },
                  isActive: true),
            ],
          ),
        ),
      )
    ]);
  }
}
