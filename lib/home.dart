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
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: ShowItems(),
    );
  }
}

class ShowItems extends StatelessWidget {
  const ShowItems({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20.0),
        itemCount: items.length,
        itemBuilder: (context, index){
          return Column(children: [
            const SizedBox(height: 10),
            Text(items[index].toString(), style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10)
          ]);
        });
  }
}
