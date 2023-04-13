import 'package:app_one/bank_app/ui/constant.dart';
import 'package:app_one/coffee_app/global/styles.dart';
import 'package:flutter/material.dart';

import '../../../domain/models/bank_client.dart';
import '../../home/widgets/circle_avatar.dart';

class HeaderHomePage extends StatelessWidget {
  const HeaderHomePage({
    Key? key,
    required this.expandedFactor,
  }) : super(key: key);

  final double expandedFactor;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return OverflowBox(
      maxHeight: size.height,
      maxWidth: size.width,
      alignment: Alignment.topCenter,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 30 * expandedFactor,
            right: 30 * expandedFactor,
            bottom: (size.height * .8) * expandedFactor,
            child: Container(
              padding: const EdgeInsets.all(20),
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: backgroundColorLigth,
                borderRadius: BorderRadius.circular(30 * expandedFactor),
              ),
              child: Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: const Avatar(size: 100)),
            ),
          ),
          // Hide Animated items

          Positioned(
              top: 160,
              left: 40,
              right: 0,
              child: (expandedFactor < .2)
                  ? const Text('Contacts',
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.white,
                          fontFamily: 'PBold',
                          letterSpacing: 1))
                  : const SizedBox()),
          Positioned(
            left: 10,
            right: 10,
            top: 150,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20 * expandedFactor),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  child: (expandedFactor < .2)
                      ? Column(
                          children: const [
                            SizedBox(height: 40),
                            SizedBox(height: 120, child: _BankUserList()),
                            SizedBox(height: 20),
                            _HolidayGoalWidget(),
                            SizedBox(height: 20),
                            _PlayServicesCard()
                          ],
                        )
                      : const SizedBox(),
                ),
              ],
            ),
          ),
          //-------------------
          // Separator
          //-------------------
          // Container(
          //   height: 8,
          //   width: 60,
          //   margin: const EdgeInsets.symmetric(vertical: 15),
          //   decoration: BoxDecoration(
          //     color: Colors.blueGrey[50],
          //     borderRadius: BorderRadius.circular(30),
          //   ),
          // )
        ],
      ),
    );
  }
}

class _PlayServicesCard extends StatelessWidget {
  const _PlayServicesCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: backgroundColorDark,
        borderRadius: BorderRadius.circular(20.0),
      ),
    );
  }
}

class _HolidayGoalWidget extends StatelessWidget {
  const _HolidayGoalWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
            ),
          ),
          Expanded(
            flex: 2,
            child: Opacity(
              opacity: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Chip(
                    label: const Text('Holiday goal'),
                    labelStyle: TextStyle(
                      color: backgroundColorDark,
                      fontWeight: FontWeight.bold,
                    ),
                    backgroundColor: Colors.blue[200],
                  ),
                  Text.rich(
                      TextSpan(text: '\$ 100.00', children: [
                        TextSpan(
                          text: '  \$ 5000.00',
                          style: TextStyle(
                            color: Colors.blueGrey[400],
                          ),
                        )
                      ]),
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.bold,
                      )),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _BankUserList extends StatelessWidget {
  const _BankUserList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: BankClient.users.length,
      itemExtent: 90,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        final bankUser = BankClient.users[index];
        return Container(
          margin: const EdgeInsets.only(top: 30),
          child: Column(
            children: [
              CircleAvatar(
                radius: 30,
                backgroundImage: AssetImage(bankUser.pathImage),
              ),
              Text('${bankUser.name.split(' ').first}'),
            ],
          ),
        );
      },
    );
  }
}

class _GreetingWidget extends StatelessWidget {
  const _GreetingWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  final BankClient user;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text.rich(
          TextSpan(
            text: 'Hello',
            children: [
              TextSpan(
                  text: ' ${user.name.split(' ').first}',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          style: const TextStyle(fontSize: 30, color: Color(0xFF081A38)),
        ),
        const Spacer(),
        Align(
          widthFactor: .2,
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(user.pathImage),
          ),
        ),
        Container(
          width: 60,
          height: 60,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: const Icon(
            Icons.credit_card,
            color: Color(0xff16165a),
          ),
        )
      ],
    );
  }
}
