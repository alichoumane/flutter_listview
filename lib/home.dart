import 'package:flutter/material.dart';
import 'item.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if(MediaQuery.of(context).orientation == Orientation.landscape)
      screenWidth = screenWidth *0.8;

    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
      ),
      body: ShowItems(width: screenWidth),
    );
  }
}

class ShowItems extends StatelessWidget {
  final double width;
  const ShowItems({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    print('width: $width');
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
        itemCount: items.length,
        itemBuilder: (context, index){
          return Column(children: [
            const SizedBox(height: 10),
            SizedBox(width: width * 0.28,
              child:Text(items[index].toString(), style: const TextStyle(fontSize: 18)),
            ),
          const SizedBox(height: 10)
          ]);
        });
  }
}
