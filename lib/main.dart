import 'package:doctors_app/core/di/dependancy_injection.dart';
import 'package:doctors_app/core/routing/app_router.dart';
import 'package:doctors_app/doc_app.dart';
import 'package:flutter/material.dart';

void main() {
  SetupGetIt();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
