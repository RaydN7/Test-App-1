import 'package:first/home_page.dart';
import 'package:first/profile_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Myapp()); // runApp runs the application
}

class Myapp extends StatelessWidget {
  //Stateless Widget: The widgets whose state can not be altered once they are built
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //debug tag removed
      theme: ThemeData(primarySwatch: Colors.green),
      // MaterialApp is widget, home is argument
      home: const RootPage(), //MaterialApp is for accessing color themes in app
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0; // variable created
  List<Widget> pages = const [Homepage(), ProfilePage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter'), // text on the appbar
      ), //bar appearing on top of screen

      body: pages[currentPage], // currentPage takes 0 or 1 value

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint('Floating Action Button');
        },
        child: const Icon(Icons.add), //inside widget
      ),
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          // on clicking home and profile icons
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex:
            currentPage, // clicks and select occur on icons home and profile
      ),
    );
  }
}
