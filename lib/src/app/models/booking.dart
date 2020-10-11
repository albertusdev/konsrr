import 'concert.dart';
import 'merchandise.dart';

class Booking {
  Concert concert;
  Set<Merchandise> merchandises = new Set();
  String paymentMethod;

  double get totalPrice {
    var base = concert.price;
    for (var merchandise in merchandises) {
      base += merchandise.price;
    }
    return base;
  }

  Map<String, dynamic> toData() => {
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
}
