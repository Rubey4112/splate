import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splate/providers/people_list_provider.dart';
import 'package:splate/pages/core/widgets/person_tile/person_tile.dart';
import 'package:splate/pages/calculation_page/widgets/food_draggable.dart';
import 'package:splate/model/food.dart';
import 'package:splate/pages/calculation_page/widgets/keypad.dart';
import 'package:splate/model/person.dart';

class CalculationPage extends StatefulWidget {
  const CalculationPage({super.key});

  @override
  State<CalculationPage> createState() => _CalculationPageState();
}

class _CalculationPageState extends State<CalculationPage> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enter bill items')),
      body: ListView.builder(
        itemCount: context.watch<PeopleListProvider>().length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: DragTarget<Food>(
                onAcceptWithDetails: (details) {
                  _itemDroppedOnPeople(
                    food: details.data,
                    person: context.read<PeopleListProvider>().getPerson(index),
                  );
                },
                builder: (context, candidateItems, rejectedItems) {
                  return PersonTile(
                    person: context.watch<PeopleListProvider>().getPerson(
                      index,
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
      bottomSheet: _ItemsAddBottomSheet(),
      /* bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            TextButton(onPressed: () {}, child: Text("Add Items")),
          ],
        ),
      ), */
    );
  }

  void _itemDroppedOnPeople({required Food food, required Person person}) {
    setState(() {
      person.foods.add(food);
    });
  }
}

class _ItemsAddBottomSheet extends StatelessWidget {
  const _ItemsAddBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      color: Color.fromARGB(255, 186, 199, 217),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              FoodDraggable(food: Food(icon: '🍔', cost: 10)),
              Placeholder(fallbackHeight: 160, fallbackWidth: 135),
            ],
          ),
          Keypad(),
        ],
      ),
    );
  }

  // Handle key press events from the on-screen keypad
}
