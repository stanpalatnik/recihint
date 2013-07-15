import 'dart:io';
import 'dart:async';
import "package:log4dart/log4dart_vm.dart";
import "Controllers/RecipeSearchController.dart";
import 'package:postgresql/postgresql_pool.dart';
import "Controllers/RecipeController.dart";

class Router {
  static final _logger = LoggerFactory.getLoggerFor(Router);
  Map config;
  Pool pool;
   
  Router(this.config, this.pool);
  
  Future route(HttpRequest request) {
    String path = request.uri.path;
    if(path.startsWith("/recipe/id")) {
      var recipeController = new RecipeController();
      return recipeController.getRecipeById(request.uri, config, pool);  
    }
    else if(path.startsWith("/recipe/list")) {
      var recipeController = new RecipeController();
      return recipeController.listRecipies(request.uri, config, pool);  
    }
    else if(path.startsWith("/recipe/search")) {
      var recipeSearchController = new RecipeSearchController();
      return recipeSearchController.searchRecipe(request.uri, config, pool);  
    }
    else {
      return new Future.value("Path not found");
    }
  }
}