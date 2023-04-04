import 'package:flutter/material.dart';

class Taskcreater extends StatelessWidget {
  final controller;
  VoidCallback saving;
  VoidCallback canceling;
  Taskcreater(
      {Key? key,
      this.controller,
      required this.saving,
      required this.canceling})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.teal[400],
      content: Container(
        padding: EdgeInsets.zero,
        height: 150,
        child: Column(
          children: [
            TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Add a new Task!')),
            SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                onPressed: saving,
                child: Text('Save'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              TextButton(
                onPressed: canceling,
                child: Text('Cancel'),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll<Color>(Colors.white),
                  foregroundColor:
                      MaterialStatePropertyAll<Color>(Colors.black),
                ),
              )
            ])
          ],
        ),
      ),
    );
  }
}
