import 'package:flutter/material.dart';
import 'package:shiplee/practice/list_widget.dart';

class Mailhomescreen extends StatefulWidget {
  const Mailhomescreen({super.key});

  @override
  State<Mailhomescreen> createState() => _MailhomescreenState();
}

class _MailhomescreenState extends State<Mailhomescreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: const ListScreen(),
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(
            height: 50,
          ),
          Center(
            child: SizedBox(
              width: 350,
              child: TextField(
                cursorColor: Colors.blue,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    filled: true,
                    fillColor: const Color.fromARGB(255, 39, 39, 39),
                    prefixIcon: GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openDrawer(); // Open drawer
                      },
                      child: const Icon(Icons.menu, color: Colors.white),
                    ),
                    hintText: 'Search in mail',
                    hintStyle: const TextStyle(
                        color: Color.fromARGB(255, 218, 218, 218),
                        fontSize: 17),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 39, 39, 39),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(255, 39, 39, 39),
                      ),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(40))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
