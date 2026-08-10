import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'booking_card_preview_section.dart';

// --- فئة لتنسيق رقم البطاقة (إضافة مسافة تلقائية بين كل 4 أرقام) ---
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
  // استقبال البيانات القديمة في حال الضغط على Edit
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
                      hintText: '06/21',
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
              // شرط عدم الخروج قبل تعبئة جميع الخانات بالكامل وصحتها (مع إضافة الرموز الناقصة للشرط)
              if (nameController.text.trim().isEmpty ||
                  cardNumberController.text.replaceAll(' ', '').length < 16 ||
                  expiryController.text.length < 5 ||
                  cvvController.text.length < 4) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Please fill all fields correctly'),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }

              // حفظ وإرجاع كافة البيانات كـ Map للواجهة السابقة
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
