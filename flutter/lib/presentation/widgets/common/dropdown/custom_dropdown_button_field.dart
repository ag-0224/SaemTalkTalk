import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class CustomDropdownButtonField extends StatelessWidget {
  const CustomDropdownButtonField({
    required this.hint,
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    super.key,
  });

  final String hint;
  final String? value;
  final List<String> dropdownItems;
  final ValueChanged<String?>? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        isExpanded: true,
        hint: Text(
          hint,
          style: AppTextStyle.body2.copyWith(color: AppColor.of.gray2),
        ),
        value: value,
        items: dropdownItems
            .map((String item) => DropdownMenuItem<String>(
          value: item,
          child: Text(
            item,
            style: AppTextStyle.body2.copyWith(color: AppColor.of.black),
          ),
        ))
            .toList(),
        onChanged: onChanged,
        buttonStyleData: ButtonStyleData(
          width: double.infinity,
          height: 54,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColor.of.gray2,
                width: 1,
              ),
            ),
          ),
        ),
        iconStyleData: IconStyleData(
          icon: const Icon(Icons.keyboard_arrow_down_outlined),
          iconSize: 20,
          iconEnabledColor: AppColor.of.gray2,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: AppColor.of.background1,
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 48,
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
      ),
    );
  }
}

