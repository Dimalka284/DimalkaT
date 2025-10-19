import 'package:flutter/material.dart';

class CategoryButtonDemo extends StatefulWidget {
  @override
  _CategoryButtonDemoState createState() => _CategoryButtonDemoState();
}

class _CategoryButtonDemoState extends State<CategoryButtonDemo> {
  bool isSelected = false; // track state

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("AnimatedContainer Example")),
      body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected; // toggle state on tap
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 500), // animation speed
            curve: Curves.easeInOut, // animation curve
            width: isSelected ? 120 : 100, // changes smoothly
            height: 50,
            decoration: BoxDecoration(
              color: isSelected ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(isSelected ? 30 : 10),
            ),
            child: Center(
              child: Text(
                "T-Shirts",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
