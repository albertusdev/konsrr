import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'vendor.flamingo.dart';

class Vendor extends Model {
  @Field()
  String name;

  @Field()
  Timestamp joinDate;

  Vendor({
    this.name,
    this.joinDate,
    Map<String, dynamic> values,
  }) : super(
          values: values,
        );

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  @override
  Map<String, dynamic> toData() => _$toData(this);
}
