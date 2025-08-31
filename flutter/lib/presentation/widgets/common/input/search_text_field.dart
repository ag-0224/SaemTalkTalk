import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class SearchTextField extends HookWidget {
  const SearchTextField({
    super.key,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.style,
    InputDecoration? inputDecoration,
    this.onClear,
    this.onChanged,
    this.onEditingComplete,
    this.enabled = true,
    this.activeSuffixIcon = true,
    this.autoFocus = false,
    this.validator,
    this.inputFormatters,
    this.textInputAction,
    this.keyboardType,
    this.useCustomValidation = false,
    this.hintText,
    this.hintTextStyle,
  }) : inputDecoration = inputDecoration ?? const InputDecoration();

  final FocusNode? focusNode;
  final TextEditingController? controller;
  final String? initialValue;
  final TextStyle? style;
  final InputDecoration inputDecoration;
  final ValueChanged<String>? onChanged;
  final void Function()? onEditingComplete;
  final bool useCustomValidation;
  final bool enabled;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final String? hintText;
  final TextStyle? hintTextStyle;

  /// 우측 아이콘을 활성화할지 여부
  final bool activeSuffixIcon;

  /// 클리어 아이콘을 눌렀을 때 실행할 콜백
  final VoidCallback? onClear;

  bool isFieldEmpty(TextEditingController controller) {
    return useListenableSelector(
      controller,
      () => controller.text.isEmpty,
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller =
        this.controller ?? useTextEditingController(text: initialValue);

    final inputDecoration = this.inputDecoration.copyWith(
          isDense: true,
          hintText: hintText,
          hintStyle: hintTextStyle,
          suffixIcon: Padding(
            padding: const EdgeInsets.only(right: 8),
            child: activeSuffixIcon && !isFieldEmpty(controller)
                ? _buildClearIcon(controller)
                : null,
          ),
          suffixIconConstraints: const BoxConstraints(
            minHeight: 24,
            minWidth: 24,
          ),
          errorStyle: AppTextStyle.alert2.copyWith(
            color: AppColor.of.red3,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 9,
            horizontal: 16,
          ),
        );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          autofocus: autoFocus,
          validator: useCustomValidation ? null : validator,
          enabled: enabled,
          style: style ?? AppTextStyle.body2,
          cursorColor: AppColor.of.brand1,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          decoration: inputDecoration,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }

  Widget _buildClearIcon(TextEditingController controller) {
    return IconButton(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      visualDensity: VisualDensity.compact,
      padding: EdgeInsets.zero,
      onPressed: onClear != null
          ? () {
              if (this.controller == null) {
                controller.clear();
              }
              onClear!();
            }
          : () => controller.clear(),
      icon: Icon(
        Icons.cancel_outlined,
        size: 24,
        color: AppColor.of.gray2,
      ),
    );
  }
}
