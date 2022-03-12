import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tery_app/login/login.dart';

class LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (contextl, state) {
        print('${state} listener....');
      },
      child: Align(
        alignment: const Alignment(0, -1 / 3),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [_UserNameInput(), _PasswordInput()],
        ),
      ),
    );
  }
}

class _UserNameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        print('${previous} $current .......');
        return false;
      },
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_usernameInput_textField'),
          onChanged: (username) => context.read<LoginBloc>().add(
                LoginUsernameChanged(username),
              ),
          decoration: InputDecoration(labelText: '이름', errorText: 'fail'),
        );
      },
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return TextField(
          key: const Key('loginForm_passwordInput_textField'),
          // onChanged: (password) => ,
          decoration: InputDecoration(labelText: '비밀번호', errorText: 'fail'),
        );
      },
    );
  }
}
