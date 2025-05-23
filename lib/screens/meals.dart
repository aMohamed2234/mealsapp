import 'package:flutter/material.dart';
import 'package:mealsapp/model/meals.dart';
import 'package:mealsapp/screens/meal_details.dart';
import 'package:mealsapp/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals});

  final String title;
  final List<Meal> meals;

  void selectMeal(BuildContext context,Meal meal){
    Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealDetailsScreen(meal: meal )));


  }


  @override
  Widget build(BuildContext context) {

    Widget content = ListView.builder(
      itemCount: meals.length,
        itemBuilder: (context, index) => MealItem(meal: meals[index],onSelectMeal: (context, meal) {
          selectMeal(context, meal);
          
        },
        
        
        
        ),



      ) ;

      if (meals.isEmpty){
        content = Center(

          child:  Column(
            mainAxisSize: MainAxisSize.min,
            children: [

               Text(
                'Uh oh... nothing here yet '
                , style: Theme.of(context).textTheme.headlineLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground,)


              ),
              const  SizedBox(

                height:16 ,
              ),

              Text('Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(color:Theme.of(context).colorScheme.onBackground,)),
            ],



          ),


        );






      }
    return Scaffold(
      appBar: AppBar(
        title:  Text(title),
      ),
      body: content ,
    );
  }
}