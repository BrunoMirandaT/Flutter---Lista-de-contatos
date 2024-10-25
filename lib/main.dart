import 'package:flutter/material.dart';
import 'package:myapp/menu.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(
      child: MaterialApp(
    title: 'Contatos',
    theme: ThemeData(scaffoldBackgroundColor: const Color(0XFF101419)),
    debugShowCheckedModeBanner: false,
    home: menu(),
  )));
}
