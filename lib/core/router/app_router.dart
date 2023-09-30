import 'package:auto_route/auto_route.dart';
import 'package:fb_note/view/Home/home_page.dart';
import 'package:fb_note/view/Home/pages/about_page.dart';
import 'package:fb_note/view/Home/pages/add_note_page.dart';
import 'package:fb_note/view/auth/forget_password_page.dart';
import 'package:fb_note/view/auth/login_page.dart';
import 'package:fb_note/view/auth/signup_page.dart';
import 'package:fb_note/view/onboarding/onboarding_page.dart';
import 'package:fb_note/view/splash/splash_page.dart';

part 'app_router.gr.dart';

final router = AppRouter();

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        //? splash
        AutoRoute(page: SplashRoute.page, initial: true),
        //? onboarding
        AutoRoute(page: OnBoardingRoute.page),
        //? auth
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SignUpRoute.page),
        AutoRoute(page: ForgetPasswordRoute.page),
        //? Home
        AutoRoute(page: HomeRoute.page),
        AutoRoute(page: AddNoteRoute.page),
        AutoRoute(page: AboutRoute.page),
      ];
}
