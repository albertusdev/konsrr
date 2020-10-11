import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:konsrr/src/app/models/concert.dart';

class ConcertRepository {
  static Query get concertsCollection => FirebaseFirestore.instance.collectionGroup('concerts');

  static CollectionPaging<Concert> get trendingNow {
    final query = CollectionPaging<Concert>(
      query: concertsCollection,
      limit: 10,
      decode: (snap, col) {
        return Concert(snapshot: snap, collectionRef: col);
      }
    );
   return query;
  }
}
