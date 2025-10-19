import 'package:awesome_places/Widget/categories_container.dart';
import 'package:awesome_places/utils/color.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Awesome",
                          style: TextStyle(fontSize: 16, color: mainTextColor),
                        ),
                        Text(
                          "Places",
                          style: TextStyle(
                            fontSize: 40,
                            color: mainTextColor,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage("assets/profilepic.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Text(
                  "Welcome to our travel app, your ultimate guide to discovering captivating destinations around the globe! Whether you're seeking the tranquility of scenic landscapes, the allure of historical landmarks, or the excitement of vibrant cities, our curated collection of places to visit offers something for every traveler.",
                  style: TextStyle(color: mainTextColor, fontSize: 16),
                ),
                SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  height: 250,
                  child: Image(
                    image: NetworkImage(
                      "https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  "Select A Place from the Categories",
                  style: TextStyle(color: mainColor, fontSize: 16),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesContainer(
                      title: "Natural Wonder",
                      boxcolor: fristCategoryColor,
                      cardwidth: 230,
                    ),
                    CategoriesContainer(
                      title: "NightLife",
                      boxcolor: fristCategoryColor,
                      cardwidth: 230,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoriesContainer(
                      title: "Landmarks",
                      boxcolor: secondCategoryColor,
                      cardwidth: 230,
                    ),
                    CategoriesContainer(
                      title: "Cultural",
                      boxcolor: secondCategoryColor,
                      cardwidth: 230,
                    ),
                  ],
                ),
                CategoriesContainer(
                  title: "Book For A Ride Today",
                  boxcolor: thridCategoryColor,
                  cardwidth: 470,
                ),
                SizedBox(height: 25),
                
              ],
            )
          ),
        ),
      ),
    );
  }
}
