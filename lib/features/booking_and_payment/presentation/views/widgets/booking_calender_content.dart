import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/app_colors.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class BookingCalendarContent extends StatefulWidget {
  final Function(
    String selectedDateRange,
    DateTime? startDate,
    DateTime? endDate,
  )
  onSave;

  const BookingCalendarContent({super.key, required this.onSave});

  @override
  State<BookingCalendarContent> createState() => _BookingCalendarContentState();
}

class _BookingCalendarContentState extends State<BookingCalendarContent> {
  DateTime _focusedDay = DateTime(2022, 8, 1);
  DateTime? _startDate;
  DateTime? _endDate;
  String? _errorMessage;
  final CalendarFormat _calendarFormat = CalendarFormat.month;

  // الأيام المحجوزة مسبقاً والثابتة في التصميم (7 و 10 أغسطس)
  final List<DateTime> _bookedDays = [
    DateTime(2022, 8, 7),
    DateTime(2022, 8, 8),
    DateTime(2022, 8, 9),
    DateTime(2022, 8, 10),
  ];

  bool _isBooked(DateTime day) {
    return _bookedDays.any((bookedDay) => isSameDay(bookedDay, day));
  }

  bool _isInRange(DateTime day) {
    if (_startDate != null && _endDate != null) {
      // إزالة الساعات للمقارنة الدقيقة بالأيام
      final d = DateTime(day.year, day.month, day.day);
      final start = DateTime(
        _startDate!.year,
        _startDate!.month,
        _startDate!.day,
      );
      final end = DateTime(_endDate!.year, _endDate!.month, _endDate!.day);
      return (d.isAfter(start) && d.isBefore(end));
    }
    return false;
  }

