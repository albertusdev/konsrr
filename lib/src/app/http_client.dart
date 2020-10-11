import 'package:dio/dio.dart';

import 'models/concert.dart';

class KonsrrApi {
  final Dio dio = Dio();

  Future<Response> updateSeenBy(Concert concert) async {
    return await dio.post(
      'https://asia-southeast2-konsrr.cloudfunctions.net/updateSeenBy',
      data: {
        'id': concert.id,
      }
    );
  }

  Future<Response> incrementAdsView(String adsId) async {
    return await dio.post(
        'https://asia-southeast2-konsrr.cloudfunctions.net/incrementAdsView',
        data: {
          'id': adsId,
        }
    );
  }

  Future<Response> incrementAdsClick(String adsId) async {
    return await dio.post(
        'https://asia-southeast2-konsrr.cloudfunctions.net/incrementAdsClick',
        data: {
          'id': adsId,
        }
    );
  }

  Future<Response> incrementAdsWishlist(String adsId) async {
    return await dio.post(
        'https://asia-southeast2-konsrr.cloudfunctions.net/incrementAdsWishlist',
        data: {
          'id': adsId,
        }
    );
  }

  Future<Response> incrementAdsConverted(String adsId) async {
    return await dio.post(
        'https://asia-southeast2-konsrr.cloudfunctions.net/incrementAdsConverted',
        data: {
          'id': adsId,
        }
    );
  }
}
