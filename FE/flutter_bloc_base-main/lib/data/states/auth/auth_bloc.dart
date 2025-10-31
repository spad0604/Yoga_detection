import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.dart';
import 'package:flutter_starter/services/oauth_token_manager/oauth_token_manager.default.dart';
import 'package:injectable/injectable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_starter/data/states/auth/auth_event.dart';
import 'package:flutter_starter/data/states/auth/auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final OauthTokenManager _tokenManager;

  AuthBloc({required OauthTokenManager tokenManager})
      : _tokenManager = tokenManager,
        super(const AuthState()) {
    on<AuthLoggedIn>(_onLoggedIn);
    on<AuthLoggedOut>(_onLoggedOut);
  }

  Future<void> _onLoggedIn(AuthLoggedIn event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      account: event.account,
    ));
  }

  Future<void> _onLoggedOut(AuthLoggedOut event, Emitter<AuthState> emit) async {
    emit(state.copyWith(
      account: null,
      error: event.error,
    ));
  }
}
