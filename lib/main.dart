import 'package:flutter/material.dart';
import 'package:untitled4/homepage.dart';
import 'package:untitled4/homepageprovider.dart';
import 'package:untitled4/loginpage.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(providers:[
      ChangeNotifierProvider(create: (_)=> Homepageprovider()),

    ],child: MyApp()) ,
    );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const Homepage(),
      },
    );
  }
}
