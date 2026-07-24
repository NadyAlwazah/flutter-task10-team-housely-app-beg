import 'package:flutter_bloc/flutter_bloc.dart';

class HomeContentCubit extends Cubit<bool> {
  HomeContentCubit() : super(false); // false =  HomeView اعرض

  void showPopular() => emit(true); // PopularView اعرض
  void showHome() => emit(false); // HomeView اعرض
}
