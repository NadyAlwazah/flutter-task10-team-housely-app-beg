import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'booking_card_preview_section.dart';

// --- فئة لتنسيق رقم البطاقة ---
class CardNumberInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll(' ', '');
    if (text.length > 16) {
      text = text.substring(0, 16);
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if ((i + 1) % 4 == 0 && i + 1 != text.length) {
        buffer.write(' ');
      }
    }
    String formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

// --- فئة لتنسيق تاريخ الانتهاء (رقمين / رقمين تلقائياً) ---
class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    var text = newValue.text.replaceAll('/', '');
    if (text.length > 4) {
      text = text.substring(0, 4);
    }
    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      if (i == 1 && text.length > 2) {
        buffer.write('/');
      }
    }
    String formatted = buffer.toString();
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}

class BookingAddCardViewBody extends StatefulWidget {
  final String? initialName;
  final String? initialCardNumber;
  final String? initialExpiry;
  final String? initialCvv;

  const BookingAddCardViewBody({
    super.key,
    this.initialName,
    this.initialCardNumber,
    this.initialExpiry,
    this.initialCvv,
  });

  @override
  State<BookingAddCardViewBody> createState() => _BookingAddCardViewBodyState();
}

class _BookingAddCardViewBodyState extends State<BookingAddCardViewBody> {
  late final TextEditingController nameController;
  late final TextEditingController cardNumberController;
  late final TextEditingController expiryController;
  late final TextEditingController cvvController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.initialName ?? '');
    cardNumberController = TextEditingController(
      text: widget.initialCardNumber ?? '',
    );
    expiryController = TextEditingController(text: widget.initialExpiry ?? '');
    cvvController = TextEditingController(text: widget.initialCvv ?? '');

    nameController.addListener(() => setState(() {}));
    cardNumberController.addListener(() => setState(() {}));
    expiryController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    nameController.dispose();
    cardNumberController.dispose();
    expiryController.dispose();
    cvvController.dispose();
    super.dispose();
  }

  // دالة للتحقق من أن الاسم يحتوي على أحرف فقط وكل كلمة تبدأ بحرف كبير
  bool _validateName(String name) {
    // التحقق من أن الاسم يحتوي على أحرف ومسافات فقط (بدون أرقام أو رموز خاصة)
    final RegExp nameRegExp = RegExp(r'^[a-zA-ZÀ-ÿ\s]+$');
    if (!nameRegExp.hasMatch(name)) return false;

    // التحقق من أن أول حرف من كل كلمة هو حرف كبير (Capital)
    List<String> words = name.trim().split(RegExp(r'\s+'));
    for (String word in words) {
      if (word.isNotEmpty) {
        if (word[0] != word[0].toUpperCase()) {
          return false;
        }
      }
    }
    return true;
  }

  // دالة للتحقق من صحة تاريخ الانتهاء (الشهر من 01 لـ 12)
  bool _validateExpiry(String expiry) {
    if (expiry.length != 5 || !expiry.contains('/')) return false;

    List<String> parts = expiry.split('/');
    if (parts.length != 2) return false;

    int? month = int.tryParse(parts[0]);
    int? year = int.tryParse(parts[1]);

    if (month == null || year == null) return false;

    // التحقق أن الشهر بين 01 و 12
    if (month < 1 || month > 12) return false;

    return true;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. معاينة البطاقة في الأعلى
          BookingCardPreviewSection(
            cardNumber: cardNumberController.text,
            cardHolderName: nameController.text,
            expiryDate: expiryController.text,
          ),
          SizedBox(height: 24.h),

          // 2. حقل اسم صاحب البطاقة
          Text('Name', style: Styles.textStyle14W600Inter),
          SizedBox(height: 8.h),
          CustomTextFormField(
            controller: nameController,
            hintText: 'Brooklyn Simmons',
            textInputType: TextInputType.name,
          ),
          SizedBox(height: 16.h),

          // 3. حقل رقم البطاقة
          Text('Card Number', style: Styles.textStyle14W600Inter),
          SizedBox(height: 8.h),
          CustomTextFormField(
            controller: cardNumberController,
            hintText: '1234 5678 9101 1121',
            textInputType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(16),
              CardNumberInputFormatter(),
            ],
          ),
          SizedBox(height: 16.h),

          // 4. حقول تاريخ الانتهاء و الـ CVV
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Expired', style: Styles.textStyle14W600Inter),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: expiryController,
                      hintText: '06/25',
                      textInputType: TextInputType.datetime,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                        CardExpiryInputFormatter(),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Cvv', style: Styles.textStyle14W600Inter),
                    SizedBox(height: 8.h),
                    CustomTextFormField(
                      controller: cvvController,
                      hintText: '3134',
                      obscureText: true,
                      textInputType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(4),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 60.h),

          CustomButton(
            text: 'Add card',
            onPressed: () {
              // 1. التحقق من الفراغات الأساسية
              if (nameController.text.trim().isEmpty ||
                  cardNumberController.text.replaceAll(' ', '').length < 16 ||
                  expiryController.text.trim().isEmpty ||
                  cvvController.text.length < 3) {
                ScaffoldMessenger.of(context).showSnackBar(
                  CustomSnackBar(
                    message: 'Please fill all fields correctly',
                    isError: true,
                  ),
                );
                return;
              }

              // 2. التحقق من شروط الاسم (أحرف فقط، وأول حرف من كل كلمة كبير)
              if (!_validateName(nameController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  CustomSnackBar(
                    message:
                        'Name must contain letters only, and each word must start with a capital letter (e.g., Brooklyn Simmons)',
                    isError: true,
                  ),
                );
                return;
              }

              // 3. التحقق من شروط تاريخ الانتهاء (الشهر بين 01 و 12)
              if (!_validateExpiry(expiryController.text)) {
                ScaffoldMessenger.of(context).showSnackBar(
                  CustomSnackBar(
                    message:
                        'Please enter a valid expiry date where month is between 01 and 12 (e.g., 06/25)',
                    isError: true,
                  ),
                );
                return;
              }

              // حفظ وإرجاع كافة البيانات كـ Map للواجهة السابقة عند اجتياز كافة الشروط
              context.pop({
                'cardNumber': cardNumberController.text,
                'name': nameController.text,
                'expiry': expiryController.text,
                'cvv': cvvController.text,
              });
            },
          ),
        ],
      ),
    );
  }
}
