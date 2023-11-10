import 'dart:async';

import 'package:emer_app/core/exceptions/app_error_hadler.dart';
import 'package:emer_app/data/profile_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';

part 'auth_store.g.dart';

enum AuthStatus {
  unknown,
  authenticated,
}

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  final auth = FirebaseAuth.instance;

  @observable
  AuthStatus status = AuthStatus.unknown;

  @observable
  bool loading = false;

  @observable
  User? user;

  @observable
  ProfileData? profile;

  @action
  void setStatus(AuthStatus st) => status = st;

  @action
  void setLoading(bool val) => loading = val;

  @action
  void setUSer(User? data) => user = data;

  @action
  void setProfile(ProfileData? data) => profile = data;

  void setSignIn() => setStatus(AuthStatus.authenticated);

  Future<void> login(String email, String password) async {
    setLoading(true);
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } catch (err, st) {
      handleError(err, st);
      setLoading(false);
    }
  }
}
