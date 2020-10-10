import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Konsrr App")),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('events').snapshots(),
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
        ));
  }
}
