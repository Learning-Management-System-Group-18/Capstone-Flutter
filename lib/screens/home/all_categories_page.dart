import 'package:flutter/material.dart';

import '../../constants/icon.dart';
import '../../widgets/item_listview.dart';
import '../../widgets/text.dart';

class AllCategoriesPage extends StatefulWidget {
  const AllCategoriesPage({Key? key}) : super(key: key);

  @override
  State<AllCategoriesPage> createState() => _AllCategoriesPageState();
}

class _AllCategoriesPageState extends State<AllCategoriesPage> {
  final List kategori = [
    "Category 1sdsdsd",
    "Category 2",
    "Category 3",
    "Category 4",
    "Category 5",
    "Category 6",
    "Category 3",
    "Category 4",
    "Category 5",
    "Category 6",
    "Category 3",
    "Category 4",
    "Category 5",
    "Category 6",
  ];
  TextEditingController _searchQueryController = TextEditingController();
  final bool _isSearching = false;
  String searchQuery = "Search query";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchQueryController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        title: UrbanistText().blackBold('All Categories', 18),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: RepoIcon().search,
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView.builder(
                itemCount: kategori.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return ItemCategory(
                    kategori: kategori[index],
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return const ItemAllCourse();
                },
                itemCount: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: RepoIcon().arrowCircle,
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.length < 3) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Center(
            child: Text(
              "Search term must be longer than two letters.",
            ),
          )
        ],
      );
    }
    return Column(
      children: const [
        // StreamBuilder(
        //   stream: InheritedBlocs.of(context).searchBloc.searchResults,
        //   builder: (context, AsyncSnapshot<List<Result>> snapshot) {
        //     if (!snapshot.hasData) {
        //       return Column(
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: <Widget>[
        //           Center(child: CircularProgressIndicator()),
        //         ],
        //       );
        //     } else if (snapshot.data.length == 0) {
        //       return Column(
        //         children: <Widget>[
        //           Text(
        //             "No Results Found.",
        //           ),
        //         ],
        //       );
        //     } else {
        //       var results = snapshot.data;
        //       return ListView.builder(
        //         itemCount: results.length,
        //         itemBuilder: (context, index) {
        //           var result = results[index];
        //           return ListTile(
        //             title: Text(result.title),
        //           );
        //         },
        //       );
        //     }
        //   },
        // ),
      ],
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Column();
  }
}
