// ignore_for_file: depend_on_referenced_packages
import 'dart:io' show Directory;

import 'package:angel3_container/mirrors.dart' show MirrorsReflector;
import 'package:angel3_framework/angel3_framework.dart' show Angel;
import 'package:angel3_hot/angel3_hot.dart' show HotReloader;

import 'package:logging/logging.dart';
import 'package:belatuk_pretty_logging/belatuk_pretty_logging.dart'
    show prettyLog;

import 'package:angelify/angelify.dart';

void main() async {
  hierarchicalLoggingEnabled = true;
  final hot = HotReloader(() async {
    final logger = Logger.detached('Angel3')
      ..level = Level.ALL
      ..onRecord.listen(prettyLog);
    final app = Angel(logger: logger, reflector: MirrorsReflector());
    await app.configure(configureServer);
    return app;
  }, [Directory('config'), Directory('lib')]);

  final server = await hot.startServer('127.0.0.1', 3000);
  print('Server listening at http://${server.address.address}:${server.port}');
}
