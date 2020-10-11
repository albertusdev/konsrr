// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'concert.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum ConcertKey {
  name,
  description,
  price,
  saleStart,
  saleEnd,
  start,
  end,
  artistName,
  seenBy,
  imageUrl,
  vendor,
  merchandise,
}

extension ConcertKeyExtension on ConcertKey {
  String get value {
    switch (this) {
      case ConcertKey.name:
        return 'name';
      case ConcertKey.description:
        return 'description';
      case ConcertKey.price:
        return 'price';
      case ConcertKey.saleStart:
        return 'saleStart';
      case ConcertKey.saleEnd:
        return 'saleEnd';
      case ConcertKey.start:
        return 'start';
      case ConcertKey.end:
        return 'end';
      case ConcertKey.artistName:
        return 'artistName';
      case ConcertKey.seenBy:
        return 'seenBy';
      case ConcertKey.imageUrl:
        return 'imageUrl';
      case ConcertKey.vendor:
        return 'vendor';
      case ConcertKey.merchandise:
        return 'merchandise';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Concert doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'description', doc.description);
  Helper.writeNotNull(data, 'price', doc.price);
  Helper.writeNotNull(data, 'saleStart', doc.saleStart);
  Helper.writeNotNull(data, 'saleEnd', doc.saleEnd);
  Helper.writeNotNull(data, 'start', doc.start);
  Helper.writeNotNull(data, 'end', doc.end);
  Helper.writeNotNull(data, 'artistName', doc.artistName);
  Helper.writeNotNull(data, 'seenBy', doc.seenBy);
  Helper.writeNotNull(data, 'imageUrl', doc.imageUrl);

  Helper.writeModelNotNull(data, 'vendor', doc.vendor);
  Helper.writeModelListNotNull(data, 'merchandise', doc.merchandise);

  return data;
}

/// For load data
void _$fromData(Concert doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.description = Helper.valueFromKey<String>(data, 'description');
  doc.price = Helper.valueFromKey<double>(data, 'price');
  doc.saleStart = Helper.valueFromKey<Timestamp>(data, 'saleStart');
  doc.saleEnd = Helper.valueFromKey<Timestamp>(data, 'saleEnd');
  doc.start = Helper.valueFromKey<Timestamp>(data, 'start');
  doc.end = Helper.valueFromKey<Timestamp>(data, 'end');
  doc.artistName = Helper.valueFromKey<String>(data, 'artistName');
  doc.seenBy = Helper.valueFromKey<int>(data, 'seenBy');
  doc.imageUrl = Helper.valueFromKey<String>(data, 'imageUrl');

  final _vendor = Helper.valueMapFromKey<String, dynamic>(data, 'vendor');
  if (_vendor != null) {
    doc.vendor = Vendor(values: _vendor);
  } else {
    doc.vendor = null;
  }

  final _merchandise =
      Helper.valueMapListFromKey<String, dynamic>(data, 'merchandise');
  if (_merchandise != null) {
    doc.merchandise = _merchandise
        .where((d) => d != null)
        .map((d) => Merchandise(values: d))
        .toList();
  } else {
    doc.merchandise = null;
  }
}
