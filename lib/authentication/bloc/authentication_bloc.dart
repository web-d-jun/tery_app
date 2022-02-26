import 'dart:async';

import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({required AuthenticationRepository authenticationRepository})
      : _authenticationRepository = authenticationRepository,
        super(const AuthenticationState.unknown()) {
    on<AuthenticationStatusChanged>(
      (event, emit) => {
        print('AuthenticationStatusChanged ${event} ${emit}'),
      },
    );
    _authenticationStatusSubscription = _authenticationRepository.status.listen((status) {
      // print(status);
    });
  }

  final AuthenticationRepository _authenticationRepository;
  late StreamSubscription<AuthenticationStatus> _authenticationStatusSubscription;
}
