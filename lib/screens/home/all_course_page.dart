import 'package:flutter/material.dart';

import '../../constants/icon.dart';
import '../../widgets/item_listview.dart';
import '../../widgets/text.dart';

class AllCoursePage extends StatefulWidget {
  const AllCoursePage({Key? key}) : super(key: key);

  @override
  State<AllCoursePage> createState() => _AllCoursePageState();
}

class _AllCoursePageState extends State<AllCoursePage> {
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
  bool _searchBoolean = false;
  List<int> _searchIndexList = [];

  final List<String> _list = [
    'English Textbook',
    'Japanese Textbook',
    'English Vocabulary',
    'Japanese Vocabulary'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _searchQueryController = TextEditingController();
  }

  Widget _searchTextField() {
    return TextField(
      onChanged: (String s) {
        setState(() {
          _searchIndexList = [];
          for (int i = 0; i < _list.length; i++) {
            if (_list[i].toLowerCase().contains(s.toLowerCase())) {
              _searchIndexList.add(i);
            }
          }
        });
      },
      autofocus: true,
      cursorColor: const Color.fromRGBO(51, 94, 247, 3),
      style: const TextStyle(
          color: Colors.black, fontSize: 20, fontFamily: 'Urbanist'),
      textInputAction: TextInputAction.search,
      decoration: const InputDecoration(
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(51, 94, 247, 3))),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color.fromRGBO(51, 94, 247, 3))),
        hintText: 'Search',
        hintStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
        ),
      ),
    );
  }

  Widget _searchListView() {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: _searchIndexList.length,
        itemBuilder: (context, index) {
          index = _searchIndexList[index];
          return Card(child: ListTile(title: Text(_list[index])));
        });
  }

  Widget _defaultListView() {
    return ListView.builder(
        itemCount: _list.length,
        itemBuilder: (context, index) {
          return const ItemAllCourse();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: RepoIcon().arrowCircle,
        ),
        elevation: 0.0,
        title: !_searchBoolean
            ? UrbanistText().blackBold('All Courses', 20)
            : _searchTextField(),
        actions: !_searchBoolean
            ? [
                IconButton(
                  icon: RepoIcon().search,
                  onPressed: () {
                    setState(
                      () {
                        _searchBoolean = true;
                        _searchIndexList = [];
                      },
                    );
                  },
                ),
              ]
            : [
                IconButton(
                  icon: const Icon(
                    Icons.clear,
                    color: Color.fromRGBO(51, 94, 247, 3),
                  ),
                  onPressed: () {
                    setState(
                      () {
                        _searchBoolean = false;
                      },
                    );
                  },
                )
              ],
      ),
      body: Container(
        decoration: const BoxDecoration(color: Colors.white),
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          children: [
            Expanded(
              child: !_searchBoolean ? _defaultListView() : _searchListView(),
            ),
          ],
        ),
      ),
    );
  }
}
