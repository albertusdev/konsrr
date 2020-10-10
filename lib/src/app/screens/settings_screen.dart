import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/app/widgets/app_bar_with_branding_title.dart';
import 'package:konsrr/src/auth/controller/auth_controller.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBrandingTitle(),
      body: Column(
        children: [
          ListTile(
            trailing: Icon(Icons.exit_to_app),
            title: Text('Sign-out'),
            onTap: Get.find<AuthController>().signOut,
          ),
        ]
      )
    );
  }
}
