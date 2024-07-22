import 'package:doctors_app/core/di/dependancy_injection.dart';
import 'package:doctors_app/core/routing/app_router.dart';
import 'package:doctors_app/doc_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  SetupGetIt();

  /// To fix .sp font error in release Mode

  await ScreenUtil.ensureScreenSize();
  runApp(DocApp(
    appRouter: AppRouter(),
  ));
}
