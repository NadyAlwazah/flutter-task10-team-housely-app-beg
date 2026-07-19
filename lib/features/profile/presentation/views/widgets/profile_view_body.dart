import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task10_team_housely_app_beg/core/widgets/app_loader.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/data/manager/profile_cubit/profile_cubit.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/profile_image_widget.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/profile_options_list.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/widgets/user_info_widget.dart';

class ProfileViewBody extends StatefulWidget {
  const ProfileViewBody({super.key});

  @override
  State<ProfileViewBody> createState() => _ProfileViewBodyState();
}

class _ProfileViewBodyState extends State<ProfileViewBody> {
  @override
  void initState() {
    context.read<ProfileCubit>().loadUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 56),
            const ProfileImageWidget(),

            const SizedBox(height: 16),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoading) {
                  return const AppLoader();
                } else if (state is ProfileLoaded) {
                  return UserInfoWidget(user: state.user);
                } else {
                  return const Text("No user data");
                }
              },
            ),

            const SizedBox(height: 64),
            const Divider(),

            const SizedBox(height: 16),
            const ProfileOptionsList(),
          ],
        ),
      ),
    );
  }
}
