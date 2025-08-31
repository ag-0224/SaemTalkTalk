import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class CustomTextField extends HookWidget {
  const CustomTextField({
    super.key,
    this.focusNode,
    this.controller,
    this.initialValue,
    this.style,
    InputDecoration? inputDecoration,
    this.onClear,
    this.onChanged,
    this.onEditingComplete,
    this.obscureText = false,
    this.activeObscureIcon = false,
    this.enabled = true,
    this.activeSuffixIcon = true,
    this.autoFocus = false,
    this.showPrefixIcon = false,
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
  final bool obscureText;
  final bool enabled;
  final bool autoFocus;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final String? hintText;
  final TextStyle? hintTextStyle;
  final bool showPrefixIcon;

  /// 우측 아이콘을 활성화할지 여부
  final bool activeSuffixIcon;

  /// 비밀번호 보이기를 토글할 지 여부
  final bool activeObscureIcon;

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

    final obscureTextState = useState(obscureText);

    final inputDecoration = this.inputDecoration.copyWith(
          hintText: hintText,
          hintStyle: hintTextStyle,
          isDense: true,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              if (activeObscureIcon)
                _buildObsecureTextToggleIcon(obscureTextState),
              if (activeObscureIcon && activeSuffixIcon && !isFieldEmpty(controller))
                Gap(8),
              if (activeSuffixIcon && !isFieldEmpty(controller))
                _buildClearIcon(controller),
            ],
          ),
          suffixIconConstraints: BoxConstraints(
            minWidth: 8,
            minHeight: 8,
          ),
          errorStyle: AppTextStyle.alert2.copyWith(
            color: AppColor.of.red3,
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
          ),
          prefixIconConstraints: BoxConstraints(minWidth: 8, minHeight: 8),
          prefixIcon: showPrefixIcon ? _buildSearchIcon() : null,
        );

    final validateMessage = useListenableSelector(controller, () {
      if (validator == null) return null;
      final message = validator!(controller.text);
      return message;
    });

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.centerLeft,
      children: [
        TextFormField(
          focusNode: focusNode,
          controller: controller,
          autofocus: autoFocus,
          validator: useCustomValidation ? null : validator,
          enabled: enabled,
          obscureText: obscureTextState.value,
          style: style ?? AppTextStyle.body2,
          cursorColor: AppColor.of.black,
          inputFormatters: inputFormatters,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          decoration: inputDecoration,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
        ),
        if (useCustomValidation)
          AnimatedPositioned(
            duration: const Duration(milliseconds: 180),
            bottom: validateMessage != null ? -26 : -16,
            left: 8,
            child: AnimatedOpacity(
              opacity: validateMessage != null ? 1 : 0,
              duration: const Duration(milliseconds: 180),
              child: Text(
                validateMessage ?? '',
                style: AppTextStyle.alert2.copyWith(
                  color: AppColor.of.red3,
                ),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildClearIcon(TextEditingController controller) {
    return InkWell(
      onTap: onClear != null
          ? () {
              if (this.controller == null) {
                controller.clear();
              }
              onClear!();
            }
          : () => controller.clear(),
      child: Icon(
        Icons.cancel_rounded,
        size: 20,
        color: AppColor.of.gray2,
      ),
    );
  }

  Widget _buildSearchIcon() {
    return Icon(Icons.search_outlined, size: 20, color: AppColor.of.gray2);
  }

  Widget _buildObsecureTextToggleIcon(ValueNotifier<bool> obscureTextState) {
    return InkWell(
      onTap: () => obscureTextState.value = !obscureTextState.value,
      child: Icon(
        obscureTextState.value
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        size: 20,
        color: AppColor.of.gray2,
      ),
    );
  }
}
