import 'package:app_one/motorcycle_app/ui/details/details_screen.dart';
import 'package:app_one/motorcycle_app/ui/home/widgets/motorcycle_card_deluxe.dart';
import 'package:app_one/motorcycle_app/ui/home/widgets/motorcycle_card_standard.dart';
import 'package:app_one/motorcycle_app/ui/home/widgets/motorcycle_carrousel.dart';
import 'package:flutter/material.dart';

import '../../domain/models/motorcycle.dart';

//import 'widgets/motorcycle_carrusel_standard.dart';

class HomeScreenMotorcycle extends StatelessWidget {
  const HomeScreenMotorcycle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void openDetails(Motorcycle motorcycle) {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 600),
          pageBuilder: (_, animation, animation2) {
            return FadeTransition(
              opacity: animation,
              child: DetailsScreen(
                motorcycle: motorcycle,
              ),
            );
          },
        ),
      );
    }

    return Scaffold(
        backgroundColor: Colors.white.withOpacity(0.95),
        body: CustomScrollView(
          slivers: [
            // SliverPersistentHeader(delegate: _PersistentHeaders()),
            SliverAppBar(
              expandedHeight: MotorcycleCardDeluxe.height + 200,
              flexibleSpace: FlexibleSpaceBar(
                  background: Container(
                margin: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    const AppBar(),
                    SingleChildScrollView(
                      child: MotorcycleCarrousel(
                          title: 'Most popular', motorcycles: deluxe),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'New Models',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See all',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w400,
                                letterSpacing: 1,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )),
            ),

            /*  Container(
              color: Colors.transparent,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: MotorcycleCarrouselStandard(
                    title: 'New Models', motorcycles: medium),
              ),
            ) */

            SliverList(
                delegate: (SliverChildBuilderDelegate(childCount: medium.length,
                    (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
                child: MotorcycleCardStandard(
                    motorcycle: medium[index],
                    onTap: () => openDetails(medium[index])),
              );
            })))
          ],
        ));
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.drag_handle,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search,
            ),
          )
        ],
      ),
    );
  }
}

class _PersistentHeaders extends SliverPersistentHeaderDelegate {
  final double _maxExtentHeight = 580;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final percent = (shrinkOffset / _maxExtentHeight);
    return Opacity(
      opacity: 1 - percent,
      child: Container(
        margin: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            const AppBar(),
            SingleChildScrollView(
              child: MotorcycleCarrousel(
                  title: 'Most popular', motorcycles: deluxe),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'New Models',
                    style: TextStyle(
                      fontSize: 34,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'See all',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  double get maxExtent => _maxExtentHeight;

  @override
  double get minExtent => 0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
