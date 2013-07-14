import 'dart:async';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";


class RecipeSearchController {
  static final _logger = LoggerFactory.getLogger("TestController");

  Future searchRecipe(Uri uri, String dbstr) {
    var completer = new Completer();
    
    connect(dbstr).then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}