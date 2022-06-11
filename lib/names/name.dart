import 'dart:async';
import 'dart:convert';

import 'package:background_playground/names/names_local_data.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
part 'name.g.dart';

class Name {
  final NamesLocalData localData = NamesLocalData();

  Name();

  @Route.get('/generate')
  FutureOr<Response> getGenerateName(Request request) async {
    try {
      String name = await localData.randomName();
      var map = {"name": name};
      return Response.ok(jsonEncode(map));
    } catch (e) {
      return Response.internalServerError();
    }
  }

  @Route.get('/filter/<filter>')
  FutureOr<Response> getFilteredName(Request request, String filter) async {
    try {
      var names = await localData.filterBy(filter);
      var map = {"names": names};
      return Response.ok(jsonEncode(map));
    } catch (e) {
      return Response.internalServerError();
    }
  }

  Router get router => _$NameRouter(this);
}
