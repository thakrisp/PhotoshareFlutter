import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}

const List<Choice> choices = const <Choice>[
  const Choice(title: 'Car', icon: Icons.directions_car),
  const Choice(title: 'Bicycle', icon: Icons.directions_bike),
  const Choice(title: 'Boat', icon: Icons.directions_boat),
  const Choice(title: 'Bus', icon: Icons.directions_bus),
  const Choice(title: 'Train', icon: Icons.directions_railway),
  const Choice(title: 'Walk', icon: Icons.directions_walk),
];

class CardTopBar extends StatelessWidget {
  CardTopBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                    image:
                        new NetworkImage("https://i.imgur.com/BoN9kdC.png"))),
          ),
          title:
              Text("CJ Johnson", style: TextStyle(fontWeight: FontWeight.bold)),
          trailing: Icon(Icons.more_horiz),
        ),
      ),
    );
  }
}
