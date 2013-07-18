import 'dart:async';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";
import 'package:postgresql/postgresql_pool.dart';

class UserController {
 
  /**
   * Oauth login
   */
  Future ouathLogin(Uri uri, Map config, Pool pool) {
    
  }
  
  /**
   * Return a list of recipies that the user saved
   */
  Future getSavedRecipies(Uri uri, Map config, Pool pool) {
    
  }
  
  /**
   * Return a list of filters the user used to search for recipies
   */
  Future getSavedSearchFilters(Uri uri, Map config, Pool pool) {
    
  }
  
}