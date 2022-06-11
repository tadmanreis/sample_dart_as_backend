import 'dart:convert';
import 'dart:io';
import 'dart:math';

class NamesLocalData {
  List<String>? _names;

  Future<void> init() async {
    var jsonAsString = await File('assets/names.json').readAsString();
    var json = jsonDecode(jsonAsString);
    _names = List<String>.from(json);
  }

  Future<List<String>> filterBy(String filter) async {
    if (_names == null) {
      await init();
    }
    return _names!.where((f) {
      var name = f.toLowerCase();
      filter = filter.toLowerCase();
      return name.startsWith(filter);
    }).toList();
  }

  Future<String> randomName() async {
    if (_names == null) {
      await init();
    }
    var index = Random().nextInt(_names!.length);
    return _names![index];
  }
}
