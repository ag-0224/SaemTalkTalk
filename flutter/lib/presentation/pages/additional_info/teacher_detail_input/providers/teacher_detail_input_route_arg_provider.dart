import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'teacher_detail_input_route_arg_provider.g.dart';

@riverpod
TeacherDetailInputRouteArg teacherDetailInputRouteArg(
    TeacherDetailInputRouteArgRef ref) {
  throw Exception('teacherDetailRouteArg > argument를 초기화 해주어야 합니다.');
}

final class TeacherDetailInputRouteArg {
  final String companyId;
  final String companyName;

  TeacherDetailInputRouteArg({
    required this.companyId,
    required this.companyName,
  });
}
