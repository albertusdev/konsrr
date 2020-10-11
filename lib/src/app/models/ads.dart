import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'ads.flamingo.dart';

class Ads extends Document<Ads> {
  @Field()
  String imageURL;

  @Field()
  DocumentReference concert;

  @Field()
  String date;

  Ads({
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

  @override
  void fromData(Map<String, dynamic> data) {
    return _$fromData(this, data);
  }
}