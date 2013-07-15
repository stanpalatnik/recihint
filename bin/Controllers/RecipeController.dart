import 'dart:async';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:postgresql/postgresql_pool.dart';

class RecipeController {
  static final _logger = LoggerFactory.getLogger("RecipeController");
  
  Future getRecipeById(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  Future getRecipeByName(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies based on score 
   */
  Future listRecipies(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies by category based on score 
   */
  Future listRecipiesByCategory(Uri uri, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}