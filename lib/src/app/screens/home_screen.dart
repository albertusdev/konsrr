import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/auth/screens/auth_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Konsrr")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('events').snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CircularProgressIndicator();
                }

                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (final doc in snapshot.data.docs)
                      Text(doc.data().toString())
                  ],
                );
              },
            ),
            RaisedButton(
              child: Text('Go to Sign In page'),
              onPressed: () => Get.to(AuthScreen()),
            )
          ],
        ),
      ),
    );
  }
}
