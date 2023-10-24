import 'dart:async' show unawaited;

import 'package:angel3_container/mirrors.dart';
import 'package:angel3_production/angel3_production.dart';

import 'package:angelify/angelify.dart';

void main(final List<String> args) =>
    unawaited(Runner('Angelify', configureServer, reflector: MirrorsReflector())
        .run(args));
