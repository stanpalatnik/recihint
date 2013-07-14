import 'dart:io';
import 'dart:async';
import "package:log4dart/log4dart_vm.dart";
import "Controllers/TestController.dart";

class Router {
  static final _logger = LoggerFactory.getLoggerFor(Router);
  
  Future route(HttpRequest request) {
    var testController = new TestController();
    return testController.process(request.uri.path);
  }
}