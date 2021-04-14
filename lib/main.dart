import 'package:arg_msjz/Journalists/bloc/journalist_bloc.dart';
import 'package:arg_msjz/constants.dart';
import 'package:arg_msjz/splash_screen_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'News/bloc/news_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: BlocProvider(
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: clubName,
          theme: ThemeData(
            primarySwatch: kPrimaryColor,
            scaffoldBackgroundColor: Color(0xFFE7E7E7),
          ),
          home: SplashScreenPage(),
        ),
        bloc: JournalistBloc(),
      ),
      bloc: NewsBloc(),
    );
  }
}
