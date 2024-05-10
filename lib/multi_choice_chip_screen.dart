import 'package:flutter/material.dart';

class MultiChoiceChipScreen extends StatefulWidget {
  const MultiChoiceChipScreen({super.key});

  @override
  State<MultiChoiceChipScreen> createState() => _MultiChoiceChipScreenState();
}

class _MultiChoiceChipScreenState extends State<MultiChoiceChipScreen> {
  int? selectedItemId;

  List<Map<String, dynamic>> checkListItems = List.generate(
    10,
    (index) => {'id': index + 1, 'value': false},
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MultiChoiceChip'),
      ),
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(
            checkListItems.length,
            (index) => ChoiceChip(
              selectedColor: Colors.red,
              backgroundColor:
                  selectedItemId != null && index + 1 < selectedItemId!
                      ? Colors.blue
                      : Colors.white,
              label: Text(checkListItems[index]['id'].toString()),
              selected: selectedItemId == checkListItems[index]['id'],
              showCheckmark: false,
              onSelected: (bool value) {
                setState(() {
                  if (value) {
                    selectedItemId = checkListItems[index]['id'];
                  } else {
                    selectedItemId = null;
                  }
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

