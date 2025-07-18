import 'package:flutter/material.dart';
import 'package:splate/person.dart';
import 'package:splate/colorbutton.dart';

void main() {
  runApp(SplateApp());
}

class SplateApp extends StatelessWidget {
  const SplateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splate',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: PeoplePage(),
    );
  }
}

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
  Color _color = Colors.blue;

  final List _persons = <Person>[];

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _persons.length,
        itemBuilder: (context, index) => _persons[index],
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
            child: Row(
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
                            for (Color defaultColor in PeoplePage.defaultColors)
                              ColorButton(
                                color: defaultColor,
                                groupColor: _color,
                                onChanged: (Color color) {
                                  setState(() {
                                    _color = color;
                                  });
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _persons.add(
                                    Person(
                                      name: _controller.text,
                                      color: _color,
                                    ),
                                  );
                                });
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
        );
      },
    );
  }
}
