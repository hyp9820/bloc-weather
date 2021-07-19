import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class DetailsPage extends StatelessWidget {
  final String? id;
  final String? url;
  final String? desc;
  final String? photographer;
  final String? likes;
  final String? publishedOn;
  final int index;
  DetailsPage(
      {required this.id,
      required this.url,
      required this.desc,
      required this.photographer,
      required this.likes,
      required this.publishedOn,
      required this.index});

  Future<Null> _share(context) async {
    final RenderBox box = context.findRenderObject();
    if (Platform.isAndroid) {
      var response = await get(Uri.parse(this.url ?? ""));
      final documentDirectory = (await getExternalStorageDirectory())?.path;
      File imgFile = new File('$documentDirectory/${this.id}.png');
      imgFile.writeAsBytesSync(response.bodyBytes);
      print("==>$documentDirectory >>>>>>>>>>>>>>>>>>>>");
      Share.shareFiles(['$documentDirectory/${this.id}.png'],
          subject: 'Natures Image',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    } else {
      Share.share('Hey! Checkout this cool Unsplash Image',
          subject: 'Natures Image',
          sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Hero(
                tag: 'logo$index',
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                      image: NetworkImage(url ?? ""),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 250,
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Image By $photographer',
                              style: TextStyle(
                                color: Colors.lightBlueAccent,
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 5),
                            Row(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.pink,
                                  size: 20,
                                ),
                                SizedBox(width: 5),
                                Text(
                                  "$likes",
                                  style: TextStyle(
                                    color: Colors.lightBlueAccent,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            Divider(),
                            Text(
                              desc != null ? "Description:\n$desc" : "",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(height: 5),
                            Text(
                              "Published on: $publishedOn",
                              style: TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                style: TextButton.styleFrom(
                                  padding: EdgeInsets.fromLTRB(0, 15, 5, 15),
                                  backgroundColor: Colors.lightBlueAccent,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.arrow_back_ios_new,
                                      color: Colors.black,
                                      size: 20,
                                      semanticLabel: 'Share',
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Back',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  _share(context);
                                },
                                style: TextButton.styleFrom(
                                  // padding: EdgeInsets.symmetric(vertical: 15),
                                  padding: EdgeInsets.fromLTRB(0, 15, 5, 15),
                                  backgroundColor: Colors.lightBlueAccent,
                                  // shape: RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(10),
                                  // ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.share,
                                      color: Colors.black,
                                      size: 20,
                                      semanticLabel: 'Share',
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Share',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
