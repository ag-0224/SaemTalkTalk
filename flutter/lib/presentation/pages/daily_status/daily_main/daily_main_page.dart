import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/presentation/widgets/avatar/clip_oval_circle_avatar.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/widgets/common/input/search_text_field.dart';

class DailyMainPage extends BasePage {
  const DailyMainPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();

    return _ManagerScaffold(
      searchDateBar: _DatePickerField(),
      searchBar: _SearchBar(
        formKey: formKey,
      ),
      chips: Container(),
      searchedTeacherListView: _SearchTeacherList(),
    );
  }

  @override
  bool get canPop => false;

  @override
  Color? get screenBackgroundColor => AppColor.of.background1;

  @override
  Color? get unSafeAreaColor => AppColor.of.background1;

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) =>
      CustomAppBar(title: '일별 현황');
}

class _ManagerScaffold extends StatelessWidget {
  const _ManagerScaffold({
    super.key,
    required this.searchDateBar,
    required this.searchBar,
    required this.chips,
    required this.searchedTeacherListView,
  });

  final Widget searchDateBar;
  final Widget searchBar;
  final Widget chips;
  final Widget searchedTeacherListView;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Gap(16),
          searchDateBar,
          const Gap(8),
          searchBar,
          Divider(),
          chips,
          Expanded(child: searchedTeacherListView),
        ],
      ),
    );
  }
}

class _DatePickerField extends HookWidget {
  const _DatePickerField({super.key});

  // 요일을 한국어로 반환하는 함수
  String _weekdayToKorean(int weekday) {
    const weekdays = ['월', '화', '수', '목', '금', '토', '일'];
    // DateTime에서 월요일=1, 일요일=7 이므로 인덱스 맞춤
    return weekdays[weekday - 1];
  }

  // yyyy년 MM월 dd일 EEEE 형식으로 포맷팅
  String _formatDate(DateTime date) {
    final year = date.year;
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    final weekday = _weekdayToKorean(date.weekday);
    return '$year년 $month월 $day일 $weekday요일';
  }

  @override
  Widget build(BuildContext context) {
    final selectedDate = useState(DateTime.now());
    final controller =
        useTextEditingController(text: _formatDate(selectedDate.value));

    Future<void> pickDate() async {
      final now = DateTime.now();
      final picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value,
        firstDate: DateTime(now.year - 5),
        lastDate: DateTime(now.year + 5),
        locale: const Locale('ko', 'KR'), // 날짜 선택기 UI는 한국어로 유지
      );

      if (picked != null) {
        selectedDate.value = picked;
        controller.text = _formatDate(picked);
      }
    }

    return TextField(
      controller: controller,
      readOnly: true,
      onTap: pickDate,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.calendar_month_outlined, color: AppColor.of.gray2, size: 24,),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        isDense: true,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 11, horizontal: 16),
      ),
      style: AppTextStyle.body2.copyWith(color: AppColor.of.black),
    );
  }
}

