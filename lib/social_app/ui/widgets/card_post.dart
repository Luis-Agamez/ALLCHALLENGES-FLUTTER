import 'package:app_one/social_app/ui/details/details_screen.dart';
import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class CardPost extends StatelessWidget {
  const CardPost(
      {Key? key,
      required this.imgUrl,
      required this.description,
      required this.name,
      required this.perfilImage})
      : super(key: key);
  final String imgUrl;
  final String description;
  final String name;
  final String perfilImage;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Container(
        width: size.width,
        height: size.height * .62,
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Stack(
          children: [
            Positioned(
                top: size.height * .10,
                left: 0,
                right: 0,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                      height: size.height * .4,
                      width: size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15)),
                      child: Image.network(
                        imgUrl,
                        fit: BoxFit.cover,
                      )),
                )),
            Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  width: size.width,
                  height: size.height * .08,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.favorite,
                                color: Color(0XFFED2738),
                                size: 28,
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.message_rounded,
                                color: Colors.black,
                                size: 28,
                              ),
                              SizedBox(width: 20),
                              Icon(
                                Icons.send_sharp,
                                color: Colors.black,
                                size: 28,
                              )
                            ],
                          ),
                          const Icon(
                            Icons.bookmarks_outlined,
                            color: Colors.black,
                            size: 28,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'PBold',
                                fontSize: 14),
                          ),
                          Text(
                            description,
                            style: const TextStyle(
                                color: Colors.grey,
                                fontFamily: 'PRegular',
                                fontSize: 12),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
            Positioned(
                top: 10,
                left: 0,
                right: 0,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageRouteBuilder(
                                  transitionDuration:
                                      const Duration(milliseconds: 600),
                                  pageBuilder: (_, animation, __) {
                                    return FadeTransition(
                                        opacity: animation,
                                        child: const DetailsScreen());
                                  },
                                ),
                              );
                            },
                            child: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: HomeScreenSocialApp.primaryColor,
                                      width: 3)),
                              child: CircleAvatar(
                                radius: 25,
                                backgroundImage: NetworkImage(perfilImage),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            name,
                            style: const TextStyle(
                                color: Colors.black,
                                fontFamily: 'PMedium',
                                fontSize: 16),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: HomeScreenSocialApp.primaryColor),
                            child: const Center(
                                child: Icon(
                              Icons.check,
                              color: Colors.white,
                              size: 20,
                            )),
                          ),
                        ],
                      ),
                      const Icon(
                        Icons.more_horiz_outlined,
                        color: Colors.black,
                        size: 25,
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
