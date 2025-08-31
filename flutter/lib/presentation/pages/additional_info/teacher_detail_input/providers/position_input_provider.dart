import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'position_input_provider.g.dart';

@riverpod
class PositionInput extends _$PositionInput {

  @override
  String? build() {
    final position = null;
    return position;
  }

  void clear() {
    state = null;
  }

  void onChanged(String? position) {
    state = position;
  }
}