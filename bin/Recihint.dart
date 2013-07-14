import 'dart:io';
import 'dart:async';
import "package:log4dart/log4dart_vm.dart";
import 'package:dart_config/default_server.dart';
import "Router.dart";

void main() {
  final logger = LoggerFactory.getLogger("Main");
  
  loadConfig().then(
      (Map config) {
        HttpServer.bind('127.0.0.1', config["dev_port"]).then((server) {
          logger.info("Started HTTP server");
          
          Router router = new Router(config);
          server.listen((HttpRequest request) {
            Future responseFuture = router.route(request);
            responseFuture.then((data) {
              request.response.write(data);
              request.response.close();  
            }).catchError(
                (e) => logger.error(e));
          });
        });  
      });
}
