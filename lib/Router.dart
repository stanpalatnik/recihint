import 'dart:io';
import 'dart:async';
import "package:log4dart/log4dart_vm.dart";
import "Controllers/recipe_search_controller.dart";
import 'package:postgresql/postgresql_pool.dart';
import "Controllers/recipe_controller.dart";

class Router {
  static final _logger = LoggerFactory.getLoggerFor(Router);
  Map config;
  Pool pool;
   
  Router(this.config, this.pool);
  
  Future route(HttpRequest request) {
    String path = request.uri.path;
    if(path.startsWith("/recipe/id")) {
      var recipeController = new RecipeController(pool, config);
      return recipeController.getRecipeById(request);  
    }
    else if(path.startsWith("/recipe/list")) {
      var recipeController = new RecipeController(pool, config);
      return recipeController.listRecipies(request);  
    }
    else if(path.startsWith("/recipe/search")) {
      var recipeSearchController = new RecipeSearchController(pool, config);
      return recipeSearchController.searchRecipe(request);  
    }
    else {
      return new Future.value("Path not found");
    }
  }
}