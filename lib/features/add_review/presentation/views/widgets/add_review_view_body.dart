import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_snack_bar.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_button.dart';
import 'package:flutter_task10_team_housely_app_beg/features/add_review/presentation/views/widgets/gallerybottomsheet.dart';
import 'package:flutter_task10_team_housely_app_beg/features/add_review/presentation/views/widgets/writereviewsection.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

import 'property_info_card.dart';
import 'upload_media_section.dart';

class AddReviewViewBody extends StatefulWidget {
  final PropertyModel? property;
  final String? userName;
  final double? initialRating;
  final Function(ReviewModel newReview)? onReviewAdded;

  const AddReviewViewBody({
    super.key,
    this.property,
    this.userName,
    this.initialRating,
    this.onReviewAdded,
  });

  @override
  State<AddReviewViewBody> createState() => _AddReviewViewBodyState();
}

class _AddReviewViewBodyState extends State<AddReviewViewBody> {
  final TextEditingController _reviewController = TextEditingController();
  final ImagePicker _picker = ImagePicker();

  String? _selectedImagePath;
  bool _isLoading = false;

  Future<void> _pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 85,
    );

    if (image != null) {
      setState(() {
        _selectedImagePath = image.path;
      });
    }
  }

  void _openGalleryBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (bottomSheetContext) => GalleryBottomSheet(
        onPickFromGallery: () async {
          if (bottomSheetContext.mounted) {
            bottomSheetContext.pop();
          }
          await _pickImageFromGallery();
        },
        onImageSelected: (imagePath) {
          setState(() {
            _selectedImagePath = imagePath;
          });
        },
      ),
    );
  }

  Future<void> _submitReview() async {
    final reviewText = _reviewController.text.trim();

    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        CustomSnackBar(message: 'Please write your review', isError: true),
      );
      return;
    }

    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(milliseconds: 300));

    if (!mounted) return;

    final newReview = ReviewModel(
      reviewerName: widget.userName ?? 'Theresa Webb',
      reviewerImage: _selectedImagePath ?? AssetsData.imageReview1Png,
      rating: widget.initialRating ?? 5.0,
      comment: reviewText,
    );

    if (widget.property != null) {
      // context.read<PropertyCubit>().addReview(widget.property!.id, newReview);
    }

    if (widget.onReviewAdded != null) {
      widget.onReviewAdded!(newReview);
    }

    _reviewController.clear();
    setState(() {
      _selectedImagePath = null;
      _isLoading = false;
    });

    // if (widget.property != null) {
    //   context.push(
    //     AppRouter.kDetails,
    //     extra: {
    //       'property': widget.property,
    //       'cubit': context.read<PropertyCubit>(),
    //     },
    //   );
    // } else {
    //   if (context.canPop()) {
    //     context.pop(newReview);
    //   }
    // }
  }

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 12.h),
                    PropertyInfoCard(property: widget.property),
                    SizedBox(height: 24.h),
                    UploadMediaSection(
                      selectedImagePath: _selectedImagePath,
                      onTapUpload: _openGalleryBottomSheet,
                    ),
                    SizedBox(height: 24.h),
                    WriteReviewSection(controller: _reviewController),
                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 16.h, top: 8.h),
              child: CustomButton(
                text: 'Submit Review',
                isLoading: _isLoading,
                onPressed: _submitReview,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
