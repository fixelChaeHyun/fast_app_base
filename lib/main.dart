import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'app.dart';
import 'common/data/preference/app_preferences.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  final bindings = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: bindings);
  // Flutter NativeSplash 에서 기존 Splash 화면을 preserve 한다.
  // --> MainScreen 진입 전까지 유지하다가 제거하고 싶으므로, MainScreen 에서 제거코드를 작성한다.

  await EasyLocalization.ensureInitialized();
  await AppPreferences.init();

  timeago.setLocaleMessages('ko', timeago.KoMessages());

  runApp(EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ko')],
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      useOnlyLangCode: true,
      child: const App()));
}
