import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/dummy/property_dummy_data.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/manager/property_cubit/property_cubit.dart';
import 'widgets/search_view_body.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PropertyCubit>()
        ..loadData(
          recommended: recommendedProperties,
          popular: popularProperties,
          nearbyProperties: nearbyProperties,
        ),
      child: const Scaffold(body: SafeArea(child: SearchViewBody())),
    );
  }
}
