import 'package:flutter_task10_team_housely_app_beg/core/layout/bottom_bar_layout.dart';
import 'package:flutter_task10_team_housely_app_beg/features/add_review/presentation/views/add_review_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/forgot_password_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/reset_password_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/signin_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/signup_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/success_reset_password_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/auth/presentation/views/verify_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/booking_add_card_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/booking_payment_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/booking_and_payment/presentation/views/booking_reserve_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/chat_detail_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/chat/presentation/views/chat_list_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/details_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/presentation/views/popular_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/notifications/presentation/views/notifications_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/on_boarding/presentation/views/on_boarding_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/profile/presentation/views/edit_profile_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/fillter_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/search/presentation/views/search_view.dart';
import 'package:flutter_task10_team_housely_app_beg/features/select_location/presentation/views/map_page.dart';
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
  static const String kAddReview = '/add_review';
  static const String kResetPassword = '/reset_password';
  static const String kForgotPassword = '/forgot_password';
  static const String kBookingAddCard = '/booking_add_card';
  static const String kBookingPayment = '/booking_payment';
  static const String kBookingReserve = '/booking_reserve';
  static const String kChatList = '/chat_list';
  static const String kChatDetail = '/chat_detail';
  static const String kPopular = '/popular';
  static const String kNotifications = '/notifications';
  static const String kSelectLocation = '/select_location';
  static const String kMapPage = '/map';
  static const String kEditProfile = '/edit_profile';
  static const String kVerify = '/verify';
  static const String kSuccessResetPassword = '/success_reset_password';
  static const String kFillter = '/fillter';

  static late GoRouter router;

  static void initRouter() {
    router = GoRouter(
      initialLocation: '/',
      routes: [
        GoRoute(path: '/', builder: (context, state) => const SplashView()),
        GoRoute(
          path: kOnBoarding,
          builder: (context, state) => const OnBoardingView(),
        ),
        GoRoute(path: kSignin, builder: (context, state) => const SigninView()),
        GoRoute(path: kSignup, builder: (context, state) => const SignupView()),
        GoRoute(
          path: kBottomBar,
          builder: (context, state) => const BottomBarLayout(),
        ),
        GoRoute(
          path: kEditProfile,
          builder: (context, state) => const EditProfileView(),
        ),
        GoRoute(
          path: kDetails,
          builder: (context, state) => const DetailsView(),
        ),
        GoRoute(
          path: kSelectLocation,
          builder: (context, state) => const SelectLocationView(),
        ),
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
          path: kForgotPassword,
          builder: (context, state) => const ForgotPasswordView(),
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
        GoRoute(
          path: kPopular,
          builder: (context, state) => const PopularView(),
        ),
        GoRoute(
          path: kNotifications,
          builder: (context, state) => const NotificationsView(),
        ),
        GoRoute(path: kMapPage, builder: (context, state) => const MapPage()),
        GoRoute(path: kVerify, builder: (context, state) => const VerifyView()),
        GoRoute(
          path: kSuccessResetPassword,
          builder: (context, state) => const SuccessResetPasswordView(),
        ),
        GoRoute(
          path: kFillter,
          builder: (context, state) => const FillterView(),
        ),
      ],
    );
  }
}
