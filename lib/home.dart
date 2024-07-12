import 'package:flutter/material.dart';
import 'item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double _sum = 0.0;
  bool _showSelected = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation == Orientation.landscape)
      screenWidth = screenWidth * 0.8;

    return Scaffold(
        appBar: AppBar(
          title: Text('Total Price: \$$_sum'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          actions: [
            IconButton(
                onPressed: () {
                  if (_sum != 0) {
                    setState(() {
                      _showSelected = !_showSelected;
                    });
                  }
                },
                icon: const Icon(Icons.shopping_cart_checkout)),
            IconButton(
                onPressed: () {
                  setState(() {
                    _sum = 0.0;
                    for (var e in items) {
                      e.selected = false;
                    }
                    _showSelected = false;
                  });
                },
                icon: const Icon(Icons.restore))
          ],
        ),
        body: _showSelected
            ? ShowSelectedItems(width: screenWidth)
            : ListView.builder(
                padding: const EdgeInsets.all(20.0),
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return Column(children: [
                    Row(children: [
                      SizedBox(width: screenWidth * 0.2),
                      Checkbox(
                          value: items[index].selected,
                          onChanged: (e) {
                            items[index].selected = e as bool;
                            if (items[index].selected) {
                              // add its price to total price
                              _sum += items[index].price;
                            } else {
                              // subtract its price from total price
                              _sum -= items[index].price;
                            }
                            setState(() {});
                          }),
                      Text(items[index].toString(), style: TextStyle(fontSize: 18.0),),
                    ]),
                    const SizedBox(height: 10),
                    Image.network(
                      items[index].image,
                      height: screenWidth * 0.3,
                    ),
                  ]);
                }));
  }
}

class ShowSelectedItems extends StatelessWidget {
  final double width;
  const ShowSelectedItems({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    List<Item> selectedItems = [];
    for (var e in items) {
      if (e.selected) {
        selectedItems.add(e);
      }
    }
    return ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: selectedItems.length,
        itemBuilder: (context, index) {
          return Column(children: [
            const SizedBox(height: 10),
            Text(selectedItems[index].toString(),
                style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Image.network(
              selectedItems[index].image,
              height: width * 0.3,
            ),
            const SizedBox(height: 10),
          ]);
        });
  }
}
