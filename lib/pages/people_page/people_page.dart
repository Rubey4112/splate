import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:splate/providers/people_list_provider.dart';
import 'package:splate/pages/core/widgets/person_tile/person_tile.dart';
import 'package:splate/pages/people_page/widgets/color_button.dart';
import 'package:splate/model/person.dart';

class PeoplePage extends StatefulWidget {
  const PeoplePage({super.key});

  static const defaultColors = [
    Color(0xff0061FD),
    Color(0xff982ABC),
    Color(0xffB92D5D),
    Color(0xffFF6A00),
    Color(0xffFFAB01),
    Color(0xffFEFB41),
    Color(0xff76BB40),
  ];

  @override
  State<PeoplePage> createState() => _PeoplePageState();
}

class _PeoplePageState extends State<PeoplePage> {
  final TextEditingController _controller = TextEditingController();
  Color _color = Color(0xff0061FD);

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add People'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pushNamed(context, '/calculation_page'),
            child: Text('Next'),
          ),
        ],
      ),
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
              child: Dismissible(
                key: UniqueKey(),
                direction: DismissDirection.endToStart,
                onDismissed: (direction) {
                  context.read<PeopleListProvider>().removeAt(index);
                },
                background: Container(color: Colors.red),
                child: PersonTile(
                  person: context.watch<PeopleListProvider>().getPerson(index),
                ),
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            Spacer(),
            TextButton(
              onPressed: () => _showAddPeopleBottomSheet(context),
              child: Text("Add People"),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddPeopleBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: SizedBox(
            height: 150,
            child: StatefulBuilder(
              builder: (context, setModalState) => Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: _color,
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: Text(
                          "P1",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              for (Color defaultColor
                                  in PeoplePage.defaultColors)
                                ColorButton(
                                  color: defaultColor,
                                  groupColor: _color,
                                  onChanged: (Color color) {
                                    setModalState(() => _color = color);
                                  },
                                ),
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  autofocus: true,
                                  controller: _controller,
                                  decoration: InputDecoration(
                                    hintText: 'Name',
                                    suffixIcon: IconButton(
                                      onPressed: _controller.clear,
                                      icon: Icon(Icons.clear),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 8.0,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  context.read<PeopleListProvider>().add(
                                    Person(
                                      name: _controller.text.isEmpty
                                          ? "Person ${context.read<PeopleListProvider>().length + 1}"
                                          : _controller.text,
                                      color: _color,
                                    ),
                                  );
                                  _controller.clear();
                                },
                                icon: const Icon(Icons.add),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
