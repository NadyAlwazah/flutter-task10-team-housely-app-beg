import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/search_property_field.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SearchPropertyField(
              hintText: "Search Property",
              suffixIcon: SvgPicture.asset(
                AssetsData.iconCloseSquareSvg,
                width: 24.r,
                height: 24.r,
              ),
              onTapSuffix: () => context.pop(),
            ),
          ],
        ),
      ),
    );
  }
}
