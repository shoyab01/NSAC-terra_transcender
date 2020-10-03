import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:terra_transcender/ThemeData/fontstyle.dart';

class Astronauts extends StatefulWidget {
  @override
  _AstronautsState createState() => _AstronautsState();
}

class _AstronautsState extends State<Astronauts> {
  final _searchFetcher = new _Fetcher();
  String _searchingQuery = '';
  List<_EntryWithSummary> _fetchedSearchingEntries = [];

  final _astronautImageUrl =
  [
    "assets/kalpana_chawla.jpg", //0
    "assets/mae_carol_jemisaon.jpeg", //1
    "assets/neil_armstrong.jpg", //2
    "assets/buzz_aldrin.jpeg", //3
    "assets/marc_garneau.jpg", //4
    "assets/guion_bluford.jpeg", //5
    "assets/scott_kelly.jpg", //6
    "assets/alexei_leonov.jpeg", //7
    "assets/pete_conrad.jpeg", //8
    "assets/chris_hadfield.jpg", //9
    "assets/rakesh_sharma.jpg", //10
    "assets/sally_ride.jpg", //11
  ];
  final _astronautName =
  [
    "Kalpana Chawla", //0
    "Mae Carol Jemison", //1
    "Neil Armstrong", //2
    "Buzz Aldrin", //3
    "Marc Garneau", //4
    "Guion Bluford", //5
    "Scott Kelly", //6
    "Alexei Leonov", //7
    "Pete Conrad",  //8
    "Chris Hadfield", //9
    "Rakesh Sharma", //10
    "Sally Ride", //11
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                Icons.arrow_back_ios,
                size: 24.0,
                color: Font_Style.secondaryLightColor,
              )),
          title: Text(
            "Sapiens In Space",
            style: Font_Style()
                .montserrat_SemiBold(Font_Style.secondaryLightColor, 24.0),
          ),
          elevation: 0.0,
          centerTitle: true,
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              Container(
                height: 300.0.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/sunshinefromiss.jpg"), fit: BoxFit.cover),
                ),
                child: Container(
                  padding: EdgeInsets.only(
                      left: 10.0.w, right: 10.0.w, top: 10.0.h, bottom: 10.0.h),
                  child: CustomScrollView(slivers: <Widget>[
                    SliverList(delegate: SliverChildListDelegate([_searchBar()])),
                    _buildContent(context),
                  ]),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                  child: Text("Some prominent Astronauts :", style: Font_Style().montserrat_Bold(Font_Style.secondaryColor, 22),)),
              Expanded(
                child: Container(
                  padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h, left: 10.0.w, right: 10.0.w),
                  child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                    children: List.generate(12,(index){
                      return astronautCard(_astronautImageUrl[index], _astronautName[index]);
                    }),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget astronautCard(String imUrl, String name) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: new BorderRadius.all(
              Radius.circular(10.0),
          ),
        color: Font_Style.secondaryColor
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                    image: AssetImage(imUrl), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 2.0.h, bottom: 2.0.h, left: 3.0.w, right: 3.0.w),
            height: 23.0.h,
              child: Text(name, textAlign: TextAlign.center, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_SemiBold(Font_Style.primaryColor, 16),)),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    if (_fetchedSearchingEntries == null) {
      return new SliverFillRemaining(
          child: new Center(child: new CircularProgressIndicator()));
    }

    return new SliverList(
        delegate: new SliverChildListDelegate(_buildEntriesList(context)));
  }

  Widget _searchBar() {
    return new Container(
        margin: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
        child: new Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0,),
              color: Font_Style.secondaryColor.withOpacity(0.7),
            ),
            //height: 50.0.h,
            child: TextField(
              keyboardType: TextInputType.text,
              cursorColor: Font_Style.primaryColor.withOpacity(0.5),
              style: Font_Style().montserrat_medium(null, 17),
              onChanged: _handleSearchTextChanged,
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0,),
                  borderSide: BorderSide(
                      color: Font_Style.secondaryColorWithOpacity, width: 1.0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0,),
                  borderSide: BorderSide(
                      color: Font_Style.secondaryColorWithOpacity, width: 1.0),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0,),
                  borderSide: BorderSide(
                      color: Font_Style.secondaryColorWithOpacity, width: 1.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0,),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0,),
                  borderSide: BorderSide(color: Colors.red, width: 1.0),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(7.0,),
                  borderSide: BorderSide(
                      color: Font_Style.secondaryColorWithOpacity, width: 1.0),
                ),
                floatingLabelBehavior: FloatingLabelBehavior.always,
                hintText: "Search Astronaut",
                hintStyle: Font_Style().montserrat_Regular(
                    Font_Style.primaryColor.withOpacity(0.7), 17),
                labelStyle: Font_Style().montserrat_SemiBold(
                    Font_Style.primaryColor.withOpacity(0.7), 17),
                suffixIcon: Icon(
                  Icons.search,
                  size: 24,
                  color: Font_Style.primaryColor.withOpacity(0.7),
                ),
                counterText: "",
              ),
            )));
  }

  void _handleSearchTextChanged(String str) {
    if (str == _searchingQuery) {
      return;
    }
    if (str == '') {
      return;
    }

    setState(() {
      _searchingQuery = str;
      _fetchedSearchingEntries = null;
    });

    _searchFetcher
        .search(str)
        .then((List<_EntryWithSummary> fetchedSearchingEntries) {
      setState(() {
        _fetchedSearchingEntries = fetchedSearchingEntries;
      });
    });
  }

  List<Widget> _buildEntriesList(BuildContext context) {
    List<Widget> list = [];

    if (_fetchedSearchingEntries.isNotEmpty) {
      for (_EntryWithSummary e in _fetchedSearchingEntries) {
        list
          ..add(
            new ListTile(
                //isThreeLine: true,
                dense: true,
                title: new Text(
                  e.title, style: Font_Style().montserrat_Regular(
                    Font_Style.primaryColor, 15),
                ),
                subtitle: new RichText(
                  text: new TextSpan(
                      text: e.summary,
                      style: Font_Style().montserrat_Regular(
                          Font_Style.primaryColor, 15),),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/entries/${e.title}");
                }),
          )
          ..add(const Divider());
      }

      list.removeLast(); // remove last divider
    }

    return [
      new Container(
          margin: const EdgeInsets.all(8.0),
          child: new Card(
            color: Font_Style.secondaryColor.withOpacity(0.7),
            child: new Column(children: list),
          ))
    ];
  }
}

class _Fetcher {
  http.Client client = new http.Client();

  Future<List<_EntryWithSummary>> search(String str) async {
    client.close();

    client = new http.Client();

    final String url =
        "https://en.wikipedia.org/w/api.php?action=opensearch&format=json&errorformat=bc&search=$str&namespace=0&limit=10&suggest=1&utf8=1&formatversion=2";

    final List fetched = json.decode(await client.read(url)) as List;

    client.close();

    List<_EntryWithSummary> entries = [];
    for (var i = 0; i < (fetched[1] as List).length; i++) {
      entries.add(
          new _EntryWithSummary(title: fetched[1][i], summary: fetched[2][i]));
    }

    return entries;
  }
}

class _EntryWithSummary {
  final String title;
  final String summary;

  _EntryWithSummary({this.title, this.summary});
}
