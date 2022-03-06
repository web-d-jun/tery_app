import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute(builder: (_) => LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12),
          // child: BlocProvider(
          //   create: (context) {
          //     return LoginBloc(
          //       authenticationRepository: R
          //     );
          //   },
          // ),
        ),
      ),
    );
  }
}
