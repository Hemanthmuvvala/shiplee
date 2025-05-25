import 'package:flutter/material.dart';

class Listviewbuilder extends StatefulWidget {
  const Listviewbuilder({super.key});

  @override
  State<Listviewbuilder> createState() => _ListviewbuilderState();
}

class _ListviewbuilderState extends State<Listviewbuilder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
        return  myContainer(index);
        },
      ),
    );
  }

  Widget myContainer(int index) {
    return Container(
      height: 200,
      width: 200,
      color: Colors.blue,
      child: Text("$index"),
    );
  }
}
