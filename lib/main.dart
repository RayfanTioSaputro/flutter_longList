import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Widget',
    home: Scaffold(
      appBar: AppBar(
        title: Text("Long List"),
      ),
      body: getLongList(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Working");
        },
        child: Icon(Icons.add),
        tooltip: "Add One More Item",
      ),
    ),
  ));
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("You just tapped $item"),
    action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          debugPrint("Undo Operation");
        }),
  );

  Scaffold.of(context).showSnackBar(snackBar);
}

List<String> getListElements() {
  var items = List<String>.generate(1000, (counter) => "Item $counter");
  return items;
}

Widget getLongList() {
  var listItems = getListElements();

  var longList = ListView.builder(itemBuilder: (context, index) {
    return ListTile(
      leading: Icon(Icons.arrow_right),
      title: Text(listItems[index]),
      onTap: () {
        showSnackBar(context, listItems[index]);
      },
    );
  });

  return longList;
}

