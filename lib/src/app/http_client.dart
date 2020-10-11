import 'package:dio/dio.dart';

import 'models/concert.dart';

class KonsrrApi {
  final Dio dio = Dio();

  Future<Response> updateSeenBy(Concert concert) async {
    return await dio.post(
      'https://asia-southeast2-konsrr.cloudfunctions.net/updateSeenBy',
      data: {
        'concertId': concert.id,
      }
    );
  }
}
