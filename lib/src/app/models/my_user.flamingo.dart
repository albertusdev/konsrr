// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_user.dart';

// **************************************************************************
// FieldValueGenerator
// **************************************************************************

/// Field value key
enum MyUserKey {
  name,
  email,
  birthDate,
  phoneNumber,
  address,
  identificationNumber,
}

extension MyUserKeyExtension on MyUserKey {
  String get value {
    switch (this) {
      case MyUserKey.name:
        return 'name';
      case MyUserKey.email:
        return 'email';
      case MyUserKey.birthDate:
        return 'birthDate';
      case MyUserKey.phoneNumber:
        return 'phoneNumber';
      case MyUserKey.address:
        return 'address';
      case MyUserKey.identificationNumber:
        return 'identificationNumber';
      default:
        return toString();
    }
  }
}

/// For save data
Map<String, dynamic> _$toData(MyUser doc) {
  final data = <String, dynamic>{};
  Helper.writeNotNull(data, 'name', doc.name);
  Helper.writeNotNull(data, 'email', doc.email);
  Helper.writeNotNull(data, 'birthDate', doc.birthDate);
  Helper.writeNotNull(data, 'phoneNumber', doc.phoneNumber);
  Helper.writeNotNull(data, 'address', doc.address);
  Helper.writeNotNull(data, 'identificationNumber', doc.identificationNumber);

  return data;
}

/// For load data
void _$fromData(MyUser doc, Map<String, dynamic> data) {
  doc.name = Helper.valueFromKey<String>(data, 'name');
  doc.email = Helper.valueFromKey<String>(data, 'email');
  doc.birthDate = Helper.valueFromKey<String>(data, 'birthDate');
  doc.phoneNumber = Helper.valueFromKey<String>(data, 'phoneNumber');
  doc.address = Helper.valueFromKey<String>(data, 'address');
  doc.identificationNumber =
      Helper.valueFromKey<String>(data, 'identificationNumber');
}
