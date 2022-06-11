import 'dart:async';

import 'package:background_playground/names/name.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

import 'dice/dice.dart';

@CloudFunction()
FutureOr<Response> function(Request request) {
  final router = Router();

  router.get('/', (Request request) {
    return Response.ok('Welcome');
  });

  router.mount('/dice/', Dice().router);

  router.mount('/name/', Name().router);

  return router(request);
}
