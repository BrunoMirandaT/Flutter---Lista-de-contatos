import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactGenerator extends Notifier<List<String>> {
  @override
  List<String> build() {
    // TODO: implement build
    return [];
  }


  void addString(String folder_name) {
    state = [...state, folder_name];
  }
}

class NoteGenerator extends Notifier<List<String>> {
  @override
  List<String> build() {
    // TODO: implement build
    return [];
  }


  void addString(String note_name) {
    state = [...state, note_name];
  }
}

var strNotifierProviderFolder =
    NotifierProvider<ContactGenerator, List<String>>(ContactGenerator.new);

var strNotifierProviderNote =
    NotifierProvider<NoteGenerator, List<String>>(NoteGenerator.new);
    
