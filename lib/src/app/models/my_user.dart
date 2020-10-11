import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'my_user.flamingo.dart';

class MyUser extends Document<MyUser> {
  @Field()
  String name;

  @Field()
  String email;

  @Field()
  String birthDate;

  @Field()
  String phoneNumber;

  @Field()
  String address;

  @Field()
  String identificationNumber;

  MyUser({
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
  Map<String, dynamic> toData() {
    return _$toData(this);
  }

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);
}
