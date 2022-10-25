import 'package:flutter/material.dart';
import 'package:shoppinglist/models/item_model.dart';

class Item extends StatelessWidget {
  const Item({
    Key? key,
    required this.item,
    required this.onChanged,
  }) : super(key: key);

  final ItemModel item;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        checkColor: Colors.white,
        value: item.isBought,
        onChanged: onChanged,
      ),
      title: Text(item.name,
          style: TextStyle(
              decoration: item.isBought
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 18)),
      subtitle: Text('x ${item.quantity}',
          style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16)),
      trailing: Text('\$${item.price}',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }
}
