import 'package:flutter/material.dart';
import 'package:myapp/menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(ProviderScope(
      child: MaterialApp(
    title: 'Contatos',
    theme: ThemeData(scaffoldBackgroundColor: const Color(0XFF101419)),
    debugShowCheckedModeBanner: false,
    home: menu(),
  )));
}
