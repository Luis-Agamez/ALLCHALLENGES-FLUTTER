import 'package:flutter/material.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    const double height = 60;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: SizedBox(
          height: height,
          child: TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.grey[700],
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                hintStyle: TextStyle(
                    color: Colors.grey[400],
                    fontWeight: FontWeight.w700,
                    fontFamily: 'PMedium',
                    fontSize: 15),
                hintText: 'Search your pizza here'),
          ),
        )),
        const SizedBox(width: 10),
      ],
    );
  }
}
