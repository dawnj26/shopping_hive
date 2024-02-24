import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:quinto_assignment3/box/shoppingBox.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final itemController = TextEditingController();

  void deleteItem() {
    setState(() {
      // get the keys of the items first
      var items = shoppingBox.keys.toList();

      // loop through the keys and delete the items that are checked
      for (var key in items) {
        var item = shoppingBox.get(key);
        if (item['isChecked']) {
          shoppingBox.delete(key);
        }
      }
    });
  }

  void addItem() {
    setState(() {
      shoppingBox.add({
        'name': itemController.text,
        'isChecked': false,
      });
      itemController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Hive'),
        actions: [
          IconButton(
            onPressed: deleteItem,
            icon: const Icon(Icons.delete_forever),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: itemController,
              decoration: const InputDecoration(
                labelText: 'Enter Item',
                border: OutlineInputBorder(),
              ),
            ),
            const Gap(12.0),
            ElevatedButton(
              onPressed: addItem,
              child: const Text('Add Item'),
            ),
            const Gap(12.0),
            Expanded(
              child: ListView.builder(
                itemCount: shoppingBox.length,
                itemBuilder: (context, index) {
                  // get the item at the index
                  var item = shoppingBox.getAt(index);

                  return Card(
                    child: ListTile(
                      title: Text(
                        item['name'],
                        style: TextStyle(
                          decoration: item['isChecked']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
                      trailing: Checkbox(
                        value: item['isChecked'],
                        onChanged: (value) {
                          setState(() {
                            // update the item
                            shoppingBox.putAt(index, {
                              'name': item['name'],
                              'isChecked': value!,
                            });
                          });
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
