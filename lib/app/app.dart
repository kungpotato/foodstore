import 'dart:async';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:emer_app/app/app_home.dart';
import 'package:emer_app/app/authentication/splash_page.dart';
import 'package:emer_app/app/authentication/store/auth_store.dart';
import 'package:emer_app/app/locale/locale_store.dart';
import 'package:emer_app/app/storage/theme_storeage.dart';
import 'package:emer_app/app/theme/app_theme.dart';
import 'package:emer_app/l10n/l10n.dart';
import 'package:emer_app/shared/extensions/context_extension.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:reactive_forms/reactive_forms.dart';

class App extends StatefulWidget {
  const App({this.adaptiveThemeMode, super.key});

  final AdaptiveThemeMode? adaptiveThemeMode;

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final _auth = FirebaseAuth.instance;

  NavigatorState get _navigator => _navigatorKey.currentState!;
  late ReactionDisposer disposer;
  late StreamSubscription<dynamic> subAuth;

  @override
  void initState() {
    super.initState();
    ThemePreferences.instance.init();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      subAuth = _auth.authStateChanges().listen((user) {
        if (user != null) {
          context.authStore.setUSer(user);
          context.authStore.setSignIn();
        } else {
          context.authStore.login('admin@mail.com', '12345678');
        }
      });

      watchAuthState();
    });
  }

  void watchAuthState() {
    final authStore = Provider.of<AuthStore>(context, listen: false);
    disposer = reaction((_) => authStore.status, (status) {
      if (status == AuthStatus.authenticated) {
        _navigator.pushAndRemoveUntil(
          MaterialPageRoute<dynamic>(
            builder: (context) => const AppHome(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    disposer.call();
    subAuth.cancel();
  }

  @override
  Widget build(BuildContext context) {
    final localeStore = Provider.of<LocaleStore>(context, listen: false);

    return AdaptiveTheme(
      light: MyThemes.lightTheme,
      dark: MyThemes.darkTheme,
      initial: widget.adaptiveThemeMode ?? AdaptiveThemeMode.light,
      builder: (light, dark) => Observer(
        builder: (context) => ReactiveFormConfig(
          validationMessages: {
            ValidationMessage.required: (error) => 'Should not be empty',
            ValidationMessage.email: (error) => 'Invalid email',
          },
          child: MaterialApp(
            title: 'My App',
            theme: light,
            darkTheme: dark,
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: [
              Locale('th'),
              Locale('en'),
            ],
            locale: localeStore.locale,
            navigatorKey: _navigatorKey,
            onGenerateRoute: (settings) =>
                MaterialPageRoute(builder: (context) => const SplashPage()),
          ),
        ),
      ),
    );
  }
}
