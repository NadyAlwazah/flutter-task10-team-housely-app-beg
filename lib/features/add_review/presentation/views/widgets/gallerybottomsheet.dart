import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/styles.dart';

class GalleryBottomSheet extends StatelessWidget {
  final VoidCallback onPickFromGallery;
  final Function(String path) onImageSelected;

  const GalleryBottomSheet({
    super.key,
    required this.onPickFromGallery,
    required this.onImageSelected,
  });

  @override
  Widget build(BuildContext context) {

    final List<String> defaultGalleryImages = [
      AssetsData.imagCardPng,
      AssetsData.gallery2Jpg,
      AssetsData.gallery3Jpg,
      AssetsData.gallery4Jpg,
      AssetsData.gallery5Jpg,
      AssetsData.gallery6Jpg,
      AssetsData.gallery7Jpg,
      AssetsData.gallery8Jpg,
      AssetsData.gallery9Jpg,
    ];

    return Container(
      height: MediaQuery.of(context).size.height * 0.75,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24.r),
          topRight: Radius.circular(24.r),
        ),
      ),
      child: Column(
        children: [
          SizedBox(height: 8.h),

          Container(
            width: 42.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.10),
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Gallery',
            style: Styles.textStyle18W600Inter,
          ),
          SizedBox(height: 16.h),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 8.w,
                  mainAxisSpacing: 8.h,
                  childAspectRatio: 106.33 / 128.33,
                ),
                itemCount: defaultGalleryImages.length + 1,
                itemBuilder: (context, index) {

                  if (index == 0) {
                    return GestureDetector(
                      onTap: onPickFromGallery,
                      child: Container(
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(8.r),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add_a_photo_outlined,
                              size: 28.r,
                              color: Colors.grey[700],
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              'Browse',
                              style: Styles.textStyle12W400Inter.copyWith(
                                color: Colors.grey[700],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }


                  final imagePath = defaultGalleryImages[index - 1];

                  return GestureDetector(
                    onTap: () {
                      onImageSelected(imagePath);
                      Navigator.pop(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.asset(
                          imagePath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: const Color(0xFFD9D9D9),
                            child: Icon(
                              Icons.image_not_supported,
                              size: 24.r,
                              color: Colors.grey[600],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}