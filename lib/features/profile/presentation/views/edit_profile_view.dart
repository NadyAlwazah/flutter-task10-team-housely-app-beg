import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocProvider;
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/custom_app_bar.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/data/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/edit_profile_view_body.dart';
import 'package:go_router/go_router.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Edit Profile",
        onTapLeading: () => context.pop(),
      ),
      body: BlocProvider(
        create: (context) => getIt<ProfileCubit>(),
        child: const EditProfileViewBody(),
      ),
    );
  }
}
