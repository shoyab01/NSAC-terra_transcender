import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:keyboard_avoider/keyboard_avoider.dart';
import 'package:terra_transcender/ThemeData/fontstyle.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MoreOverview extends StatefulWidget {
  @override
  _MoreOverviewState createState() => _MoreOverviewState();
}

class _MoreOverviewState extends State<MoreOverview> {

  YoutubePlayerController _controllerYtOverview;
  bool _isPlayerReady = false;
  PlayerState _playerState;
  YoutubeMetaData _videoMetaData;

  final _youtubeUrlList =
  [
    "https://youtu.be/Bcxqr4X7a-A",
    "https://www.youtube.com/watch?v=CHMIfOecrlo",
    "https://www.youtube.com/watch?v=p1AxBGV4WL0",
    "https://www.youtube.com/watch?v=5L6eqgnmlPo",
    "https://www.youtube.com/watch?v=5qXEI79LmTw",
    "https://www.youtube.com/watch?v=AipdIH5TzH8",
    "https://www.youtube.com/watch?v=Mlt7W6QDqvI",
  ];

  final _youtubeTitleList =
  [
    "Down to Earth – All in This Together",
    "The Overview Effect",
    "Overview Effect gave me perspective",
    "Down To Earth - The Overview Effect",
    "Experience the Overview Effect with an astronaut [VR/360]",
    'Astronauts Explain the “Overview Effect”',
    "How Going to Space Changes the Way You Think Forever",
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: KeyboardAvoider(
          autoScroll: true,
          child: Container(
            padding: EdgeInsets.only(top: 10.0.h, bottom: 10.0.h, left: 14.0.w, right: 14.0.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 24.0,
                            color: Colors.amber[600],
                          )),
                      SizedBox(width: 12.0.w,),
                      Flexible(
                        child: Text(
                          "Videos on Overview Effect",
                          textAlign: TextAlign.center,
                          style: Font_Style()
                              .montserrat_SemiBold(Colors.amber[600], 24.0),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 15.0.h,),
                  youtubeVideo(_youtubeUrlList[0], _youtubeTitleList[0]),
                  youtubeVideo(_youtubeUrlList[1], _youtubeTitleList[2]),
                  youtubeVideo(_youtubeUrlList[3], _youtubeTitleList[3]),
                  youtubeVideo(_youtubeUrlList[4], _youtubeTitleList[4]),
                  youtubeVideo(_youtubeUrlList[5], _youtubeTitleList[5]),
                  youtubeVideo(_youtubeUrlList[6], _youtubeTitleList[6]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void listener() {
    if (_isPlayerReady && mounted && !_controllerYtOverview.value.isFullScreen) {
      setState(() {
        _playerState = _controllerYtOverview.value.playerState;
        _videoMetaData = _controllerYtOverview.metadata;
      });
    }
  }

  Widget youtubeVideo(String youtubeUrl, String title) {
    _controllerYtOverview = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeUrl),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )..addListener(listener);
    return Container(
      margin: EdgeInsets.only(top: 15.0.h, bottom: 15.0.h),
      color: Font_Style.primaryColor,
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                  padding: EdgeInsets.only(left: 8.0.w, right: 8.0.w, top: 5.0.h,),
                  child: Text(title, textAlign: TextAlign.left, textDirection: TextDirection.ltr, overflow: TextOverflow.ellipsis, style: Font_Style().montserrat_medium(Colors.white.withOpacity(0.8), 20),))),
          SizedBox(height: 8.0.h,),
          YoutubePlayer(
            controller: _controllerYtOverview,
            showVideoProgressIndicator: true,
            progressIndicatorColor: Colors.red,
            topActions: <Widget>[
              const SizedBox(width: 8.0),
              Expanded(
                child: Text(
                  _controllerYtOverview.metadata.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ],
            bottomActions: [
              CurrentPosition(),
              ProgressBar(isExpanded: true),
              RemainingDuration(),
            ],progressColors: ProgressBarColors(
            playedColor: Colors.red,
            handleColor: Colors.redAccent,
          ),
          ),
        ],
      ),
    );
  }
}
