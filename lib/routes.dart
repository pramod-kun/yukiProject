import 'package:yukiproject/home/home.dart';
import 'package:yukiproject/index/index.dart';
import 'package:yukiproject/login/login.dart';

var appRoutes = {
  '/': (context) => const IndexScreen(),
  'home': (context) => const HomeScreen(),
  'login': (context) => const LoginScreen()
};
