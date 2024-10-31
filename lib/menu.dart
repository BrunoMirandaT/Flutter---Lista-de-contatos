import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myapp/contact_generator.dart';
import 'package:myapp/database.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:prompt_dialog/prompt_dialog.dart';

class menu extends ConsumerWidget {
  const menu({super.key});

  @override
  Widget build(BuildContext context, ref) {
    //List<String> nome_pasta = ref.watch(strNotifierProviderFolder);
    //final nome = "teste";
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(children: <Widget>[
            GestureDetector(
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
                              color: Color(0XFF101419),
                              size: 40,
                            ),
                            SizedBox(width: 20),
                            Text(
                              '',
                              style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 24,
                                  color: Color(0XFFf0f3f5)),
                            )
                          ]),
                        ]),
                  ),
                ))
          ]),
        ),
        floatingActionButton: FloatingActionButton(
          highlightElevation: BorderSide.strokeAlignCenter,
          backgroundColor: const Color.fromRGBO(31, 31, 31, 1.0),
          tooltip: 'New',
          shape: RoundedRectangleBorder(
            side: const BorderSide(color: Color.fromRGBO(0, 169, 212, 1.0)),
            borderRadius: BorderRadius.circular(10),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const contato()),
            );
          },
          child: const Icon(Icons.add,
              color: Color.fromRGBO(0, 169, 212, 1.0), size: 42),
        ));
  }
}

class contato extends StatefulWidget {
  const contato({super.key});

  @override
  State<contato> createState() => _addState();
}

class _addState extends State<contato> {
  uploadInfo() async {
    try {
      Map<String, dynamic> uploadInfo = {
        "nome": contactnamecontroller.text,
        "numero": contactnumbercontroller.text,
      };
      await DatabaseMethods().addContactInfo(uploadInfo);
      Navigator.pop(context);
    } catch (error) {
      print('Error uploading info: $error');
    }
  }

  TextEditingController contactnamecontroller = TextEditingController();
  TextEditingController contactnumbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Expanded(
            child: Column(
              children: <Widget>[
                SizedBox(height: 80),
                Text("Novo contato",
                    style: TextStyle(
                        fontSize: 24,
                        color: Color.fromARGB(255, 240, 243, 245))),
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 42, vertical: 40),
                    child: Column(children: [
                      TextField(
                          controller: contactnamecontroller,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFF666A86))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFFF0F3F5)),
                              ),
                              hintText: 'Nome'),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 240, 243, 245))),
                      const SizedBox(height: 40),
                      TextField(
                          controller: contactnumbercontroller,
                          decoration: const InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0XFF666A86))),
                              focusedBorder: UnderlineInputBorder(
                                borderSide:
                                    BorderSide(color: Color(0XFFF0F3F5)),
                              ),
                              hintText: 'Numero'),
                          style: const TextStyle(
                              color: Color.fromARGB(255, 240, 243, 245))),
                      SizedBox(height: 40),
                      Container(
                          width: 200,
                          height: 40,
                          child: FilledButton(
                              style: FilledButton.styleFrom(
                                  backgroundColor: Color(0XFF0D0628),
                                  elevation: 2),
                              onPressed: () => uploadInfo(),
                              child: Text(
                                "Criar",
                                style: TextStyle(
                                  color: Color(0XFFDDD92A),
                                ),
                              )))
                    ]))
              ],
            ),
          ),
        ));
  }
}
