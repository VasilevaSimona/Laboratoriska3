import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Item> gridItems = [
    Item(title: 'Data Science', text: '08.02.2024 13:00'),
    Item(title: 'Database', text: '17.01.2023 17:00'),
    Item(title: 'Statistics', text: '09.01.2024 13:30'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exams Schedule'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              showAddItemDialog();
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.0,
          mainAxisSpacing: 10.0,
        ),
        itemCount: gridItems.length,
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1.0),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: GridTile(
              child: Container(
                color: Colors.white38,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      gridItems[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      gridItems[index].text,
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 19.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void showAddItemDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String title = '';
        String text = '';

        return AlertDialog(
          title: Text('Add new exam'),
          content: Column(
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Subject'),
                onChanged: (value) {
                  title = value;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Date and time'),
                onChanged: (value) {
                  text = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addNewItem(title, text);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

  void addNewItem(String title, String text) {
    setState(() {

      gridItems.add(Item(title: title, text: text));
    });
  }
}

class Item {
  final String title;
  final String text;

  Item({required this.title, required this.text});
}
