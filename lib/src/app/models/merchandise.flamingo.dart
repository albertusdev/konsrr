// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'merchandise.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum MerchandiseKey {
  name,
  imageURL,
  price,
}

extension MerchandiseKeyExtension on MerchandiseKey {
  String get value {
    switch (this) {
      case MerchandiseKey.name:
        return 'name';
      case MerchandiseKey.imageURL:
        return 'imageURL';
      case MerchandiseKey.price:
        return 'price';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Merchandise doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'imageURL', doc.imageURL);
  Helper.writeNotNull(data, 'price', doc.price);

  return data;
}

/// For load data
void _$fromData(Merchandise doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.imageURL = Helper.valueFromKey<String>(data, 'imageURL');
  doc.price = Helper.valueFromKey<double>(data, 'price');
}
