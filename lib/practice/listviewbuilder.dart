import 'package:flutter/material.dart';


class Listviewbuilder extends StatefulWidget {
  const Listviewbuilder({super.key});

  @override
  State<Listviewbuilder> createState() => _ListviewbuilderState();
}

class _ListviewbuilderState extends State<Listviewbuilder> {
  List<String> names = ['hello', 'world', 'java'];
  List<String> imagePaths = [
    'assets/images/emoji.png',
    'assets/images/games.png',
    'assets/images/play.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('app'),
          leading: InkWell(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return Container(
                        height:200,
                        color:Colors.yellow,
                        child: Column(
                          children: [
                            ListTile(title: Text('jai ganesh')),
                            ListTile(title: Text('jai ganesh')),
                             ListTile(title: Text('jai ganesh')),
                            IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(Icons.arrow_downward))
                          ],
                        ),
                      );
                    });
              },
              child: Icon(Icons.menu)),
        ),
        // body: GridView.builder(
        //     // physics:BouncingScrollPhysics(),
        //     itemCount: 30,
        //     gridDelegate:
        //         SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
        //     itemBuilder: (ctx, index) {
        //       return InkWell(
        //         onTap: () {
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (ctx) => Mailhomescreen()));
        //         },
        //         child: Card(
        //           color: Colors.blue,
        //           elevation: 10,
        //           child: Column(
        //             mainAxisAlignment: MainAxisAlignment.center,
        //             children: [
        //               Text('jai babu'),
        //               Icon(Icons.flag),
        //             ],
        //           ),
        //         ),
        //       );
        //     })
        // 
        );
  }

  // Widget myContainer(int index) {
  //   return Container(
  //     height: 200,
  //     width: 200,
  //     color: Colors.blue,
  //     child: Text("$index"),
  //   );
  // }
}