  bool _hasBookedDayInRange(DateTime start, DateTime end) {
    for (var bookedDay in _bookedDays) {
      final b = DateTime(bookedDay.year, bookedDay.month, bookedDay.day);
      final s = DateTime(start.year, start.month, start.day);
      final e = DateTime(end.year, end.month, end.day);
      if ((b.isAfter(s) && b.isBefore(e)) ||
          isSameDay(b, s) ||
          isSameDay(b, e)) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // مقبض السحب العلوي
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          SizedBox(height: 12.h),

          // 1. عنوان "Select Date" في الترويسة
          Center(
            child: Text(
              'Select Date',
              style: Styles.textStyle16W600Inter.copyWith(fontSize: 20.sp),
            ),
          ),
          SizedBox(height: 30.h),

          // 2. ترويسة الروزنامة (أيقونة + Calendar + Set time on your calendar)
          Row(
            children: [
              Container(
                width: 36.w,
                height: 36.h,
                decoration: BoxDecoration(
                  color: AppColors.secondary.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AssetsData.iconCalendarSvg,
                    width: 20.w,
                    colorFilter: const ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calendar',
                    style: Styles.textStyle14W600Inter.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    'Set time on your calendar',
                    style: Styles.textStyle12W400Inter.copyWith(
                      color: AppColors.textSecondary,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 7.h),

          // خط فاصل تحت قسم الـ Calendar
          const Divider(color: Color(0xFFE5E7EB), thickness: 1),
          SizedBox(height: 14.h),

          // 3. اسم الشهر والأسهم في الأعلى (بدائرة ذات لون غامق)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${_getMonthName(_focusedDay.month)} ${_focusedDay.year}',
                style: Styles.textStyle18W600Inter.copyWith(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  // سهم السابق
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month - 1,
                          1,
                        );
                      });
                    },
                    child: Container(
                      width: 18.5.w,
                      height: 18.5.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black87, width: 2),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.chevron_left,
                          size: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  // سهم التالي
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _focusedDay = DateTime(
                          _focusedDay.year,
                          _focusedDay.month + 1,
                          1,
                        );
                      });
                    },
                    child: Container(
                      width: 18.5.w,
                      height: 18.5.h,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.black87, width: 2),
                      ),
                      child: const Center(
                        child: Icon(
                          Icons.chevron_right,
                          size: 16,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                    .map(
                      (day) => SizedBox(
                        width: 32.w,
                        child: Center(
                          child: Text(
                            day,
                            style: TextStyle(
                              color: AppColors.textPrimary,
                              fontWeight: FontWeight.w500,
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
              SizedBox(height: 5.h),
              const Divider(color: Color(0xFFE5E7EB), thickness: 1),
            ],
          ),
          SizedBox(height: 4.h),

          // 4. جدول الروزنامة 
          SizedBox(
            height: 275.h,
            child: TableCalendar(
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              calendarFormat: _calendarFormat,
              headerVisible: false,
              daysOfWeekVisible: false,
              startingDayOfWeek: StartingDayOfWeek.sunday,
              rowHeight: 38.h, //  تثبيت ارتفاع الصف لمنع تمدد الشهر

              calendarStyle: CalendarStyle(
                outsideDaysVisible: true,
                defaultDecoration: const BoxDecoration(shape: BoxShape.circle),
                weekendDecoration: const BoxDecoration(shape: BoxShape.circle),
                defaultTextStyle: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
                weekendTextStyle: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                ),
                outsideTextStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 16.sp,
                ),
              ),

              calendarBuilders: CalendarBuilders(
                defaultBuilder: (context, day, focusedDay) {
                  bool isBooked = _isBooked(day);
                  bool isStart =
                      _startDate != null && isSameDay(_startDate!, day);
                  bool isEnd = _endDate != null && isSameDay(_endDate!, day);
                  if (isBooked) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    );
                  }

                  if (isStart || isEnd) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    );
                  }
                  if (_isInRange(day)) {
                    return Container(
                      margin: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          '${day.day}',
                          style: TextStyle(
                            color: AppColors.textPrimary,
                            fontWeight: FontWeight.bold,
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    );
                  }

                  return null;
                },
              ),

              onDaySelected: (selectedDay, focusedDay) {
                if (_isBooked(selectedDay)) {
                  return;
                }

                setState(() {
                  _errorMessage = null;
                  if (_startDate == null ||
                      (_startDate != null && _endDate != null)) {
                    _startDate = selectedDay;
                    _endDate = null;
                  } else if (selectedDay.isBefore(_startDate!)) {
                    if (_hasBookedDayInRange(selectedDay, _startDate!)) {
                      _errorMessage = 'Cannot select range over booked dates';
                    } else {
                      _startDate = selectedDay;
                      _endDate = null;
                    }
                  } else {
                    if (_hasBookedDayInRange(_startDate!, selectedDay)) {
                      _errorMessage = 'Cannot select range over booked dates';
                    } else {
                      _endDate = selectedDay;
                    }
                  }
                  _focusedDay = focusedDay;
                });
              },
              onPageChanged: (focusedDay) {
                setState(() {
                  _focusedDay = focusedDay;
                });
              },
            ),
          ),

          // مساحة ثابتة لرسالة الخطأ لضمان عدم تغير موقع الزر
          SizedBox(
            height: 24.h,
            child: Center(
              child: _errorMessage != null
                  ? Text(
                      _errorMessage!,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          SizedBox(height: 8.h),

          // 5. زر الحفظ (Save)
          CustomButton(
            text: 'Save',
            radius: 14.r,
            onPressed: () {
              setState(() {
                if (_startDate != null && _endDate != null) {
                  _errorMessage = null;
                  String formattedDate =
                      '${_startDate!.day} ${_getMonthShort(_startDate!.month)} - ${_endDate!.day} ${_getMonthShort(_endDate!.month)}';
                  widget.onSave(formattedDate, _startDate, _endDate);
                } else if (_startDate != null) {
                  _errorMessage = null;
                  String formattedDate =
                      '${_startDate!.day} ${_getMonthShort(_startDate!.month)}';
                  widget.onSave(formattedDate, _startDate, null);
                } else {
                  _errorMessage = 'Please select a date first';
                }
              });
            },
          ),
        ],
      ),
    );
  }
}

String _getMonthName(int month) {
  const months = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];
  return months[month - 1];
}

String _getMonthShort(int month) {
  const months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec',
  ];
  return months[month - 1];
}
