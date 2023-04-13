import 'package:flutter/material.dart';

import '../home/home_screen.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    const backgroundColor = Color(0xFF1C1C1E);
    return Scaffold(
        bottomSheet: BottomText(size: size),
        backgroundColor: backgroundColor,
        body: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 40),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_ios,
                      size: 28,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  border: Border.all(
                                      color: HomeScreenSocialApp.primaryColor,
                                      width: 3)),
                              child: const CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    'https://i.pinimg.com/564x/5e/4a/e3/5e4ae3f967dedb0fa2b825151ca139ce.jpg'),
                              ),
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Ana de Armas',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: 'PBold',
                                          fontSize: 14),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color:
                                              HomeScreenSocialApp.primaryColor),
                                      child: const Center(
                                          child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                        size: 20,
                                      )),
                                    ),
                                  ],
                                ),
                                const Text(
                                  'Onlline',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontFamily: 'PRegular',
                                      fontSize: 12),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  const Icon(
                    Icons.more_horiz_outlined,
                    color: Colors.white,
                    size: 36,
                  )
                ],
              ),
            ),
            Expanded(
              child: ClipPath(
                clipper: _CurveTopClipper(),
                child: Container(
                  padding: const EdgeInsets.only(
                      top: 30, left: 20, right: 20, bottom: 80),
                  width: size.width,
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            width: 100,
                            height: 40,
                            margin: const EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(
                                color: backgroundColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: const Center(
                              child: Text(
                                'Today',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'PRegular',
                                    fontSize: 16),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const _Message(
                              isUser: true, text: 'Hi,Brian !', time: '2:21'),
                          const _Message(
                              isUser: true,
                              text:
                                  'Can you Send presentation file from Mr.Alex!',
                              time: '2:22 pm'),
                          const _Message(
                              isUser: false,
                              text: 'Yoo,sure Ana !',
                              time: '2:26 pm'),
                          const _Message(
                              isUser: false,
                              text:
                                  'Let me find that presentation at my laptop',
                              time: '2:27 pm'),
                          const _Message(
                              isUser: true,
                              text: 'Yes sure,take your Brian !',
                              time: '2:30 pm'),
                          const _Message(
                              isUser: true,
                              text:
                                  'Thank you for helping me!. You save my life hahaha!',
                              time: '2:31 pm'),
                          const _Message(
                              isUser: false,
                              text: 'Yoo,sure Ana',
                              time: '2:35 pm'),
                          const _Message(
                              isUser: true, text: 'Hi,Brian !', time: '2:21'),
                          const _Message(
                              isUser: true,
                              text:
                                  'Can you Send presentation file from Mr.Alex!',
                              time: '2:22 pm'),
                          const _Message(
                              isUser: false,
                              text: 'Yoo,sure Ana !',
                              time: '2:26 pm'),
                          const _Message(
                              isUser: false,
                              text:
                                  'Let me find that presentation at my laptop',
                              time: '2:27 pm'),
                          const _Message(
                              isUser: true,
                              text: 'Yes sure,take your Brian !',
                              time: '2:30 pm'),
                          const _Message(
                              isUser: true,
                              text:
                                  'Thank you for helping me!. You save my life hahaha!',
                              time: '2:31 pm'),
                          const _Message(
                              isUser: false,
                              text: 'Yoo,sure Ana',
                              time: '2:35 pm'),
                        ]),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    final lastName = TextEditingController(text: '');
    return Container(
      color: Colors.white,
      child: Container(
        width: size.width * .9,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 70,
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: const Color(0xFF1C1C1E),
            borderRadius: BorderRadius.circular(size.width * .2)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.white.withOpacity(.2),
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                  child: Icon(
                Icons.all_inclusive_outlined,
                size: 25,
                color: Colors.white,
              )),
            ),
            const SizedBox(width: 10),
            const Expanded(
                child: TextField(
              cursorColor: Colors.grey,
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                  hintText: "Type message",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontFamily: 'PRegular',
                  ),
                  border: InputBorder.none),
            )),
            const SizedBox(width: 10),
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: const Color(0XFF136EF4),
                  borderRadius: BorderRadius.circular(25)),
              child: const Center(
                  child: Icon(
                Icons.send,
                size: 25,
                color: Colors.white,
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class _CurveTopClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path()
      ..moveTo(0, 100)
      ..cubicTo(0, 40, size.width * 0.05, 45, size.width * 0.12, 40)
      ..lineTo(size.width * 0.12, 40)
      ..quadraticBezierTo(size.width * .5, 20, size.width * 0.86, 40)
      ..cubicTo(size.width * 0.93, 45, size.width * 0.98, 40, size.width, 100)
      ..lineTo(size.width, 100)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}

class _Message extends StatelessWidget {
  const _Message(
      {Key? key, required this.isUser, required this.text, required this.time})
      : super(key: key);
  final bool isUser;
  final String text;
  final String time;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment:
            isUser ? CrossAxisAlignment.start : CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isUser ? MainAxisAlignment.start : MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(
                  10,
                ),
                decoration: isUser
                    ? const BoxDecoration(
                        color: Color(0XFFCBDDF9),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15)))
                    : BoxDecoration(
                        color: Colors.grey.withOpacity(.5),
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(15),
                            topRight: Radius.circular(15),
                            bottomLeft: Radius.circular(15))),
                child: Container(
                  margin: EdgeInsets.zero,
                  width: size.width * .6,
                  child: Text(
                    text,
                    maxLines: 20,
                    style: const TextStyle(
                        color: Colors.black,
                        fontFamily: 'PRegular',
                        fontSize: 14),
                  ),
                ),
              ),
            ],
          ),
          Text(
            time,
            style: const TextStyle(
                color: Colors.grey, fontFamily: 'PRegular', fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class DataInput extends StatelessWidget {
  const DataInput({
    Key? key,
    required this.textController,
    required this.minimum,
    required this.placeholder,
    required this.subTitle,
    required this.type,
  }) : super(key: key);

  final TextEditingController textController;
  final TextInputType type;
  final String placeholder;
  final String subTitle;
  final int minimum;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: const Color.fromARGB(221, 241, 13, 13),
      autofocus: false,
      keyboardType: type,
      controller: textController,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      textCapitalization: TextCapitalization.words,
      validator: (value) {
        if (value == null) {
          return "Este Campo es requerido";
        }
        return value.length < minimum
            ? "Este campo  requiere minimo $minimum caracteres"
            : null;
      },
      decoration: decoration(subTitle, placeholder),
    );
  }
}

decoration(String labelText, String hintText) {
  return InputDecoration(
      labelStyle: const TextStyle(color: Color.fromARGB(221, 252, 252, 252)),
      labelText: labelText,
      hintText: hintText,
      floatingLabelBehavior: FloatingLabelBehavior.always,
      contentPadding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 10,
          borderSide: const BorderSide(color: Colors.black87)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 10,
          borderSide: const BorderSide(color: Colors.black87)),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 10,
          borderSide: const BorderSide(color: Colors.black87)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 10,
          borderSide: const BorderSide(color: Colors.black87)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          gapPadding: 10,
          borderSide: const BorderSide(color: Colors.black87)));
}
