import 'dart:async';
import 'dart:io';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:postgresql/postgresql_pool.dart';
import 'base_controller.dart' as Base;

class UserController extends Base.BaseController  {
 
  /**
   * Oauth login
   */
  Future ouathLogin(HttpRequest request) {
    
  }
  
  /**
   * Return a list of recipies that the user saved
   */
  Future getSavedRecipies(HttpRequest request) {
    
  }
  
  /**
   * Return a list of filters the user used to search for recipies
   */
  Future getSavedSearchFilters(HttpRequest request) {
    
  }
  
}