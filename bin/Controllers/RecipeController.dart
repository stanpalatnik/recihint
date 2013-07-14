import 'dart:async';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";

class RecipeController {
  static final _logger = LoggerFactory.getLogger("RecipeController");
  
  Future getRecipeById(Uri uri) {
    var completer = new Completer();
    
    connect("postgres://yankees_reciplete:gagne1@localhost:5432/reciplete").then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  Future getRecipeByName(Uri uri) {
    var completer = new Completer();
    
    connect("postgres://yankees_reciplete:gagne1@localhost:5432/reciplete").then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies based on score 
   */
  Future listRecipies(Uri uri) {
    var completer = new Completer();
    
    connect("postgres://yankees_reciplete:gagne1@localhost:5432/reciplete").then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies by category based on score 
   */
  Future listRecipiesByCategory(Uri uri) {
    var completer = new Completer();
    
    connect("postgres://yankees_reciplete:gagne1@localhost:5432/reciplete").then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}