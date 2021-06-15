/*
 * @Author: zxj
 * @Date: 2021-06-06 13:30:45
 * @LastEditTime: 2021-06-07 16:26:43
 * @Description: 
 */

import 'package:a_red_book/page/video/video_logic.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:like_button/like_button.dart';
import 'package:video_player/video_player.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';

import 'bottom_comment_widget.dart';
import 'bottom_share_widget.dart';
import 'like_gesture_widget.dart';

class VideoItem extends StatefulWidget {
  VideoItem({Key key}) : super(key: key);

  @override
  _VideoItemState createState() => _VideoItemState();
}

class _VideoItemState extends State<VideoItem> {
  final VideoLogic logic = Get.put(VideoLogic());
  VideoPlayerController _controller;
  bool _playing = false;
  Stream _durationState;
  Duration position;
  Duration duration;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset('images/xhs_1623045207024.mp4')
      ..addListener(() {
        print(_controller.value.position);
        position = _controller.value.position;
        print(_controller.value.duration);
        duration = _controller.value.duration;
        setState(() {});
      });

    _controller.initialize();
    _controller.play();
    _controller.setLooping(true);
    _videoStop();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  _videoStop() {
    _playing = !_playing;
    if (_playing) {
      _controller.play();
    } else {
      _controller.pause();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    // final width = size.width;
    // final height = size.height;
    // double scale = 1;
    // double videoLayoutWidth;
    // double videoLayoutHeight;
    // if (_controller.value.isInitialized) {
    //   double rateWidthHeightContent =
    //       MediaQuery.of(context).size.width / height;
    //   double rateWidthContentVideo =
    //       MediaQuery.of(context).size.width / _controller.value.size.width;
    //   double heightVideoByRate =
    //       _controller.value.size.height * rateWidthContentVideo;
    //   print(
    //       '视频宽:${_controller.value.size.width} 视频高:${_controller.value.size.height}');
    //   print(
    //       '视频宽高比:${_controller.value.size.width / _controller.value.size.height}');
    //   print(
    //       '屏幕宽:${MediaQuery.of(context).size.width}  高：${MediaQuery.of(context).size.height}');
    //   print('内容高度:${height}');
    //   print('内容宽高比例:$rateWidthHeightContent');
    //   print('比例:$rateWidthContentVideo');
    //   print('比例换算视频高度:$heightVideoByRate');
    //   if (height > heightVideoByRate) {
    //     double rateHeightContentVideo = height / _controller.value.size.height;
    //     videoLayoutHeight = heightVideoByRate;
    //     videoLayoutWidth = _controller.value.size.width;
    //     scale = height / videoLayoutHeight;
    //     print(
    //         'width:$videoLayoutWidth height:$videoLayoutHeight scale:$scale rate:$rateHeightContentVideo');
    //   }
    // }

    return Container(
      color: Colors.black,
      child: Stack(
        alignment: AlignmentDirectional.center,
        children: [
          LikeGestureWidget(
            onSingleTap: () {
              _videoStop();
            },
            child: Container(
              // height: videoLayoutHeight - 60,
              // width: videoLayoutWidth,
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 60, top: 28),
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
          // InkWell(
          //   onTap: () {
          //     _videoStop();
          //   },
          //   child: Container(
          //     // height: videoLayoutHeight - 60,
          //     // width: videoLayoutWidth,
          //     alignment: Alignment.center,
          //     padding: EdgeInsets.only(bottom: 60, top: 28),
          //     child: AspectRatio(
          //       aspectRatio: _controller.value.aspectRatio,
          //       child: VideoPlayer(_controller),
          //     ),
          //   ),
          // ),
          Positioned(
            top: 40,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.only(right: 20, left: 20),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {
                      showBottomShare();
                    },
                    child: Icon(
                      Icons.open_in_new,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          _playing == true
              ? Container()
              : Positioned(
                  child: Icon(
                    Icons.play_arrow,
                    color: Colors.white30,
                    size: 70,
                  ),
                ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  _videoUser(),
                  _videoName(),
                  _progressBar(),
                  _videoComment(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _videoUser() {
    return Container(
      child: Row(
        children: [
          Container(
            child: CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(
                  "https://pic4.zhimg.com/v2-1fb998118e443cf3539def7aaee7da71_is.jpg"),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            child: Text(
              "是镜子总会反光的",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: ScreenUtil().setHeight(35),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
                shape: MaterialStateProperty.all(
                    StadiumBorder(side: BorderSide(color: Colors.black12))),
              ),
              child: Text(
                "关注",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: ScreenUtil().setSp(20),
                ),
              ),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _videoName() {
    return Container(
      padding: EdgeInsets.only(top: 5, bottom: 5),
      child: Row(
        children: [
          Expanded(
            child: Text(
              "成都兜底哟有多大,二少夫人五色符 士大夫色额 二十五虽然额",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 10, left: 25),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.white24,
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Icon(
              Icons.open_in_full,
              color: Colors.white,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _videopressBar() {
    return Container(
      child: ProgressBar(
        progress: position,

        // buffered: Duration(milliseconds: 2000),
        total: duration,
        onSeek: (duration) {
          print('User selected a new time: $duration');
        },
      ),
    );
  }

  StreamBuilder _progressBar() {
    return StreamBuilder(
      stream: _durationState,
      builder: (context, snapshot) {
        final durationState = snapshot.data;
        final progress = durationState?.progress ?? Duration.zero;
        final buffered = durationState?.buffered ?? Duration.zero;
        final total = durationState?.total ?? Duration.zero;
        return ProgressBar(
          progress: position,
          total: duration,
          progressBarColor: Colors.white,
          thumbRadius: 2.0,
          thumbColor: Colors.white,
          timeLabelTextStyle: TextStyle(
            color: Colors.white.withOpacity(0),
          ),
          baseBarColor: Colors.white.withOpacity(0.24),
          onSeek: (duration) {
            print("duration");
            print(duration);
            setState(() {
              _controller.seekTo(duration);
            });
          },
        );
      },
    );
  }

  Widget _videoComment() {
    return Container(
      child: Row(
        children: [
          Container(
            width: ScreenUtil().setWidth(350),
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
                color: Colors.white10,
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: Row(
              children: [
                Icon(
                  Icons.movie,
                  color: Colors.white,
                  size: 20,
                ),
                Container(
                  padding: EdgeInsets.only(right: 10, left: 10),
                  child: Text(
                    "|",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Text(
                  "发弹幕",
                  style: TextStyle(
                      color: Colors.white70, fontSize: ScreenUtil().setSp(20)),
                )
              ],
            ),
          ),
          Expanded(
            child: LikeButton(
              likeCount: 123,
              likeCountPadding: EdgeInsets.only(left: 0),
              likeBuilder: (bool) {
                if (bool) {
                  return Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 25,
                  );
                } else {
                  return Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 25,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: LikeButton(
              likeCount: 123,
              likeCountPadding: EdgeInsets.only(left: 0),
              likeBuilder: (bool) {
                if (bool) {
                  return Icon(
                    Icons.star,
                    color: Colors.yellow,
                    size: 28,
                  );
                } else {
                  return Icon(
                    Icons.star_border,
                    color: Colors.white,
                    size: 28,
                  );
                }
              },
            ),
          ),
          Expanded(
            child: InkWell(
              onTap: () {
                showBottomComment();
              },
              child: Row(
                children: [
                  Icon(
                    Icons.rate_review,
                    color: Colors.white,
                    size: 22,
                  ),
                  Container(
                    child: Text(
                      "123",
                      style: TextStyle(color: Colors.white70),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  //展示评论
  void showBottomComment() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, //可滚动 解除showModalBottomSheet最大显示屏幕一半的限制
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return BottomCommentWidget();
      },
    );
  }

  //展示分享
  void showBottomShare() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, //可滚动 解除showModalBottomSheet最大显示屏幕一半的限制
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      builder: (context) {
        return BottomshareWidget();
      },
    );
  }
}
