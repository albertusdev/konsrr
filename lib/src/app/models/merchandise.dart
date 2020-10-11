import 'package:flamingo/flamingo.dart';
import 'package:flamingo_annotation/flamingo_annotation.dart';

part 'merchandise.flamingo.dart';

class Merchandise extends Model {
  @Field()
  String name;
  @Field()
  String imageURL;
  @Field()
  double price;

  Merchandise({
    Map<String, dynamic> values,
  }) : super(
    values: values,
  );

  @override
  void fromData(Map<String, dynamic> data) => _$fromData(this, data);

  @override
  Map<String, dynamic> toData() => _$toData(this);
}
