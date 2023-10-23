import 'dart:async';
import 'package:angel3_framework/angel3_framework.dart';

@Expose('/sales', middleware: [process1])
  class SalesController extends Controller {
      @Expose('/', middleware: [process2])
      Future<String> route1(RequestContext req, ResponseContext res) async {
          return "Sales route";
      }
  }

  bool process1(RequestContext req, ResponseContext res) {
      res.write('Hello, ');
      return true;
  }

  bool process2(RequestContext req, ResponseContext res) {
      res.write('From Sales, ');
      return true;
  }

Future configureServer(Angel app) async {
  app.container.registerSingleton<SalesController>(SalesController());
  await app.mountController<SalesController>();
}
