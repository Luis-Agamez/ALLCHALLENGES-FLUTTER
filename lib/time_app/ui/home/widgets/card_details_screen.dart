import 'package:flutter/material.dart';

class CardDetailsClime extends StatelessWidget {
  const CardDetailsClime({
    super.key,
    required Animation<double> backgroundAnimation3,
  }) : _backgroundAnimation3 = backgroundAnimation3;

  final Animation<double> _backgroundAnimation3;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 200,
      padding: const EdgeInsets.all(20),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Icon(
              Icons.wb_cloudy_outlined,
              size: 52,
              color: Colors.blue[900],
            ),
            const SizedBox(width: 20),
            const Text(
              'Air Qality',
              style: TextStyle(
                  fontSize: 28, letterSpacing: 2, fontWeight: FontWeight.w800),
            ),
          ],
        ),
        Opacity(
          opacity: _backgroundAnimation3.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.wb_cloudy_outlined,
                    size: 38,
                    color: Colors.blue[900],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Real Feel',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '23.8',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.air_outlined,
                    size: 38,
                    color: Colors.blue[900],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Wind',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '9 km/h',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.water_drop_outlined,
                    size: 38,
                    color: Colors.blue[900],
                  ),
                  Column(
                    children: const [
                      Text(
                        'SO2',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '0.9',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        Opacity(
          opacity: _backgroundAnimation3.value,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.cloudy_snowing,
                    size: 38,
                    color: Colors.blue[900],
                  ),
                  Column(
                    children: const [
                      Text(
                        'Chance of Rain',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '68%',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.sunny_snowing,
                    size: 38,
                    color: Colors.blue[900],
                  ),
                  Column(
                    children: const [
                      Text(
                        'UVIndex',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '3',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.waves_outlined,
                    size: 38,
                    color: Colors.blue[900],
                  ),
                  Column(
                    children: const [
                      Text(
                        '03',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        '50',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
