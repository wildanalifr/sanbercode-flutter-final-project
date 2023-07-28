import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  String user = '';
  String userInitialize = '';

  Future<void> fetchUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userInfo = prefs.getString('user');
    user = userInfo!;
    userInitialize = userInfo.substring(0, 1).toUpperCase();
  }

  @override
  void initState() {
    fetchUser();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            accountName: Container(),
            accountEmail: Text("user"),
            currentAccountPicture: CircleAvatar(
              child: Text(
                // '$userInitialize',
                'halo',
                style: const TextStyle(fontSize: 35),
              ),
            ),
          ),
          DrawerListTile(
            iconData: Icons.person,
            title: "Profile",
            onTilePressed: () {},
          ),
          DrawerListTile(
            iconData: Icons.exit_to_app,
            title: "Exit",
            onTilePressed: () {},
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  final IconData? iconData;
  final String? title;
  final VoidCallback? onTilePressed;

  const DrawerListTile(
      {super.key, this.iconData, this.title, this.onTilePressed});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTilePressed,
      dense: true,
      leading: Icon(iconData),
      title: Text(
        title!,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
