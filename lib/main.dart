// import 'package:awesome_places/Pages/home_page.dart';
import 'package:awesome_places/Pages/animation_page.dart';
import 'package:awesome_places/Pages/home_page.dart';
import 'package:awesome_places/Pages/user_data_page.dart';
// import 'package:awesome_places/Widget/animation_container.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex = 0;
  final List<Widget> _pages = [HeroImageSlider(), HomePage(), UserDataPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Page 1")),
      body: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.image), label: "Image"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Settings",
            ),
          ],
        ),
        body: _pages[_currentIndex],
      ),
    );
  }
}

Route<void> _createRoute(Widget Page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => Page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // 1. Slide Animation Logic
      // Slide from bottom-center (0.5 is half the screen width, 1.0 is full screen height)
      const begin = Offset(
        0,
        1.0,
      ); // Starts one full screen height below (0.0 means centered horizontally)
      const end = Offset.zero; // Ends at its final, normal position (top-left)
      const curve =
          Curves.elasticInOut; //Start slowly speed up(middle) slow down(end)

      // Define the path and timing for the slide
      final tween = Tween(
        begin: begin,
        end: end,
      ).chain(CurveTween(curve: curve));

      // Apply the path/timing to the primary animation to get the final position
      final offsetAnimation = animation.drive(tween);

      // 2. Return ONLY the SlideTransition
      // The child (HomePage) will move according to offsetAnimation
      return SlideTransition(
        position: offsetAnimation,
        child: child, // The HomePage is the child
      );
    },
  );
}
