import 'package:angel3_framework/angel3_framework.dart';

import 'package:file/local.dart' show LocalFileSystem;

import 'package:angelify/common/common.dart' as common;
import 'package:angelify/dummy/dummy.dart' as dummy;

Future<dynamic> configureServer(final Angel app) async {
  final fs = const LocalFileSystem();

  //Modules
  await app.configure(dummy.configureServer);

  //Later common resources
  await app.configure(common.configureServer(fs));
}
