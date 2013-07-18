import 'dart:async';
import 'dart:io';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:postgresql/postgresql_pool.dart';
import 'base_controller.dart' as Base;


class RecipeSearchController extends Base.BaseController {
  static final _logger = LoggerFactory.getLogger("TestController");

  Future searchRecipe(HttpRequest request) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}