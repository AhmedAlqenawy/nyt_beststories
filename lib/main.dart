import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil_init.dart';
 import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nyt_beststories/views/Articls/Aricle-view.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(411, 877),
        allowFontScaling: true,
        builder: () => MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'NYT Bestt Stories',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: ArticlePage(),
            ));
  }
}
