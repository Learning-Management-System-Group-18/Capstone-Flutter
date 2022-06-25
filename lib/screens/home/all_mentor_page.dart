import 'package:capstone_flutter/controllers/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/icon.dart';
import '../../widgets/item_listview.dart';
import '../../widgets/text.dart';

class AllMentorPage extends StatefulWidget {
  const AllMentorPage({Key? key}) : super(key: key);

  @override
  State<AllMentorPage> createState() => _AllMentorPageState();
}

class _AllMentorPageState extends State<AllMentorPage> {
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
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      Provider.of<HomeController>(context, listen: false).getDataAllCourse();
    });
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

  Widget _defaultListView(HomeController homeController) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return ListView.builder(
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.amber,
                radius: 20,
              ),
              title: UrbanistText().blackBold('Ini nama', 16),
              subtitle: UrbanistText().blackNormal('Ini pekerjaan', 14),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);

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
            ? UrbanistText().blackBold('All Mentors', 20)
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
              child: !_searchBoolean
                  ? _defaultListView(homeController)
                  : _searchListView(),
            ),
          ],
        ),
      ),
    );
  }
}
