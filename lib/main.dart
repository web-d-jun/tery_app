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

void main() {
  BlocOverrides.runZoned(() => runApp(const MyApp()), blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var platform = Theme.of(context).platform;
    print(platform);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) {
        if (settings.name == StoreListDetail.routeName) {
          return MaterialPageRoute(
            builder: (context) {
              final Store arg = settings.arguments as Store;
              // final StoreListDetailArguments args = settings.arguments;

              // print('test... ${args}');
              return StoreListDetail(
                id: arg.id,
                title: arg.title,
                imageUrl: arg.imageUrl,
              );
            },
          );
        }
      },
      title: MainConsts.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/home',
      routes: {
        '/home': (context) => const MainScreen(),
        // '/store-detail': (context) => StoreListDetail()
      },
    );
  }
}
