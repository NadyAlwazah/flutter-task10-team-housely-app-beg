import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/favourite/presentation/views/widgets/favourite_view_body.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/dummy/property_dummy_data.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';

class FavouriteView extends StatelessWidget {
  const FavouriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PropertyCubit>()
        ..loadData(
          popular: popularProperties,
          recommended: recommendedProperties,
        ),
      child: const SafeArea(child: FavouriteViewBody()),
    );
  }
}
