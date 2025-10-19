import 'package:flutter/cupertino.dart';

class CategoriesContainer extends StatelessWidget {
  final String title;
  final Color boxcolor;
  final double cardwidth;
  const CategoriesContainer({
    super.key,
    required this.title,
    required this.boxcolor,
    required this.cardwidth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: cardwidth,
      height: 150,
      margin: EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: boxcolor,
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
