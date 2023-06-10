import 'package:flutter/material.dart';
import '../../../../travel_app/domain/models/travel_model.dart';
import '../../travel/travel_screen.dart';

class CitysCarrousel extends StatefulWidget {
  final List<Travel> travels;
  const CitysCarrousel({super.key, required this.travels});

  @override
  State<CitysCarrousel> createState() => _CitysCarrouselState();
}

class _CitysCarrouselState extends State<CitysCarrousel> {
  late PageController _pageController;
  int i = 0;
  int prevewPage = 0;
  bool _animated = false;
  double _page = 0;

  @override
  void initState() {
    _pageController = PageController(
      viewportFraction: .8,
    );
    _pageController.addListener(onScroll);
    super.initState();
  }

  void onScroll() {
    setState(() {
      _page = _pageController.page!;
    });
  }

  @override
  void dispose() {
    _pageController.addListener(onScroll);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text('CITYS MOST POPULARS',
            style: TextStyle(
                fontFamily: 'PBold',
                fontSize: 18,
                color: Colors.black,
                letterSpacing: 2)),
        SizedBox(
            height: 160,
            child: PageView.builder(
              controller: _pageController,
              itemCount: widget.travels.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(right: 10),
                    child: CityCard(city: widget.travels[index]));
              },
              onPageChanged: (int page) {
                setState(() {
                  i = page;
                });
              },
            )),
      ],
    );
  }
}

class CityCard extends StatelessWidget {
  final Travel city;
  const CityCard({super.key, required this.city});

  void _openSpecsPage(BuildContext context, Travel city) async {
    await Navigator.push(
        context,
        PageRouteBuilder(
          reverseTransitionDuration: const Duration(milliseconds: 1500),
          transitionDuration: const Duration(milliseconds: 1500),
          pageBuilder: (context, animation, secondaryAnimation) {
            return FadeTransition(
                opacity: animation, child: TravelScreen(city: city));
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Stack(clipBehavior: Clip.none, children: [
        Positioned.fill(
            bottom: 40,
            right: 0,
            left: 0,
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: const Color(0xFF101E24),
                    gradient: const LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.center,
                        colors: [
                          Color.fromARGB(255, 4, 167, 139),
                          Color(0xFF253F47),
                        ])))),
        Positioned(
            top: 10,
            left: 10,
            bottom: 50,
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                    margin: EdgeInsets.zero,
                    width: 160,
                    height: 160,
                    child: Image.asset(
                      city.images.first,
                      fit: BoxFit.cover,
                    )),
              ),
            )),
        Positioned(
          top: 0,
          bottom: 40,
          right: 0,
          child: Container(
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      child: Text(city.country,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              letterSpacing: 1,
                              fontFamily: 'PBold')),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 100,
                      child: Text(city.city,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: 1,
                              fontFamily: 'PRegular')),
                    ),
                    const SizedBox(height: 5),
                    Text('Revews ${city.revews}',
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            letterSpacing: 1,
                            fontFamily: 'PRegular')),
                    const SizedBox(height: 5),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.star_rate,
                          color: Color.fromARGB(255, 251, 226, 5),
                          size: 25,
                        ),
                        Text(': ${city.starts}',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                letterSpacing: 1,
                                fontFamily: 'PRegular'))
                      ],
                    ),
                  ])),
        ),
        Positioned(
          bottom: 35,
          right: -5,
          child: GestureDetector(
            onTap: () {
              _openSpecsPage(context, city);
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: const Color.fromARGB(255, 4, 167, 139),
              ),
              width: 40,
              height: 40,
              child: const Center(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
