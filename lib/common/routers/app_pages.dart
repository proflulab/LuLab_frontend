import 'package:get/get.dart';

import '../../pages/app.dart';
import '../../pages/notfound/index.dart';
import '../../pages/sign_in/login_password.dart';
import '../../pages/sign_up/register.dart';
import '../../pages/start/loading.dart';
import '../../pages/users/users_agreement.dart';

// import '../middlewares/router_auth.dart';
import '../middlewares/click_login.dart';

part 'app_routes.dart';

class AppPages {
  static const iNITIAL = AppRoutes.load;

  static final List<GetPage> routes = [
    // 启动页
    GetPage(name: AppRoutes.load, page: () => const LoadingPage()),

    GetPage(name: AppRoutes.app, page: () => const App()),

    GetPage(name: AppRoutes.signinpage, page: () => const SignInPage()),

    GetPage(name: AppRoutes.signUp, page: () => const SignUpPage()),

    GetPage(name: AppRoutes.agreement, page: () => const Agreement()),

    GetPage(name: AppRoutes.start, page: () => const App(), middlewares: [
      ClickLoginMiddleware(priority: 2),
    ]),

    /// 中间件

    // 我的页面多级路由
    // GetPage(
    //   name: AppRoutes.Home,
    //   page: () => const App(),
    //   // binding: HomeBinding(),
    //   children: [
    //     GetPage(
    //       name: AppRoutes.List,
    //       page: () => const ListIndexView(),
    //       children: [
    //         GetPage(
    //           name: AppRoutes.Detail,
    //           page: () => const DetailView(),
    //         ),
    //         GetPage(
    //           name: AppRoutes.Detail_ID,
    //           page: () => const DetailView(),
    //           transition: Transition.downToUp,
    //         ),
    //       ],
    //     ),
    //   ],
    // ),
  ];

  static final unknownRoute =
      GetPage(name: AppRoutes.notFound, page: () => const NotfoundView());
}
