import 'package:flutter/foundation.dart' show immutable;
import 'package:mynotes/servides/auth/auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn(this.user);
}

class AuthStateLoggedInFailuare extends AuthState {
  final Exception exception;
  const AuthStateLoggedInFailuare(this.exception);
}

class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification();
}

class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

class AuthStateLoggedOutFailuare extends AuthState {
  final Exception exception;
  const AuthStateLoggedOutFailuare(this.exception);
}
