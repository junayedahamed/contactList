import 'package:flutter/material.dart';
import 'package:myapp/src/BLoC_Db/logic.dart';
import 'package:myapp/src/Widget/Home/home_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
        listenable: ToggleSwitch.instance,
        builder: (context, snapshot) {
          return MaterialApp(
            title: "First App",
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
              useMaterial3: true,
            ),
            darkTheme: ThemeData.dark(),
            themeMode: ToggleSwitch.instance.themeMode,
            debugShowCheckedModeBanner: false,
            home: HomePage(),
          );
        });
  }
}
