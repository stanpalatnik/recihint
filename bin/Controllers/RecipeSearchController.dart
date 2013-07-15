import 'dart:async';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:postgresql/postgresql_pool.dart';


class RecipeSearchController {
  static final _logger = LoggerFactory.getLogger("TestController");

  Future searchRecipe(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}