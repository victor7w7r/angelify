import 'package:angel3_framework/angel3_framework.dart' show AngelConfigurer;
import 'package:angel3_configuration/angel3_configuration.dart'
    show configuration;
import 'package:angel3_static/angel3_static.dart' show VirtualDirectory;

import 'package:file/file.dart';

import 'package:angelify/common/plugins/plugins.dart' as plugins;

AngelConfigurer configureServer(final FileSystem fileSystem) =>
    (final app) async {
      await app.configure(configuration(fileSystem));
      await plugins.configureServer(app);
      if (!app.environment.isProduction) {
        final vDir = VirtualDirectory(
          app,
          fileSystem,
          source: fileSystem.directory('web'),
        );
        app.fallback(vDir.handleRequest);
      }
    };
