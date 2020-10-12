import 'concert.dart';
import 'merchandise.dart';

class Booking {
  Concert concert;
  Set<Merchandise> merchandises = new Set();
  String paymentMethod;
  bool fromAds = false;
  String adsId;

  double get totalPrice {
    var base = concert.price;
    for (var merchandise in merchandises) {
      base += merchandise.price;
    }
    return base;
  }

  Map<String, dynamic> toData() =>
      {
        'concert': concert.toData(),
        'merchandise': [
          for (var merchandise in merchandises) merchandise.toData(),
        ],
        'paymentMethod': paymentMethod,
        'totalPrice': totalPrice,
      };

  bool hasMerchandise(Merchandise merchandise) =>
      merchandises.contains(merchandise);

  void addMerchandise(Merchandise merchandise) => merchandises.add(merchandise);

  void removeMerchandise(Merchandise merchandise) =>
      merchandises.remove(merchandise);

  static Booking fromData(Map<String, dynamic> data) {
    final booking = Booking();
    booking.concert = Concert(values: data['concert']);
    for (var merchandise in data['merchandise']) {
      final merchandiseModel = Merchandise(values: merchandise);
      booking.merchandises.add(merchandiseModel);
    }
    return booking;
  }
}
