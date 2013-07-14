import 'dart:io';
import 'dart:async';
import "package:log4dart/log4dart_vm.dart";
import "Controllers/RecipeSearchController.dart";
import "Controllers/RecipeController.dart";

class Router {
  static final _logger = LoggerFactory.getLoggerFor(Router);
  
  Future route(HttpRequest request) {
    String path = request.uri.path;
    if(path.startsWith("/recipe/id")) {
      var recipeController = new RecipeController();
      return recipeController.getRecipeById(request.uri);  
    }
    else if(path.startsWith("/recipe/list")) {
      var recipeController = new RecipeController();
      return recipeController.listRecipies(request.uri);  
    }
    else if(path.startsWith("/recipe/search")) {
      var recipeSearchController = new RecipeSearchController();
      return recipeSearchController.searchRecipe(request.uri);  
    }
    else {
      return new Future.value("Path not found");
    }
  }
}