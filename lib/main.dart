import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:ultimate_quran/collect_info/init.dart';

import 'theme/theme_controller.dart';
import 'theme/theme_icon_button.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox("info");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Al-Quran',
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      onInit: () async {
        final appTheme = Get.put(AppThemeData());
        appTheme.initTheme();
      },
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Al Quran"),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Row(
                      children: [const Spacer(), themeIconButton],
                    )
                  ],
                )),
          ],
        ),
      ),
      body: const InIt(),
    );
  }
}