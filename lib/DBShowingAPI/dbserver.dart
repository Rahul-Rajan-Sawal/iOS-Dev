import 'dart:io';
import 'package:flutter_application_1/database/database_helper.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as io;
import 'package:shelf_router/shelf_router.dart';

class DebugDbServer {
  static void start() async {
    final router = Router();

    router.get('/users', (Request request) async {
      final db = await DatabaseHelper.instance.database;
      final data = await db.query('LMSLeadActivityTracker');
      return Response.ok(data.toString());
    });

    final server = await io.serve(router, 'localhost', 8080);
    print('DB Debug Server running at http://localhost:8080');
  }
}
