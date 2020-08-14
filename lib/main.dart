import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:share/share.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PhotoShare Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'PicsTagrapham'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class Data {
  static final getData = [
    {
      'name': 'Semore Butts',
      'image': 'https://picsum.photos/id/538/400/500',
      'icon': 'https://randomuser.me/api/portraits/lego/2.jpg',
      'likes': 5,
      'liked': false,
      'bookmarked': false
    },
    {
      'name': 'John Smith',
      'image': 'https://picsum.photos/id/555/400/500',
      'icon': 'https://randomuser.me/api/portraits/lego/6.jpg',
      'likes': 2,
      'liked': true,
      'bookmarked': false
    },
    {
      'name': 'Abigail Turpentin',
      'image': 'https://picsum.photos/id/558/400/500',
      'icon': 'https://randomuser.me/api/portraits/lego/1.jpg',
      'likes': 7,
      'liked': false,
      'bookmarked': true
    },
  ];
}

class _MyHomePageState extends State<MyHomePage> {
  var data = Data.getData;

  List<bool> _bookmarked = [];
  List<bool> _likes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.camera_enhance),
        title: Text(widget.title),
        actions: [
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: Icon(Icons.notifications),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(5, 0, 15, 0),
            child: Icon(Icons.add_a_photo),
          )
        ],
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(5),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Container(
            child: Column(
              children: [_cardComponent(data, index)],
            ),
          );
        },
      ),
    );
  }

  Widget _cardComponent(data, index) {
    if (_likes.length < data.length && _bookmarked.length < data.length) {
      _bookmarked.add(data[index]['bookmarked']);
      _likes.add(data[index]['liked']);
    }
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          children: [
            Column(
              children: [
                _cardTop(data[index]),
                GestureDetector(
                  child: Container(
                    height: 400,
                    decoration: new BoxDecoration(
                        image: new DecorationImage(
                            fit: BoxFit.fill,
                            image:
                                NetworkImage(data[index]['image'].toString()))),
                  ),
                  onDoubleTap: () {
                    print("you clicked on me");
                  },
                ),
                _cardBottom(data[index], index),
              ],
            ),
          ],
        ));
  }

  Widget _cardTop(data) {
    return Center(
      child: Container(
        child: ListTile(
          leading: Container(
            width: 50.0,
            height: 50.0,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(data['icon'].toString()))),
          ),
          title: Text(data['name'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.more_horiz),
        ),
      ),
    );
  }

  Widget _cardBottom(data, index) {
    return Center(
        child: Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
      child: Container(
          child: Row(
        children: [
          IconButton(
            icon: (!_likes[index]
                ? Icon(Icons.favorite_border)
                : Icon(
                    Icons.favorite,
                    color: Colors.red,
                  )),
            tooltip: 'tell someone you liked their photo',
            onPressed: () {
              setState(() {
                _likes[index] = !_likes[index];
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
                  icon: (!_bookmarked[index]
                      ? Icon(Icons.bookmark_border)
                      : Icon(
                          Icons.bookmark,
                          color: Colors.yellow,
                        )),
                  tooltip: 'Bookmark this image',
                  onPressed: () {
                    setState(() {
                      _bookmarked[index] = !_bookmarked[index];
                    });
                  },
                )),
          )
        ],
      )),
    ));
  }
}
