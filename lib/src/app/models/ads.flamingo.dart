// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ads.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum AdsKey {
  imageURL,
  concert,
  date,
}

extension AdsKeyExtension on AdsKey {
  String get value {
    switch (this) {
      case AdsKey.imageURL:
        return 'imageURL';
      case AdsKey.concert:
        return 'concert';
      case AdsKey.date:
        return 'date';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Ads doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'imageURL', doc.imageURL);
  Helper.writeNotNull(data, 'concert', doc.concert);
  Helper.writeNotNull(data, 'date', doc.date);

  return data;
}

/// For load data
void _$fromData(Ads doc, Map<String, dynamic> data) {
  doc.imageURL = Helper.valueFromKey<String>(data, 'imageURL');
  doc.concert = Helper.valueFromKey<DocumentReference>(data, 'concert');
  doc.date = Helper.valueFromKey<String>(data, 'date');
}
