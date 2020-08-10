import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:photo_share_app_test/CardTop.dart';
import 'package:photo_share_app_test/CardBottom.dart';

class CardComponent extends StatelessWidget {
  CardComponent({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Column(
          children: [
            Column(
              children: [
                CardTopBar(),
                GestureDetector(
                  child: Container(
                    child: Image.network(
                      "https://picsum.photos/id/565/800/700",
                      fit: BoxFit.cover,
                    ),
                  ),
                  onDoubleTap: () {
                    print("you clicked on me");
                  },
                ),
                CardBottomBar(),
              ],
            ),
          ],
        ));
  }
}
