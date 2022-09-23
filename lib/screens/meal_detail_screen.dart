import 'package:flutter/material.dart';

import '../dummy_data.dart';

Widget buildSectionTitle({BuildContext context, String text}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Text(
      text,
      style: Theme.of(context).textTheme.caption,
    ),
  );
}

Widget buildContainer({BuildContext context, Widget child}) {
  return Container(
    height: 150,
    width: 300,
    margin: EdgeInsets.all(5),
    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 5),
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(
        color: Colors.grey,
        width: 2,
      ),
      borderRadius: BorderRadius.circular(10),
    ),
    child: child,
  );
}

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-detail";

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(((meal) => meal.id == mealId));
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context: context, text: "Ingredients"),
            buildContainer(
              context: context,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 5,
                    ),
                    child: Text(selectedMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context: context, text: "Steps"),
            buildContainer(
                context: context,
                child: ListView.builder(
                  itemBuilder: ((ctx, index) => Column(
                        children: [
                          ListTile(
                            leading: CircleAvatar(
                              radius: 18,
                              child: Text("#${index + 1}"),
                            ),
                            title: Text(selectedMeal.steps[index]),
                          ),
                          Divider(
                            thickness: 0.5,
                          ),
                        ],
                      )),
                  itemCount: selectedMeal.steps.length,
                ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.delete),
        onPressed: () {
          Navigator.of(context).pop(mealId);
        },
      ),
    );
  }
}
