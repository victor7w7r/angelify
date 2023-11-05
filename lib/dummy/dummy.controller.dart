import 'package:angel3_framework/angel3_framework.dart';

import 'package:angelify/dummy/dummy.service.dart';

@Expose('/test')
class DummyController extends Controller {
  DummyController(this._dummyService);

  final DummyService _dummyService;

  @Expose('/')
  Future<String> routeController(
    final RequestContext req,
    final ResponseContext res,
  ) async =>
      _dummyService.testService();
}
