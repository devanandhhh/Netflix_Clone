import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone/api/api.dart';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:netflix_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_clone/presentation/search/widgets/search_result.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
  late Future<List<Movie>> searchResult;
  @override
  void initState() {
    searchResult = Future.value([]);
    super.initState();
  }

  final searchController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void onSearchTextChanged(String newText) {
    if (newText.isEmpty) {
      setState(() {
        searchResult = Future.value([]);
      });
    } else {
      setState(() {
        searchResult = Api().getSearchResult(newText);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                onChanged: onSearchTextChanged,
                controller: searchController,
                backgroundColor: Colors.grey.withOpacity(0.5),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                suffixIcon: const Icon(
                  CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey,
                ),
                style: const TextStyle(color: Colors.white),
              ),
              kheight,

              Expanded(
                  child: searchController.text.isEmpty
                      ? const SearchIdleWidget()
                      : FutureBuilder(
                          future: searchResult,
                          builder: (context, snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return const Text('Error no result found');
                            } else {
                              return  SearchResultWidget(snapshot: snapshot,);
                            }
                          },
                        ))
              // const  Expanded(child: SearchResultWidget())
            ],
          ),
        ),
      ),
    ));
  }
}
