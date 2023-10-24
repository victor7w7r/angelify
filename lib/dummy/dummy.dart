import 'package:angel3_framework/angel3_framework.dart' show Angel;

import 'package:angelify/dummy/dummy.controller.dart';
import 'package:angelify/dummy/dummy.service.dart';

Future<dynamic> configureServer(final Angel app) async {
  app.container.registerSingleton(DummyService());
  await app.mountController<DummyController>();
}
