import 'package:untitled/src/core/widget/sharedView/susses_states.dart';
import 'package:untitled/src/feature/auth/presentation/widgets/auth_container.dart';
import 'package:untitled/src/feature/auth/presentation/pages/forget_pass_page.dart';
import 'package:auto_route/auto_route.dart';
import 'package:untitled/src/feature/auth/presentation/pages/login_page.dart';
import 'package:untitled/src/feature/auth/presentation/pages/otp_page.dart';
import 'package:untitled/src/feature/auth/presentation/pages/register_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/app_html_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/empty_test_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/home_container.dart';
import 'package:untitled/src/feature/home/presentation/pages/home_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/pickImage.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile/EmptyProfilePage.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile/about_us_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile/change_password_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile/contact_us_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile/edite_profile_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile/profile_info_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile/settings_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/profile_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/question_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/question/question_result_page.dart';
import 'package:untitled/src/feature/home/presentation/pages/test_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    //Auth Routes
    AutoRoute<dynamic>(page: AuthContainer, children: [
      AutoRoute<dynamic>(page: LoginPage, initial: true),
      AutoRoute<dynamic>(page: RegisterPage),
      AutoRoute<dynamic>(page: ForgetPassPage),
      AutoRoute<dynamic>(page: OtpPage),
      AutoRoute<dynamic>(page: ChangePasswordPage,name: "ResetPassword"),

    ]),
    //Main Routes
    AutoRoute<dynamic>(page: HomeContainer, children: [
      AutoRoute<dynamic>(page: HomePage, initial: true),
      AutoRoute<dynamic>(page: EmptyTestPage,children: [
        AutoRoute<dynamic>(page: TestPage,initial: true),
        AutoRoute<dynamic>(page: PickImage)
      ]),
      AutoRoute<dynamic>(page: ProfilePage),

    ]),

    AutoRoute<dynamic>(page: EmptyProfilePage, children: [
      AutoRoute<dynamic>(page: ProfileInfoPage, initial: true, children: []),
      AutoRoute<dynamic>(page: EditeProfilePage),
      AutoRoute<dynamic>(page: ChangePasswordPage),
    ]),

    AutoRoute<dynamic>(page: AboutUsPage),
    AutoRoute<dynamic>(page: ContactUsPage),
    AutoRoute<dynamic>(page: SettingsPage, initial: true),
    AutoRoute<dynamic>(page: QuestionPage),
    AutoRoute<dynamic>(page: QuestionResultPage),
    AutoRoute<dynamic>(page: AppHtmlPage),
    AutoRoute<dynamic>(page: SussesStates),

  ],
)
class $AppRouter {}
