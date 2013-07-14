import 'dart:async';
import 'package:postgresql/postgresql.dart';
import "package:log4dart/log4dart_vm.dart";


class TestController {
  static final _logger = LoggerFactory.getLogger("TestController");

  Future process(String s) {
    var completer = new Completer();
    
    connect("postgres://yankees_reciplete:gagne1@localhost:5432/reciplete").then((conn) {
      _logger.info("Connected to postgres");
      completer.complete("Succesfully connected!");
    });
    
    return completer.future;
  }
}