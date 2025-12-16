import 'package:flutter/material.dart';
//import 'package:g1/GROCERIES/0%20-%20Start%20Code/models/grocery.dart';
import '../../data/mock_grocery_repository.dart';
import '../../models/grocery.dart';
import '../../ui/groceries/grocery_form.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<Grocery> _items = [
    ...dummyGroceryItems,
  ];

  Future<void> onCreate() async {
    // TODO-4 - Navigate to the form screen using the Navigator push 
    final newItem = await Navigator.of(context).push<Grocery> (
      MaterialPageRoute(builder: (context) => const NewItem(),)
    );
    
    if (newItem != null) {
      setState(() {
        dummyGroceryItems.add(newItem);
      }); 

    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {

       // TODO-1 - Display groceries with an Item builder and  LIst Tile
      //content = const Text('TODO');
        content = ListView.builder(
          itemCount: dummyGroceryItems.length,
          itemBuilder: (ctx, index) => GroceryTile(grocery: dummyGroceryItems[index]), 

        )
      ;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: onCreate,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

class GroceryTile extends StatelessWidget {
  const GroceryTile({super.key, required this.grocery});

  final Grocery grocery;

  @override
  Widget build(BuildContext context) {
      // TODO-2 - Display groceries with an Item builder and  LIst Tile
      return ListTile(   //list tile widget for each grocery item 
        title: Text(grocery.name),
        leading: Container( 
          width: 15,
          height: 15,
          color: grocery.category.color,
          
        )
      );
  }
}

