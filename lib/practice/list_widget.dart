import 'package:flutter/material.dart';
import 'package:shiplee/practice/drawerscreen.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 10,
        backgroundColor: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 200,
              width: double.infinity,
              child: UserAccountsDrawerHeader(
                accountName: Text('Neela Muvvala'),
                accountEmail: Text('neela@gmail.com'),

                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage(
                      'assets/images/games.png'), // add an image in assets
                ),
                decoration: BoxDecoration(color: Colors.blue),
                // otherAccountsPictures: [
                //   CircleAvatar(child: Icon(Icons.person_2)),
                // ],
              ),
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.folder_copy),
              listTitle: 'My Files',
              onTapPress: () {},
            ),
            //const Divider(),
            Drawerscreen(
              listIcon: const Icon(Icons.group),
              listTitle: 'Shared with me',
              onTapPress: () {},
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.star),
              listTitle: 'starred',
              onTapPress: () {},
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.schedule),
              listTitle: 'recent',
              onTapPress: () {},
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.offline_pin_rounded),
              listTitle: 'offline',
              onTapPress: () {},
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.upload),
              listTitle: 'Upload',
              onTapPress: () {},
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.backup),
              listTitle: 'Backups',
              onTapPress: () {},
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.delete),
              listTitle: 'Trash',
              onTapPress: () {},
            ),
            const Divider(),
            Drawerscreen(
              listIcon: const Icon(Icons.settings),
              listTitle: 'Settings Account',
              onTapPress: () {},
            ),
            Drawerscreen(
              listIcon: const Icon(Icons.settings),
              listTitle: 'Settings Account',
              onTapPress: () {},
            ),
          ],
        ),
      ),
      // endDrawer:Drawer(),
    );
  }
}
