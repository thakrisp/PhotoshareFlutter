import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:share/share.dart';

class CardBottomBar extends StatefulWidget {
  @override
  _CardBottomBar createState() => _CardBottomBar();
}

class _CardBottomBar extends State<CardBottomBar> {
  bool _bookmarked = false;
  bool _liked = false;

  void toggleBookmark() {
    setState(() {
      _bookmarked = !_bookmarked;
    });
  }

  void toggleLiked() {
    setState(() {
      _liked = !_liked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Container(
          child: Row(
        children: [
          IconButton(
            icon: (!_liked
                ? Icon(Icons.favorite_border)
                : Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
            tooltip: 'tell someone you liked their photo',
            onPressed: () {
              setState(() {
                toggleLiked();
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.share),
            tooltip: 'share this image with friends',
            onPressed: () {
              Share.share('send this image to friends');
            },
          ),
          Expanded(
            child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: IconButton(
                  icon: (!_bookmarked
                      ? Icon(Icons.bookmark_border)
                      : Icon(
                          Icons.bookmark,
                          color: Colors.yellow,
                        )),
                  tooltip: 'Bookmark this image',
                  onPressed: () {
                    setState(() {
                      toggleBookmark();
                    });
                  },
                )),
          )
        ],
      )),
    ));
  }
}
