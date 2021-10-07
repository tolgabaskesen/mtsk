import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mtsk/helpers/sharedpref.dart';
import 'package:mtsk/init/generated/codegen_loader.g.dart';
import 'package:mtsk/provider/languageprovider.dart';
import 'package:mtsk/screens/homepage.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await BaseSharedPrefHelper.preferencesInit();
  await EasyLocalization.ensureInitialized();
  bool isFirstLang =
      BaseSharedPrefHelper.instance.getStringValue("deviceLang") == "en";
  if (isFirstLang) {
    var lang = Platform.localeName;
    if (lang == "tr_TR" || lang == "en_US") {
      BaseSharedPrefHelper.instance
          .setStringValue("deviceLang", lang.split("_")[0]);
    } else {
      BaseSharedPrefHelper.instance.setStringValue("deviceLang", "tr");
    }
  }
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => LanguageNotifier(),
      ),
    ],
    child: EasyLocalization(
      child: const MyApp(),
      // supportedLocales: LanguageManager.instance.supportedLocales,
      // ignore: prefer_const_literals_to_create_immutables
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('tr', 'TR'),
        const Locale('de', 'DE'),
        const Locale('ru', 'RU'),
        const Locale('fr', 'FR'),
        const Locale('fs', 'FS'),
        const Locale('ch', 'CH'),
      ],
      fallbackLocale: const Locale('tr', 'TR'),
      path: 'assets/lang',
      assetLoader: const CodegenLoader(),
    ),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageNotifier>(builder: (context, lang, widget) {
      return MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        debugShowCheckedModeBanner: false,
        title: 'myNote',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
        routes: {
          "/home_page": (context) => const HomePage(),
        },
        // ignore: prefer_const_literals_to_create_immutables
        supportedLocales: [
          const Locale('en', 'US'),
          const Locale('tr', 'TR'),
          const Locale('de', 'DE'),
        ],
        locale: context.locale,
      );
    });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [],
        ),
      ),
    );
  }
}
