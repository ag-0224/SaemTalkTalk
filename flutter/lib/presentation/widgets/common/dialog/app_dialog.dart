import 'package:flutter/material.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class AppDialog extends Dialog {
  const AppDialog({
    Key? key,
    this.description,
    this.onLeftBtnClicked,
    this.leftBtnText,
    required this.btnText,
    required this.onBtnClicked,
    required this.title,
  }) : super(key: key);

  factory AppDialog.create({
    required String title,
    String? description,
    String? subTitle,
    required String leftBtnContent,
    required String rightBtnContent,
    required VoidCallback onRightBtnClicked,
    required VoidCallback onLeftBtnClicked,
  }) =>
      AppDialog(
        title: title,
        onBtnClicked: onRightBtnClicked,
        onLeftBtnClicked: onLeftBtnClicked,
        description: description,
        leftBtnText: leftBtnContent,
        btnText: rightBtnContent,
      );

  final String title;
  final String? description;
  final VoidCallback onBtnClicked;
  final VoidCallback? onLeftBtnClicked;
  final String? btnText;
  final String? leftBtnText;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 32.0),
      elevation: 0,

      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints(minHeight: 190),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16.0),
          color: AppColor.of.white,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            /// Title
            Text(
              title,
              textAlign: TextAlign.center,
              style: AppTextStyle.headline1,
            ),

            // Description
            if (description != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 8) +
                    const EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  description!,
                  style: AppTextStyle.body2.copyWith(
                    color: AppColor.of.black,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            // DividedButton
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: FilledButton(
                    onPressed: onLeftBtnClicked,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColor.of.gray1,
                      foregroundColor: AppColor.of.gray3,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      textStyle: AppTextStyle.body1,
                    ),
                    child: Text(
                      leftBtnText!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16.0,
                ),
                Expanded(
                  flex: 1,
                  child: FilledButton(
                    onPressed: onBtnClicked,
                    style: FilledButton.styleFrom(
                      backgroundColor: AppColor.of.brand1,
                      foregroundColor: AppColor.of.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 13.0),
                      textStyle: AppTextStyle.body1,
                    ),
                    child: Text(
                      btnText!,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}