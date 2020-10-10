import 'package:flutter/material.dart';
import 'package:konsrr/src/app/widgets/app_bar_with_branding_title.dart';

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithBrandingTitle(),
      body: Center(
        child: Text('Search Screen'),
      ),
    );
  }
}
