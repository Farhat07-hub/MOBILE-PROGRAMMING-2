import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_application_2/page/beranda_page.dart';
import 'package:flutter_application_2/page/profile_page.dart';

void main() {
  runApp(const MyApp());
}

ValueNotifier<int> pageIndexNotifier = ValueNotifier<int>(0);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // List halaman dipusatkan di sini
  final List<Widget> _pages = [
    const BerandaPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ValueListenableBuilder(
        valueListenable: pageIndexNotifier,
        builder: (context, value, _) {
          return Scaffold(
            body: _pages[value], // pakai _pages kamu

            bottomNavigationBar: SalomonBottomBar(
              currentIndex: value,
              onTap: (i) {
                pageIndexNotifier.value = i;
              },
              items: [
                SalomonBottomBarItem(
                  icon: const Icon(Icons.home),
                  title: const Text("Beranda"),
                  selectedColor: Colors.purple,
                ),
                SalomonBottomBarItem(
                  icon: const Icon(Icons.person),
                  title: const Text("Profile"),
                  selectedColor: Colors.purple,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}