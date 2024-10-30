import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:myapp/contact_generator.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

class menu extends ConsumerWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context, ref) {
    List<String> nome_pasta = ref.watch(strNotifierProviderFolder);
    final nome = "teste";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
            child: Column(children: <Widget>[
          ...nome_pasta.map((e) => GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const contato()),
                );
              },
              child: SizedBox(
                width: 300,
                height: 70,
                child: Card(
                  color: Color(0XFF666A86),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Row(children: [
                          SizedBox(width: 10),
                          Icon(
                            Icons.person,
                            color: Color(0XFF49393b),
                            size: 40,
                          ),
                          SizedBox(width: 20),
                          Text(
                            e.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 24,
                                color: Color(0XFFf0f3f5)),
                          )
                        ]),
                      ]),
                ),
              ))),
        ])),
        floatingActionButton: FloatingActionButton(
          highlightElevation: BorderSide.strokeAlignCenter,
          backgroundColor: const Color.fromRGBO(31, 31, 31, 1.0),
          tooltip: 'New',
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromRGBO(0, 169, 212, 1.0)),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            ref.read(strNotifierProviderFolder.notifier).addString(nome);
          },
          child: const Icon(Icons.add,
              color: Color.fromRGBO(0, 169, 212, 1.0), size: 42),
        ));
  }
}

class contato extends ConsumerWidget {
  const contato({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(appBar: AppBar());
  }
}
