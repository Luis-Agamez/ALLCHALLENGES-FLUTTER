import 'package:app_one/air/domain/data/data.dart';
import 'package:app_one/air/domain/entities/card_travel.dart';
import 'package:flutter/material.dart';

import '../../animations/widgets/animations_screen.dart';
import '../../details/air_details_screen.dart';

class RowSeats extends StatelessWidget {
  const RowSeats({
    super.key,
    this.numSeats,
    this.seatsOccupied,
    this.seatsSelectedNotifier,
  });

  final int? numSeats;
  final List<int>? seatsOccupied;
  final ValueNotifier<int>? seatsSelectedNotifier;

  @override
  Widget build(BuildContext context) {
    const sizeItem = 22.0;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: List.generate(numSeats!, (i) {
          if (seatsOccupied!.contains(i + 1)) {
            return Container(
              height: sizeItem,
              width: sizeItem,
              margin: const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
              decoration: BoxDecoration(
                color: const Color(0xffa0a0bf),
                borderRadius: BorderRadius.circular(3),
              ),
            );
          }

          final isActiveNotifier = ValueNotifier(false);
          return ValueListenableBuilder<bool>(
            valueListenable: isActiveNotifier,
            builder: (context, value, _) {
              return InkWell(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                onTap: () {
                  isActiveNotifier.value = !isActiveNotifier.value;
                  if (value) {
                    seatsSelectedNotifier!.value--;
                  } else {
                    seatsSelectedNotifier!.value++;
                  }
                  Future.delayed(
                    const Duration(milliseconds: 300),
                    () {
                      Navigator.pushReplacement(context, PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) {
                          return FadeTransition(
                            opacity: animation,
                            child: AirDetailsScreen(
                                isDetails: false,
                                data: CardTravel(
                                    originName: 'Bogota',
                                    originInitials: 'BOG',
                                    originDestiny: 'Paris',
                                    destinyInitials: 'PAR',
                                    number: 'AB9327',
                                    hours: '10h 0min',
                                    date: 'Mayo 28 01:20 pm',
                                    price: 1200)),
                          );
                        },
                      ));
                    },
                  );
                },
                child: Container(
                  height: sizeItem,
                  width: sizeItem,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 3, vertical: 5),
                  decoration: BoxDecoration(
                    color: value
                        ? const Color(0XFF466D79)
                        : const Color(0xffa0a0bf),
                    borderRadius: BorderRadius.circular(3),
                  ),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
