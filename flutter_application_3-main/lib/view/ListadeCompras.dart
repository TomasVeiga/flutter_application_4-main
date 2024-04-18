// ignore_for_file: library_private_types_in_public_api, file_names

import 'package:flutter/material.dart';

 
class ShoppingList {
  String name;
  final List<String> items;
  final List<bool> itemStatus;

  ShoppingList({this.name = '', required this.items})
      : itemStatus = List.generate(items.length, (index) => false);
}
 
class ShoppingListsScreen extends StatefulWidget {
  const ShoppingListsScreen({super.key});

  @override
  _ShoppingListsScreenState createState() => _ShoppingListsScreenState();
}
 
class _ShoppingListsScreenState extends State<ShoppingListsScreen> {
  final List<ShoppingList> shoppingLists = [];
 
  void _createShoppingList(String name) {
    setState(() {
      shoppingLists.add(ShoppingList(name: name, items: []));
    });
  }
 
  void _addItem(int listIndex, String item) {
    setState(() {
      shoppingLists[listIndex].items.add(item);
      shoppingLists[listIndex].itemStatus.add(false);
    });
  }
 
  void _toggleItemStatus(int listIndex, int itemIndex) {
    setState(() {
      shoppingLists[listIndex].itemStatus[itemIndex] =
          !shoppingLists[listIndex].itemStatus[itemIndex];
    });
  }

  void _deleteShoppingList(int index) {
  setState(() {
    shoppingLists.removeAt(index);
  });
}

  void _editShoppingList(BuildContext context, int index) {
  showDialog(
    context: context,
    builder: (context) {
      String newName = shoppingLists[index].name;
      return AlertDialog(
        title: const Text('Editar lista de compras'),
        content: TextField(
          decoration: const InputDecoration(
            hintText: 'Novo nome da lista',
          ),
          onChanged: (value) {
            newName = value;
          },
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                shoppingLists[index].name = newName;
              });
              Navigator.pop(context);
            },
            child: const Text('Salvar'),
          ),
        ],
      );
    },
  );
}

  void _deleteItem(int listIndex, int itemIndex) {
  setState(() {
    shoppingLists[listIndex].items.removeAt(itemIndex);
    shoppingLists[listIndex].itemStatus.removeAt(itemIndex);
  });
}
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Compras'),
      ),
      body: ListView.builder(
  itemCount: shoppingLists.length,
  itemBuilder: (context, index) {
    final shoppingList = shoppingLists[index];
    return ExpansionTile(
      title: Row(
        children: [
          Expanded(
            child: Text(shoppingList.name),
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              _editShoppingList(context, index);
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _deleteShoppingList(index);
            },
          ),
        ],
      ),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var i = 0; i < shoppingList.items.length; i++)
                ListTile(
                  title: Text(shoppingList.items[i]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          _deleteItem(index, i);
                        },
                      ),
                      Checkbox(
                        value: shoppingList.itemStatus[i],
                        onChanged: (newValue) {
                          _toggleItemStatus(index, i);
                        },
                      ),
                    ],
                  ),
                ),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Adicione um item',
                ),
                onSubmitted: (value) {
                  _addItem(index, value);
                },
              ),
            ],
          ),
        ),
      ],
    );
  },
),

floatingActionButton: FloatingActionButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Criar nova lista de compras'),
          content: TextField(
            decoration: const InputDecoration(
              hintText: 'Nome da lista',
            ),
            onSubmitted: (value) {
              _createShoppingList(value);
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  },
  child: const Icon(Icons.add),
),
    );
  }
}