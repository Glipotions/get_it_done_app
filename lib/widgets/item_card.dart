import 'package:flutter/material.dart';

class ItemCard extends StatefulWidget {
  final String? title;
  final bool isDone;
  final Function? toggleStatus;
  final Function deleteItem;
  ItemCard(
      {this.title,
      required this.isDone,
      this.toggleStatus,
      required this.deleteItem});

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      onDismissed: (_) {
        setState(() {
          widget.deleteItem;
        });
      },
      key: Key(widget.title!),
      child: Card(
        elevation: widget.isDone ? 1 : 5,
        shadowColor: Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: ListTile(
          title: Text(
            widget.title!,
            style: const TextStyle(color: Colors.black),
          ),
          trailing: Checkbox(
            onChanged: (_) {
              setState(() {
                widget.toggleStatus;
              });
            },
            value: widget.isDone,
            activeColor: Colors.green,
          ),
        ),
      ),
    );
  }
}