class _SearchBar extends HookConsumerWidget {
  const _SearchBar({
    super.key,
    required this.formKey,
  });

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController controller = useTextEditingController();

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              child: SearchTextField(
                controller: controller,
                textInputAction: TextInputAction.done,
                hintText: '이름 또는 업무를 입력해주세요',
                onClear: () {
                  controller.clear();
                },
                onChanged: (value) => {},
              ),
            ),
          ),
          const Gap(16),
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              decoration: BoxDecoration(
                color: AppColor.of.brand1,
                borderRadius: BorderRadius.circular(8),
              ),
              child: IconButton(
                onPressed: () => {},
                icon: const Icon(Icons.search, size: 24),
                color: AppColor.of.white,
                padding: EdgeInsets.zero,
                style: IconButton.styleFrom(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  padding: EdgeInsets.zero,
                  minimumSize: Size.zero,
                  splashFactory: NoSplash.splashFactory,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Teacher {
  final String name;
  final String department;
  final String position;
  final String status;
  final String timeIn;
  final String timeOut;
  final List<Map<String, String>> tasks;

  const Teacher({
    required this.name,
    required this.department,
    required this.position,
    required this.status,
    required this.timeIn,
    required this.timeOut,
    required this.tasks,
  });
}

class _SearchTeacherList extends ConsumerWidget {
  const _SearchTeacherList({super.key});

  final List<Teacher> items = const [
    Teacher(
      name: '김고은',
      department: '신나는 1반',
      position: '교사',
      status: '미완료',
      timeIn: '07:30',
      timeOut: '16:30',
      tasks: [
        {'우유정리': '월'},
        {'빨래정리': '월'},
        {'실내화 정리': '월'}
      ],
    ),
    Teacher(
      name: '장현정',
      department: '신나는 1반',
      position: '교사',
      status: '완료',
      timeIn: '07:30',
      timeOut: '16:30',
      tasks: [
        {'현관문 닫기': '매일'}
      ],
    ),
    Teacher(
      name: '남상진',
      department: '신나는 1반',
      position: '교사',
      status: '인증 미완료',
      timeIn: '07:30',
      timeOut: '17:00',
      tasks: [
        {'여자 화장실': '-'}
      ],
    ),
    Teacher(
      name: '정은지',
      department: '신나는 1반',
      position: '교사',
      status: '미정',
      timeIn: '08:30',
      timeOut: '17:30',
      tasks: [
        {'실내화 세탁 및 건조': '금'},
        {'현관 청소': '-'},
      ],
    ),
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.separated(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final teacher = items[index];

        return GestureDetector(
          onTap: () => {},
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColor.of.gray2,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8),
              color: AppColor.of.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 6,
                  offset: const Offset(1, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipOvalCircleAvatar(
                      icon: Icons.person_outline,
                      title: '${teacher.name}',
                      tag: '${teacher.position}',
                      content: '${teacher.department}',
                    ),
                    _Tag(tagName: teacher.status),
                  ],
                ),
                const Gap(8),
                Row(
                  children: [
                    Icon(
                      Icons.login,
                      size: 24,
                      color: AppColor.of.brand1,
                    ),
                    const Gap(8),
                    Text(
                      '(출근) ${teacher.timeIn}',
                      style: AppTextStyle.body3.copyWith(
                        color: AppColor.of.gray3,
                      ),
                    ),
                    const Gap(16),
                    Icon(
                      Icons.logout,
                      size: 24,
                      color: AppColor.of.brand1,
                    ),
                    const Gap(8),
                    Text(
                      '(퇴근) ${teacher.timeOut}',
                      style: AppTextStyle.body3.copyWith(
                        color: AppColor.of.gray3,
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                ...teacher.tasks
                    .map(
                      (e) => Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${e.keys.first.toString()}',
                            style: AppTextStyle.body2.copyWith(
                              color: AppColor.of.black,
                            ),
                          ),
                          Text(
                            '${e.values.first.toString()}',
                            style: AppTextStyle.body2.copyWith(
                              color: AppColor.of.black,
                            ),
                          ),
                        ],
                      ),
                    )
                    .expand((widget) =>
                        [widget, const Gap(8)]) // 각 위젯 사이에 Gap(8) 삽입
                    .toList()
                  ..removeLast(),
              ],
            ),
          ),
        );
      },
      separatorBuilder: (context, index) => const Gap(16),
    );
  }
}

class _Tag extends StatelessWidget {
  final String tagName;

  const _Tag({
    required this.tagName,
  });

  Color _backgroundColor(String tagName) {
    switch (tagName) {
      case '완료':
        return AppColor.of.blue1;
      case '미완료':
        return AppColor.of.red1;
      case '인증 미완료':
        return AppColor.of.green1;
      default:
        return AppColor.of.gray4;
    }
  }

  Color _borderRadiusColor(String tagName) {
    switch (tagName) {
      case '완료':
        return AppColor.of.blue2;
      case '미완료':
        return AppColor.of.red2;
      case '인증 미완료':
        return AppColor.of.green2;
      default:
        return AppColor.of.gray5;
    }
  }

  Color _textColor(String tagName) {
    switch (tagName) {
      case '완료':
        return AppColor.of.blue3;
      case '미완료':
        return AppColor.of.red3;
      case '인증 미완료':
        return AppColor.of.green3;
      default:
        return AppColor.of.gray6;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        border: Border.all(
          color: _borderRadiusColor(tagName),
          width: 1.0,
        ),
        borderRadius: BorderRadius.circular(4),
        color: _backgroundColor(tagName),
      ),
      child: Text(
        tagName,
        style: AppTextStyle.body3.copyWith(color: _textColor(tagName)),
      ),
    );
  }
}
