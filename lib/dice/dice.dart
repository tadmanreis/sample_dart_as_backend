import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';

part 'dice.g.dart';

class Dice {
  @Route.get('/roll/<faces>')
  FutureOr<Response> getRoll(Request request, String faces) async {
    try {
      var number = Random().nextInt(int.parse(faces));
      var response = {"number": number};
      return Response.ok(jsonEncode(response));
    } catch (e) {
      return Response.badRequest();
    }
  }

  Router get router => _$DiceRouter(this);
}
