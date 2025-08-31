import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'text_field_controller_provider.g.dart';

@riverpod
class TextFieldController extends _$TextFieldController {
  @override
  Raw<TextEditingController> build() {
    return TextEditingController();
  }
}