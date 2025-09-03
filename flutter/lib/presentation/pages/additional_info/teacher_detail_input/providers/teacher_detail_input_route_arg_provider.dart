import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/app/router/router.dart';

part 'teacher_detail_input_route_arg_provider.g.dart';

@riverpod
TeacherDetailInputRouteArg teacherDetailInputRouteArg(
    TeacherDetailInputRouteArgRef ref) {
  return TeacherDetailInputRoute.arg;
}

final class TeacherDetailInputRouteArg {
  final String companyId;
  final String companyName;

  TeacherDetailInputRouteArg({
    required this.companyId,
    required this.companyName,
  });
}
