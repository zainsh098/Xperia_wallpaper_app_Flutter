import 'package:flutter/material.dart';

import '../model/constants.dart';
import '../view/search_query.dart';

class SearchBar1 extends StatelessWidget {
  const SearchBar1({
    Key? key,
    required this.queryController,
  }) : super(key: key);

  final TextEditingController queryController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: kBaseColor,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        margin: const EdgeInsets.symmetric(horizontal: 25),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                controller: queryController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                ),
                onSubmitted: (_) => FocusScope.of(context).unfocus(),
              ),
            ),
            GestureDetector(
              onTap: () {
                if (queryController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          SearchQuery(queryController: queryController.text),
                    ),
                  );
                }
              },
              child: const Icon(Icons.search),
            ),
          ],
        ),
      ),
    );
  }
}
