import 'package:Meal_APP/category_meals_screen.dart';
import 'package:Meal_APP/meal_item.dart';
import 'package:flutter/material.dart';
import 'meal_item.dart';
import 'dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routename = '/category-meals';

  // final String CategoryId;
  // final String categoryTitle;
  //
  // CategoryMealsScreen(this.CategoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            title: categoryMeal[index].title,
            imageUrl: categoryMeal[index].imageUrl,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
