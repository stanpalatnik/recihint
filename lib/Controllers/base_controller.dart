import 'dart:io';
import 'dart:async';
import 'dart:json' as json;
import 'package:postgresql/postgresql.dart';
import 'package:postgresql/postgresql_pool.dart';

/**
 * Base class that all controllers should extend. 
 */
class BaseController {
  Pool pool;
  Map config;
}