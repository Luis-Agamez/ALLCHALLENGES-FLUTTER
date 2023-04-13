import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 60;
    return SafeArea(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              child: SizedBox(
            height: height,
            child: TextField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  suffixIcon: Icon(
                    Icons.search,
                    color: Colors.black.withOpacity(0.7),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide.none,
                  ),
                  hintStyle: TextStyle(
                      color: Colors.grey[700],
                      fontWeight: FontWeight.w700,
                      fontSize: 14),
                  hintText: 'Search'),
            ),
          )),
          const SizedBox(width: 10),
          Container(
            width: height - 10,
            height: height - 10,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              shape: BoxShape.circle,
              color: Colors.white,
              image: const DecorationImage(
                image: NetworkImage(
                    'https://img.freepik.com/free-psd/3d-illustration-person-with-sunglasses_23-2149436188.jpg?w=740&t=st=1676928561~exp=1676929161~hmac=c85ed83a65716f095fba7e7a4041987b158178823c31a2ec1667bd09beb85108',
                    scale: 1),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
