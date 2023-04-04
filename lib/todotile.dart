import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Todotile extends StatelessWidget {
  final String text;
  final bool checkboxvalue;
  final Function(bool?) changing;
  Function(BuildContext)? deletetask;

  Todotile(
      {Key? key,
      required this.text,
      required this.checkboxvalue,
      required this.changing,
      required this.deletetask})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            // An action can be bigger than the others.
            onPressed: deletetask,
            backgroundColor: Colors.red.shade300,
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Archive',
            borderRadius: BorderRadius.circular(15),
          )
        ]),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.teal,
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              text,
              style: TextStyle(
                decoration: checkboxvalue
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            Checkbox(value: checkboxvalue, onChanged: changing),
          ]),
        ),
      ),
    );
    ;
  }
}
