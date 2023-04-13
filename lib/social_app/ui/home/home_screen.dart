import 'package:app_one/social_app/ui/home/paints/paint_border.dart';
import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

import '../../domain/model.dart';
import '../utils/rive_utils.dart';
import '../widgets/card_post.dart';
import '../widgets/circle_history.dart';
import '../widgets/header_app.dart';

class HomeScreenSocialApp extends StatefulWidget {
  const HomeScreenSocialApp({Key? key}) : super(key: key);
  static Color backgroundColor = const Color(0XFF1B1E28);
  static Color primaryColor = const Color(0XFF136EF4);
  static Color redColor = const Color(0XFFED2738);
  static Color ligthBackgroundColor = const Color(0XFFF8F8FA);
  static Color colorBlack = const Color(0XFF34383B);
  static Color ligthBlue = const Color(0XFFCBDDF9);
  static Color ligthWhite = const Color(0XFFEFEFEF);
  static Color colorYellow = const Color(0XFFEEAF20);

  @override
  State<HomeScreenSocialApp> createState() => _HomeScreenSocialAppState();
}

class _HomeScreenSocialAppState extends State<HomeScreenSocialApp> {
  int _selectedIndex = 0;
  final screens = [
    const _HomeScreen(),
    const Scaffold(
      body: Center(
        child: Text('Favorite', style: TextStyle(fontSize: 60)),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('Timer', style: TextStyle(fontSize: 60)),
      ),
    ),
    const Scaffold(
      body: Center(
        child: Text('User', style: TextStyle(fontSize: 60)),
      ),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    const expandDuration = Duration(milliseconds: 400);
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: Container(
        color: Colors.white.withOpacity(.01),
        child: SafeArea(
            child: Container(
          padding: const EdgeInsets.all(12),
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 5),
          decoration: BoxDecoration(
              color: HomeScreenSocialApp.backgroundColor.withOpacity(0.9),
              borderRadius: const BorderRadius.all(Radius.circular(24))),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            ...List.generate(
                bottomNavs.length,
                (index) => GestureDetector(
                      onTap: () {
                        if (bottomNavs[index] != bottomNavs[_selectedIndex]) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        }
                        bottomNavs[index].input!.change(true);
                        // searchTigger.change(true);
                        Future.delayed(const Duration(seconds: 1), (() {
                          bottomNavs[index].input!.change(false);
                        }));
                      },
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            margin: const EdgeInsets.only(bottom: 2),
                            height: 4,
                            width:
                                bottomNavs[index] == bottomNavs[_selectedIndex]
                                    ? 24
                                    : 0,
                            decoration: BoxDecoration(
                                color: HomeScreenSocialApp.primaryColor,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(12))),
                          ),
                          SizedBox(
                            height: 36,
                            width: 36,
                            child: Opacity(
                              opacity: bottomNavs[index] ==
                                      bottomNavs[_selectedIndex]
                                  ? 1
                                  : 0.5,
                              child: RiveAnimation.asset(
                                bottomNavs.first.src,
                                artboard: bottomNavs[index].artboard,
                                onInit: (artboard) {
                                  StateMachineController controller =
                                      RiveUtils.getRiveController(artboard,
                                          stateMachineName: bottomNavs[index]
                                              .stateMachineName);

                                  bottomNavs[index].input =
                                      controller.findSMI("active") as SMIBool;
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
          ]),
        )),
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
            top: size.height * .2,
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 58),
              width: size.width,
              height: size.height * .7,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    SizedBox(height: 30),
                    CardPost(
                      imgUrl:
                          'https://i.pinimg.com/564x/e4/3a/0a/e43a0a2ee314fa66499a3ce10490abaa.jpg',
                      name: 'Ana de Armas',
                      description: 'And we ent with the beginning "He.."',
                      perfilImage:
                          'https://i.pinimg.com/564x/5e/4a/e3/5e4ae3f967dedb0fa2b825151ca139ce.jpg',
                    ),
                    CardPost(
                      imgUrl:
                          'https://i.pinimg.com/736x/86/a3/0b/86a30bf351e3fca3b1e0d847f4e73f52.jpg',
                      name: 'Marelin Nollan',
                      description: 'And we ent with the beginning "He.."',
                      perfilImage:
                          'https://i.pinimg.com/564x/d1/b0/20/d1b020920db659d93955a0c057a18afe.jpg',
                    ),
                    CardPost(
                      imgUrl:
                          'https://i.pinimg.com/564x/8c/24/7f/8c247fbf0059d5877645138543a0cc71.jpg',
                      name: 'Anya Taylor',
                      description: 'And we ent with the beginning "He.."',
                      perfilImage:
                          'https://i.pinimg.com/564x/85/49/9d/85499d16fb900ae36b1cf5f85146bbbd.jpg',
                    ),
                    CardPost(
                      imgUrl:
                          'https://i.pinimg.com/564x/45/27/97/452797ddc0ee24619a8af6963f52d09a.jpg',
                      name: 'Violet Bostom',
                      description: 'And we ent with the beginning "He.."',
                      perfilImage:
                          'https://i.pinimg.com/564x/9e/30/40/9e3040c29946239e2a8df6178f2457f7.jpg',
                    ),
                    CardPost(
                      imgUrl:
                          'https://i.pinimg.com/564x/67/b1/de/67b1defdddbcf6255f53291711974896.jpg',
                      name: 'Jhon Hamilton',
                      description: 'And we ent with the beginning "He.."',
                      perfilImage:
                          'https://i.pinimg.com/564x/53/ae/30/53ae30911bf76d43cc38de850f4417c2.jpg',
                    ),
                    CardPost(
                      imgUrl:
                          'https://i.pinimg.com/564x/d1/25/25/d12525c89eac81b9d3f80f92ea2dd915.jpg',
                      name: 'Caroll Herner',
                      description: 'And we ent with the beginning "He.."',
                      perfilImage:
                          'https://i.pinimg.com/564x/65/58/16/655816a097d496fcfc1d0ff551df1679.jpg',
                    ),
                  ],
                ),
              ),
            )),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          height: size.height * .35,
          child: CustomPaint(
            painter: PaintBorder(curveRadius: 30),
            child: Container(
              child: Stack(
                children: [
                  Positioned(
                      top: size.height * 0.02,
                      left: 0,
                      right: 0,
                      child: const HeaderApp()),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: size.height * .12,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CircleHistory(
                            imgUrl:
                                'https://i.pinimg.com/564x/75/fd/1c/75fd1cd1e6adcd1e27820689de5abeaf.jpg',
                            name: 'Sherry'),
                        CircleHistory(
                            imgUrl:
                                'https://i.pinimg.com/564x/19/b6/fa/19b6fa6c5ebfadd4945c70afe89f169d.jpg',
                            name: 'Roger'),
                        CircleHistory(
                            imgUrl:
                                'https://i.pinimg.com/564x/fe/99/e5/fe99e514ad8f140eb9fc7adbf00d4018.jpg',
                            name: 'Andrea'),
                        CircleHistory(
                          imgUrl:
                              'https://i.pinimg.com/564x/e4/bb/f8/e4bbf8da732e4b32b9c84afa8aee3faa.jpg',
                          name: 'Nick',
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
