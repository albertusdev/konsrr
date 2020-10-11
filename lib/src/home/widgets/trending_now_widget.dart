import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:konsrr/src/concerts/repositories/concert_repository.dart';
import 'package:konsrr/src/concerts/widgets/concert_list_widget.dart';

class TrendingNowWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16.0),
        Text(
          'Trending Now!',
          style: Theme.of(context).textTheme.headline6,
        ),
        SizedBox(height: 8.0),
        ConcertsListWidget.horizontal(
          ConcertRepository.trendingNow,
          height: 250,
        ),
      ],
    );
  }
}
