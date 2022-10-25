import 'package:flutter/material.dart';
import 'package:shoppinglist/models/item_model.dart';
import 'package:shoppinglist/widgets/add_item_button.dart';
import 'package:shoppinglist/widgets/item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ItemModel> shoppingList = [];

  TextEditingController itemCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();
  TextEditingController qntyCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: Text('Shopping List', style: TextStyle(color: Colors.black)),
        ),
        body: ListView.separated(
          itemBuilder: (context, index) {
            return Item(
              item: shoppingList[index],
              onChanged: (x) {
                setState(() {
                  shoppingList[index].isBought = !shoppingList[index].isBought;
                });
              },
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(height: 2);
          },
          itemCount: shoppingList.length,
        ),
        bottomNavigationBar: GestureDetector(
            onTap: () {
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Container(
                    //height: 200,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              controller: itemCtrl,
                              decoration:
                                  InputDecoration(hintText: 'Enter Item Name'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              controller: qntyCtrl,
                              decoration:
                                  InputDecoration(hintText: 'Enter Quantity'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: TextField(
                              controller: priceCtrl,
                              // keyboardType: TextInputType.number,
                              decoration:
                                  InputDecoration(hintText: 'Enter Price'),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              final item = ItemModel(
                                  itemCtrl.text,
                                  int.parse(qntyCtrl.text),
                                  double.parse(priceCtrl.text),
                                  false);

                              setState(() {
                                shoppingList.add(item);
                              });
                              itemCtrl.clear();
                              qntyCtrl.clear();
                              priceCtrl.clear();

                              Navigator.pop(context);
                            },
                            child: AddItemButton(
                              title: 'Save',
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: AddItemButton(
              title: 'Add an Item',
            )));
  }
}
