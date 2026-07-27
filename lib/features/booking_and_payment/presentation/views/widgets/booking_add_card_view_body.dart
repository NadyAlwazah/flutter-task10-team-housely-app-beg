import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_text_form_field.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';
import 'booking_card_preview_section.dart';

class BookingAddCardViewBody extends StatefulWidget {
  const BookingAddCardViewBody({super.key});

  @override
  State<BookingAddCardViewBody> createState() => _BookingAddCardViewBodyState();
}

class _BookingAddCardViewBodyState extends State<BookingAddCardViewBody> {
  final TextEditingController nameController = TextEditingController(
    text: 'Brooklyn Simmons',
  );
  final TextEditingController cardNumberController = TextEditingController(
    text: '1234 5678 9101 1121',
  );
  final TextEditingController expiryController = TextEditingController(
    text: '06/21',
  );
  final TextEditingController cvvController = TextEditingController(
    text: '3134',
  );

  @override
  void initState() {
    super.initState();
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
              // إرجاع رقم البطاقة للواجهة الرئيسية وتحديث حالة الـ Payment
              context.pop(cardNumberController.text);
            },
          ),
        ],
      ),
    );
  }
}
