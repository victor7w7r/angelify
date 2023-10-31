import 'package:angel3_cors/angel3_cors.dart' show cors;
import 'package:angel3_framework/angel3_framework.dart';

import 'package:file/local.dart' show LocalFileSystem;

import 'package:angelify/common/common.dart' as common;
import 'package:angelify/dummy/dummy.dart' as dummy;

Future<dynamic> configureServer(final Angel app) async {
  final fs = const LocalFileSystem();

  app.fallback(cors());

  //Modules
  await app.configure(dummy.configureServer);

  //Later common resources
  await app.configure(common.configureServer(fs));

  app
    ..fallback((final req, final res) => throw AngelHttpException.notFound())
    ..errorHandler =
        (final e, final req, final res) => res.json({'error': e.message});
}
