import 'package:flutter/material.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _backgroundAnimation1;
  late Animation<double> _backgroundAnimation2;
  late Animation<double> _backgroundAnimation3;

  @override
  void initState() {
    _animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 2000));

    _backgroundAnimation1 = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.0, 0.2));
    _backgroundAnimation2 = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.3, 0.7));
    _backgroundAnimation3 = CurvedAnimation(
        parent: _animationController, curve: const Interval(0.7, 1.0));

    _animationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25)),
                  child: Container(
                      height: size.height * 0.5,
                      decoration: const BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25))),
                      child: Image.asset(
                        'assets/arquitectImg/home_1_2.jpg',
                        fit: BoxFit.cover,
                      )),
                )),
            Positioned(
              top: size.height * .5,
              left: 0,
              right: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Opacity(
                          opacity: _backgroundAnimation2.value,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Ibe House',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'PBold',
                                    fontSize: 20,
                                    letterSpacing: 1),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  _LocationItem(),
                                  _LocationItem()
                                ],
                              ),
                            ],
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              200 * (1 - _backgroundAnimation1.value), 0),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Column(
                              children: [
                                const Text(
                                  '3,400.00',
                                  style: TextStyle(
                                      fontFamily: 'PBold', fontSize: 24),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber[900],
                                    ),
                                    const SizedBox(width: 5),
                                    const Text('4.3 Revews',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'PMedium',
                                          fontWeight: FontWeight.w400,
                                        ))
                                  ],
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Transform.translate(
                          offset: Offset(
                              -500 * (1 - _backgroundAnimation2.value), 0),
                          child: _AttributeItem(
                            size: size,
                            icon: Icon(
                              Icons.bed,
                              size: 16,
                              color: Colors.grey[700],
                            ),
                            labelText: '3 Bedrooms',
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              -600 * (1 - _backgroundAnimation2.value), 0),
                          child: _AttributeItem(
                            size: size,
                            icon: Icon(
                              Icons.bathtub_rounded,
                              size: 16,
                              color: Colors.grey[700],
                            ),
                            labelText: '2 Bathrooms',
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              -700 * (1 - _backgroundAnimation2.value), 0),
                          child: _AttributeItem(
                            size: size,
                            icon: Icon(
                              Icons.local_parking_outlined,
                              size: 16,
                              color: Colors.grey[700],
                            ),
                            labelText: '2 Parking',
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    const Text(
                      'Description',
                      style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 1,
                          fontFamily: 'PBold',
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    const Text(
                      'is a vast country in South America stretching  Iguazu Falls in the south. Symbolized by its 38m statue of Christ the Rio de Janeiro is famous for its busy Copacabana and Ipanema beaches, along with its huge',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                        fontFamily: 'PRegular',
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Facilities',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'PBold',
                          letterSpacing: 1,
                          fontSize: 18,
                          fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Transform.translate(
                          offset: Offset(
                              500 * (1 - _backgroundAnimation3.value), 0),
                          child: const _ComfortItem(
                            labelText: 'Parking',
                            icon: Icon(
                              Icons.car_rental,
                              color: Colors.white,
                              size: 28,
                            ),
                            isSelected: true,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              600 * (1 - _backgroundAnimation3.value), 0),
                          child: const _ComfortItem(
                            labelText: 'CCTV',
                            icon: Icon(
                              Icons.camera_outdoor_sharp,
                              size: 28,
                            ),
                            isSelected: false,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              700 * (1 - _backgroundAnimation3.value), 0),
                          child: const _ComfortItem(
                            labelText: 'Security',
                            icon: Icon(
                              Icons.security_outlined,
                              size: 28,
                            ),
                            isSelected: false,
                          ),
                        ),
                        Transform.translate(
                          offset: Offset(
                              900 * (1 - _backgroundAnimation3.value), 0),
                          child: const _ComfortItem(
                            labelText: 'AC',
                            icon: Icon(
                              Icons.air_outlined,
                              size: 28,
                            ),
                            isSelected: false,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        );
      },
    ));
  }
}

class _ComfortItem extends StatelessWidget {
  const _ComfortItem({
    super.key,
    required this.labelText,
    required this.icon,
    required this.isSelected,
  });

  final String labelText;
  final Icon icon;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 60,
      decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              style: isSelected ? BorderStyle.none : BorderStyle.solid,
              color: Colors.grey,
              width: 2)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            labelText,
            style: TextStyle(
                fontSize: 14,
                fontFamily: 'PRegular',
                color: isSelected ? Colors.white : Colors.black),
          )
        ],
      ),
    );
  }
}

class _AttributeItem extends StatelessWidget {
  const _AttributeItem({
    super.key,
    required this.size,
    this.labelText,
    required this.icon,
  });

  final Size size;
  final labelText;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          margin: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              icon,
              Text(
                labelText,
                style: TextStyle(
                    fontSize: 14,
                    letterSpacing: 1,
                    fontFamily: 'PRegular',
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w400),
              )
            ],
          ),
        )
      ],
    );
  }
}

class _LocationItem extends StatelessWidget {
  const _LocationItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Icon(Icons.location_on),
        SizedBox(
          width: 3,
        ),
        Text(
          'Los Angeles',
          style: TextStyle(fontFamily: 'PRegular'),
        ),
      ],
    );
  }
}
