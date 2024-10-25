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
              child: Expanded(
                child: Card(
                  color: Color(0XFF7D7ABC),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Image.asset(''),
                        GradientText(
                          e.toString(),
                          style: TextStyle(fontSize: 20),
                          colors: [Color(0xff00a9d4), Color(0xff40ffdc)],
                        ),
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
