import 'package:flutter_task10_team_housely_app_beg/core/layout/bottom_bar_layout.dart';
import 'package:flutter_task10_team_housely_app_beg/features/add_review/presentation/views/add_review_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/reset_password_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/signin_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/signup_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/booking_add_card_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/booking_payment_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/booking_reserve_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/chat_detail_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/chat_list_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/details_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/popular_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/notifications_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/profile_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/search_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/select_location_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kOnBoarding = '/on_boarding';
  static const String kSignin = '/signin';
  static const String kSignup = '/signup';
  static const String kBottomBar = '/bottom_bar';
  static const String kDetails = '/details';
  static const String kSearch = '/search';
  static const String kProfile = '/profile';
  static const String kAddReview = '/add_review';
  static const String kResetPassword = '/reset_password';
  static const String kBookingAddCard = '/booking_add_card';
  static const String kBookingPayment = '/booking_payment';
  static const String kBookingReserve = '/booking_reserve';
  static const String kChatList = '/chat_list';
  static const String kChatDetail = '/chat_detail';
  static const String kPopular = '/popular';
  static const String kNotifications = '/notifications';
  static const String kSelectLocation = '/select_location';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kSignin, builder: (context, state) => const SigninView()),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
      GoRoute(path: '/', builder: (context, state) => const BottomBarLayout()),

      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(path: kSignin, builder: (context, state) => const SigninView()),
      GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
      GoRoute(path: '/', builder: (context, state) => const BottomBarLayout()),

      GoRoute(
        path: kOnBoarding,
        builder: (context, state) => const OnBoardingView(),
      ),
      GoRoute(path: kDetails, builder: (context, state) => const DetailsView()),

      GoRoute(path: kProfile, builder: (context, state) => const ProfileView()),

      GoRoute(path: kSearch, builder: (context, state) => const SearchView()),
      GoRoute(
        path: kAddReview,
        builder: (context, state) => const AddReviewView(),
      ),
      GoRoute(
        path: kResetPassword,
        builder: (context, state) => const ResetPasswordView(),
      ),

      GoRoute(
        path: kBookingAddCard,
        builder: (context, state) => const BookingAddCardView(),
      ),
      GoRoute(
        path: kBookingPayment,
        builder: (context, state) => const BookingPaymentView(),
      ),
      GoRoute(
        path: kBookingReserve,
        builder: (context, state) => const BookingReserveView(),
      ),
      GoRoute(
        path: kChatList,
        builder: (context, state) => const ChatListView(),
      ),
      GoRoute(
        path: kChatDetail,
        builder: (context, state) => const ChatDetailView(),
      ),
      GoRoute(path: kPopular, builder: (context, state) => const PopularView()),
      GoRoute(
        path: kNotifications,
        builder: (context, state) => const NotificationsView(),
      ),
      GoRoute(
        path: kSelectLocation,
        builder: (context, state) => const SelectLocationView(),
      ),
    ],
  );
}
