import 'package:flutter_task10_team_housely_app_beg/core/app/routes.dart';
import 'package:flutter_task10_team_housely_app_beg/core/services/service_locator.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/data/models/user_model.dart';

class AppInitializer {
  final AuthLocalDataSource _local = getIt<AuthLocalDataSource>();

  static late String nextRoute;

  Future<void> init() async {
    final UserModel? user = await _local.getUser();

    if (user == null) {
      nextRoute = AppRouter.kOnBoarding;
    } else {
      if (user.rememberMe == true) {
        if (user.myLocation != null && user.myLocation!.isNotEmpty) {
          nextRoute = AppRouter.kBottomBar;
        } else {
          nextRoute = AppRouter.kSelectLocation;
        }
      } else {
        nextRoute = AppRouter.kSignin;
      }
    }

    AppRouter.initRouter();
  }
}
