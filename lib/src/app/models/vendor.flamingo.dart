// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum VendorKey {
  name,
  joinDate,
}

extension VendorKeyExtension on VendorKey {
  String get value {
    switch (this) {
      case VendorKey.name:
        return 'name';
      case VendorKey.joinDate:
        return 'joinDate';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(Vendor doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'joinDate', doc.joinDate);

  return data;
}

/// For load data
void _$fromData(Vendor doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.joinDate = Helper.valueFromKey<Timestamp>(data, 'joinDate');
}
