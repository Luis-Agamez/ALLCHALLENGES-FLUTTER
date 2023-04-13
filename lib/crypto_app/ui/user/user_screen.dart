import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final backgroundColor = Color(0xFF1C1C1E);
    return Scaffold(
        backgroundColor: backgroundColor,
        body: Container(
          padding: const EdgeInsets.only(top: 50, left: 15, right: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Your Account',
                      style: TextStyle(
                          fontFamily: 'BJBold',
                          fontSize: 32,
                          letterSpacing: 1,
                          color: Colors.white),
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white.withOpacity(.2)),
                      child: Center(
                          child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 26,
                        ),
                      )),
                    ),
                  ],
                ),
                Container(
                  padding: const EdgeInsets.only(top: 50),
                  child: Column(
                    children: [
                      Container(
                        width: size.width * .9,
                        height: size.height * .25,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: const Color(0xFF26262A)),
                        child: Stack(
                          fit: StackFit.expand,
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                                top: -40,
                                left: size.width * .35,
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(40),
                                      border: Border.all(
                                          color: Colors.white, width: 2)),
                                  child: CircleAvatar(
                                    radius: 25,
                                    child: Image.asset(
                                        'assets/cryptoImg/user_4.png'),
                                  ),
                                )),
                            Positioned(
                                top: 10,
                                left: size.width * .47,
                                child: Container(
                                    width: 50,
                                    height: 50,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF1E61E3),
                                        borderRadius: BorderRadius.circular(25),
                                        border: Border.all(
                                            color: Colors.black, width: 5)),
                                    child: const Center(
                                      child: Icon(Icons.camera_alt,
                                          size: 18, color: Colors.white),
                                    ))),
                            Positioned(
                                left: size.width * .25,
                                top: size.width * .15,
                                child: const Text(
                                  'Jhon Doe',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'BJMedium',
                                    fontSize: 32,
                                    letterSpacing: 1,
                                  ),
                                )),
                            Positioned(
                                top: size.height * .15,
                                left: size.width * .15,
                                child: Container(
                                  width: size.width * .6,
                                  height: size.height * .07,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Colors.white.withOpacity(.2)),
                                  child: const Center(
                                    child: Text(
                                      'Edit Profile',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'BJMedium',
                                        fontSize: 24,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ),
                                )),
                            const Positioned(
                                top: 25,
                                right: 15,
                                child: Icon(
                                  Icons.ios_share_outlined,
                                  color: Colors.grey,
                                  size: 32,
                                )),
                            const Positioned(
                                top: 25,
                                left: 15,
                                child: Icon(
                                  Icons.assured_workload,
                                  color: Colors.grey,
                                  size: 32,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 23),
                        width: size.width * .9,
                        height: size.height * .2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xFF26262A)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'SHORT BIOGRAPHY',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.6),
                                fontFamily: 'BJBold',
                                fontSize: 24,
                                letterSpacing: 1,
                              ),
                            ),
                            Text(
                              'encompasses medieval cities, Alpine villages and Mediterranean beaches. Paris.',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.6),
                                fontFamily: 'BJRegular',
                                fontSize: 18,
                                letterSpacing: 1,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 23),
                        width: size.width * .9,
                        height: size.height * .18,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xFF26262A)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'CONNECTED APPS',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.6),
                                fontFamily: 'BJBold',
                                fontSize: 24,
                                letterSpacing: 1,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SocialBox(
                                  icon: Icon(
                                    Icons.facebook,
                                    color: Colors.blue[800],
                                    size: 40,
                                  ),
                                ),
                                const SocialBox(
                                  icon: Icon(
                                    Icons.wechat_sharp,
                                    color: Color.fromARGB(255, 10, 202, 17),
                                    size: 40,
                                  ),
                                ),
                                const SocialBox(
                                  icon: Icon(Icons.telegram,
                                      color: Color.fromARGB(255, 32, 108, 194),
                                      size: 40),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(top: 23),
                        width: size.width * .9,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: const Color(0xFF26262A)),
                        child: Column(
                          children: [
                            Text(
                              'LAST TRANSACTIONS',
                              style: TextStyle(
                                color: Colors.white.withOpacity(.6),
                                fontFamily: 'BJBold',
                                fontSize: 24,
                                letterSpacing: 1,
                              ),
                            ),
                            const SizedBox(height: 20),
                            _TransactionItem(
                                size: size,
                                color: const Color.fromARGB(255, 185, 17, 5)),
                            _TransactionItem(
                                size: size,
                                color: const Color.fromARGB(255, 10, 202, 17)),
                            _TransactionItem(
                                size: size,
                                color: const Color.fromARGB(255, 10, 202, 17))
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                )
              ],
            ),
          ),
        ));
  }
}

class _TransactionItem extends StatelessWidget {
  const _TransactionItem({
    super.key,
    required this.size,
    required this.color,
  });

  final Size size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width * .9,
      height: size.height * .1,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Container(
                width: 15,
                height: 15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.5), color: color),
              ),
              const SizedBox(
                width: 5,
              ),
              const Text('Sent Litecoin',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'BJRegular',
                    fontSize: 18,
                    letterSpacing: 1,
                  ))
            ]),
            const Text('-0.049866012 LTC',
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'BJRegular',
                  fontSize: 18,
                  letterSpacing: 1,
                ))
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Jul 26 2022 To MtdnRPIso',
                style: TextStyle(
                  color: Colors.white.withOpacity(.6),
                  fontFamily: 'BJRegular',
                  fontSize: 18,
                  letterSpacing: 1,
                )),
            Text('-\$3.15',
                style: TextStyle(
                  color: Colors.white.withOpacity(.6),
                  fontFamily: 'BJRegular',
                  fontSize: 18,
                  letterSpacing: 1,
                ))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        const Divider(
          color: Colors.grey,
          height: 1,
        )
      ]),
    );
  }
}

class SocialBox extends StatelessWidget {
  const SocialBox({
    super.key,
    required this.icon,
  });

  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30), color: Colors.white),
      child: icon,
    );
  }
}
