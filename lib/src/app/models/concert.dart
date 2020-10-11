import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';
import 'package:intl/intl.dart';
import 'package:konsrr/src/app/models/vendor.dart';

import 'merchandise.dart';

part 'concert.flamingo.dart';

class Concert extends Document<Concert> {
  @Field()
  String name;

  @Field()
  String description;

  @Field()
  double price;

  @Field()
  Timestamp saleStart;

  @Field()
  Timestamp saleEnd;

  @Field()
  Timestamp start;

  @Field()
  Timestamp end;

  @Field()
  String artistName;

  @Field()
  int seenBy;

  @Field()
  String imageUrl;

  @ModelField()
  Vendor vendor;

  @ModelField()
  List<Merchandise> merchandise;

  Concert({
    String id,
    DocumentSnapshot snapshot,
    Map<String, dynamic> values,
    collectionRef,
  }) : super(
          id: id,
          snapshot: snapshot,
          values: values,
          collectionRef: collectionRef,
        );

  String get rangeInWIB {
    final start = DateFormat('yyyy-MM-dd kk:mm').format(this.start.toDate());
    final end = DateFormat('yyyy-MM-dd kk:mm').format(this.end.toDate());
    return "$start - $end WIB";
  }

  String get priceInRP {
    return 'Rp ${price.round()}';
  }

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  @override
  Map<String, dynamic> toData() {
    return _$toData(this);
  }
}
