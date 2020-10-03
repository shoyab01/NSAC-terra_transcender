import 'dart:math';
import 'package:flutter/material.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import '../../models/entry.dart';
import '../shared/entries_helper.dart' as entriesHelper;
import '../shared/drawer.dart';
import './shared/section_outline_tiles.dart';

class EntriesShow extends StatefulWidget {
  final String title;
  final Entry entry;

  EntriesShow({Key key, this.entry, this.title}) : super(key: key);

  @override
  _EntriesShowState createState() => new _EntriesShowState();
}

class _EntriesShowState extends State<EntriesShow> {
  Entry entry;

  @override
  void initState() {
    super.initState();

    // prefer passed-in existing entry than fetching via title
    if ( widget.entry != null ) {
      setState((){ this.entry = widget.entry; });
    } else {
      Entry.fetch(title: widget.title).then( (Entry fetchedEntry) {
        setState((){
          this.entry = fetchedEntry;
        });
      });
    }
  }

  var _netImagesList =
  [
    "https://pixabay.com/photos/comet-lovejoy-from-iss-602287/",
    "data:image/jpeg;base64,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",
    "https://www.google.com/imgres?imgurl=http%3A%2F%2Fastronomy.com%2F~%2Fmedia%2F00809E90E70E462A942334638E9BE1B6.jpg&imgrefurl=https%3A%2F%2Fastronomy.com%2Fnews%2F2019%2F08%2Fnew-images-illuminate-milky-ways-mysterious-far-side&tbnid=OKxIL9Rc_DFZ7M&vet=12ahUKEwjEurLu2ZLsAhXemksFHU7OCtoQMygCegUIARDCAQ..i&docid=eU0wYX5nzub4rM&w=1024&h=662&q=real%20milkyway&ved=2ahUKEwjEurLu2ZLsAhXemksFHU7OCtoQMygCegUIARDCAQ",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcS8XllG0NJz-t5BwO-uDtogguKJNC9svwciag&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTDq2mZxdbyPK6LMdSusB6XKQMj9WTyF0O00Q&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQroVcnIhuUfsNLOcv6HECPX6qaniMfQ-rGtw&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRZW1ZW7p2MBOVomRqLuWXdpW7JOmx6r7mbfQ&usqp=CAU",
    "data:image/jpeg;base64,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",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQatJ7SXN0_-KeJgur0hm3h5j-3gRKULL1B-g&usqp=CAU",
  ];

  final _random = new Random();
  
  @override
  Widget build(BuildContext context) {
    final Widget content = ( entry == null ) ? (
                             new SliverFillRemaining(
                               child: new Center(
                                 child: new CircularProgressIndicator()
                               )
                             )
                           ) : (
                             new SliverList(
                               delegate: new SliverChildListDelegate(_contentsList(context))
                             )
                           );

    return new Scaffold(
      backgroundColor: Colors.lightBlue[50],
      //endDrawer: WikiFlutterDrawer(currentEntry: entry, currentSectionId: 0),//////////////////////////////////
      body: SafeArea(
        child: new CustomScrollView(
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 256.0,
              floating: true,
              // snap: true,
              flexibleSpace: new FlexibleSpaceBar(
                title: _buildTitle(),
                centerTitle: true,
                background: new Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    _buildCoverImg(),
                    // NOTE use this to distinguish white image from white text
                    new Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/sunshinefromiss.jpg"), fit: BoxFit.cover),
                      ),
                      child: Image.network(
                        _netImagesList[_random.nextInt(_netImagesList.length)],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ]
                )
              ),
            ),
            content
          ]
        ),
      ),
    );
  }

  Widget _buildTitle() {
    //final titleStyle = Theme.of(context).textTheme.title.copyWith(color: Colors.white, fontFamily: 'Serif');
    final titleStyle = Font_Style().montserrat_Bold(Colors.white, 19);
    final text = ( entry != null ) ? entry.displayTitle : widget.title;
    return new Text(text, style: titleStyle);
  }

  Widget _buildCoverImg() {
    if (entry != null && entry.coverImgSrc != null) {
      return new Image.network(entry.coverImgSrc, fit: BoxFit.cover);
    } else {
      return new Image.asset('assets/placeholder.jpg', fit: BoxFit.cover);
    }
  }

  List<Widget> _contentsList(BuildContext context) {
    List<Widget> widgetsList = [];

    // title
    // widgetsList.add(new Text(entry['lead']['displaytitle']));

    // description
    if (entry.description != null) {
      widgetsList.add(
        new entriesHelper.HintTile(
          text: entry.description,
          icon: const Icon(Icons.format_quote),
          botPadding: false,
        )
      );
    }

    // hatnotes
    for (String hatnote in entry.hatnotes) {
      widgetsList.add(
        new entriesHelper.HintTile.withHtmlStr(
          htmlStr: hatnote,
          botPadding: false,
        )
      );
    }

    // main section
    widgetsList
      ..add(
        new Container(
          padding: const EdgeInsets.all(16.0),
          child: new entriesHelper.SectionHtmlWrapper(entry: entry, sectionId: 0))
        )
      ..add(const Divider());

    // remaining sections list
    widgetsList.addAll(_remainingSectionsOutline());

    return widgetsList;
  }

  List<Widget> _remainingSectionsOutline () {
    if (entry.sections.length < 1) { return []; }

    return sectionOutlineTiles(entry, rootSectionId: 0, inDrawer: false);
  }
}
