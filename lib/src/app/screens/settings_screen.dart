import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/widgets/app_bar_with_branding_title.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

import 'profile_screen.dart';

class SettingsScreen extends StatefulWidget {
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    final authController = Get.find<AuthController>();
    return Scaffold(
      appBar: AppBarWithBrandingTitle(),
      body: Column(
        children: [
          Obx(
            () => authController.isSignedIn ? ListTile(
              leading: CircleAvatar(
                child: Text(authController.initialName,
                    style: TextStyle(
                      color: Colors.white,
                    )),
              ),
              title: Text(authController.name),
              subtitle: Text(authController.user.value.email),
            ) : SizedBox(),
          ),
          ListTile(
            leading: Icon(Icons.account_circle_outlined),
            title: Text(
                'Edit Account Information / Auto-fill Attendant Information'),
            trailing: Icon(Icons.navigate_next),
            onTap: () => Get.to(ProfileScreen()),
          ),
          ListTile(
            leading: Icon(Get.isDarkMode ? Icons.wb_sunny_outlined : Icons.nightlight_round),
            title: Text(Get.isDarkMode ? 'Change to light theme' : 'Change to dark theme'),
            onTap: () {
              Get.changeThemeMode(Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
              setState(() {});
              setState(() {});
            },
            trailing: Icon(Icons.navigate_next),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Sign-out'),
            onTap: authController.signOut,
            trailing: Icon(Icons.navigate_next),
          ),
        ],
      ),
    );
  }
}
