import 'package:flutter/material.dart';

class Drawerscreen extends StatefulWidget {
  final String listTitle;
  final Icon listIcon;
  final Function()? onTapPress;
  const Drawerscreen(
      {super.key,
      required this.listTitle,
      required this.listIcon,
      this.onTapPress});
  @override
  State<Drawerscreen> createState() => _DrawerscreenState();
}

class _DrawerscreenState extends State<Drawerscreen> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ListTile(
        leading: widget.listIcon,
        title: Text(widget.listTitle),
        // visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
        onTap: widget.onTapPress,
      ),
    ]);
  }
}
