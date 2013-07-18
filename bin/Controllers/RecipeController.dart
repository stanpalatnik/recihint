import 'dart:io';
import 'dart:async';
import 'dart:json' as json;
import 'package:postgresql/postgresql.dart';
import 'package:postgresql/postgresql_pool.dart';
import '../Models/Recipe.dart';

class RecipeController {
  
  Future getRecipeById(HttpRequest request, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      String query = """SELECT id, \"name\", rating, \"totalTime\", thumbnail, calories, \"ingredientsList\", 
          yield, websitename, serving, recipeurl FROM reciplete.\"Recipe\" where id = @id;""";
      conn.query(query, {'id': request.uri.queryParameters['id']})
      .toList().then((list) { 
        completer.complete(json.stringify(
            list.map((row) => 
                new Recipe(row.id, row.name, row.rating, row.totalTime, row.thumbnail, row.calories, 
                    row.ingredientsList, row.yield, row.serving, row.websitename, row.recipeurl)).toList(growable: false)
        ));
      }); 
    });   
    return completer.future;
  }
  
  Future getRecipeByName(HttpRequest request, Map config, Pool pool) {
var completer = new Completer();
    
    pool.connect().then((conn) {
      String query = """SELECT id, \"name\", rating, \"totalTime\", thumbnail, calories, \"ingredientsList\", 
          yield, websitename, serving, recipeurl FROM reciplete.\"Recipe\" where name = @name;""";
      conn.query(query, {'id': request.uri.queryParameters['name']})
      .toList().then((list) { 
        completer.complete(json.stringify(
            list.map((row) => 
                new Recipe(row.id, row.name, row.rating, row.totalTime, row.thumbnail, row.calories, 
                    row.ingredientsList, row.yield, row.serving, row.websitename, row.recipeurl)).toList(growable: false)
        ));
      }); 
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies based on score 
   */
  Future listRecipies(HttpRequest request, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
  
  /**
   * Return the top 100 recipies by category based on score 
   */
  Future listRecipiesByCategory(HttpRequest request, Map config, Pool pool) {
    var completer = new Completer();
    
    pool.connect().then((conn) {
      
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}