import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tery_app/consts.dart';
import 'package:tery_app/app.dart';
import 'package:bloc/bloc.dart';
import 'package:tery_app/simple_bloc_observer.dart';
import 'package:tery_app/store/view/store_view.dart';
import 'package:tery_app/store/view/store_list_detail.dart';
import 'package:flutter/foundation.dart' show TargetPlatform;
import 'package:tery_app/store/models/store.dart';
import 'package:authentication_repository/authentication_repository.dart';
import 'package:tery_app/authentication/authentication.dart';
import 'package:tery_app/splash/splash.dart';

import 'package:tery_app/homet/homet.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(MyApp(authenticationRepository: AuthenticationRepository())),
      blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.authenticationRepository}) : super(key: key);

  final AuthenticationRepository authenticationRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: authenticationRepository,
      child: BlocProvider(
        create: (_) => AuthenticationBloc(
          authenticationRepository: authenticationRepository,
        ),
        child: AppView(),
      ),
    );
  }

  // This widget is the root of your application.
  // Widget build(BuildContext context) {
  //   var platform = Theme.of(context).platform;
  //   print(platform);
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     onGenerateRoute: (settings) {
  //       if (settings.name == StoreListDetail.routeName) {
  //         return MaterialPageRoute(
  //           builder: (context) {
  //             final Store arg = settings.arguments as Store;
  //             // final StoreListDetailArguments args = settings.arguments;

  //             // print('test... ${args}');
  //             return StoreListDetail(
  //               id: arg.id,
  //               title: arg.title,
  //               imageUrl: arg.imageUrl,
  //             );
  //           },
  //         );
  //       }
  //     },
  //     title: MainConsts.appName,
  //     theme: ThemeData(
  //       primarySwatch: Colors.blue,
  //     ),
  //     initialRoute: '/home',
  //     routes: {
  //       '/home': (context) => const MainScreen(),
  //       // '/store-detail': (context) => StoreListDetail()
  //     },
  //   );
  // }
}

class AppView extends StatefulWidget {
  @override
  _AppViewState createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  Widget build(BuildContext context) {
    print(_navigatorKey.currentState);
    print(AuthenticationStatus.authenticated);
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            print('ddddsadadsadsa');
            // switch (state.status) {
            //   case AuthenticationStatus.authenticated:
            //     _navigator.pushAndRemoveUntil<void>(
            //       HometPage.route(),
            //       (route) => false,
            //     );
            //     break;
            //   default:
            //     break;
            // }
          },
          child: child,
        );
      },
      initialRoute: '/home',
      onGenerateRoute: (_) => SplashPage.route(),
    );
  }
}
