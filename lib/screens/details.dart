import 'package:animationsflutter/models/activity_models.dart';
import 'package:animationsflutter/widgets/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:lorem_ipsum/lorem_ipsum.dart';



class Details extends StatelessWidget {

  final Activity? activity;
  Details({ @required this.activity });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
               tag: 'activity-img-${activity!.imageUrl}',
                child: Image.asset(
                  '${activity!.imageUrl}',
                  height: 460,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              SizedBox(height: 30),
              ListTile(
                  title: Text(
                     activity!.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey[800]
                      )
                  ),
                  subtitle: Text(
                      '\$${activity!.price} Only',
                      style: TextStyle(letterSpacing: 1)
                  ),
                  trailing: Heart()
              ),
              Padding(
                  padding: EdgeInsets.all(18),
                  child: Text(
                      loremIpsum(words: 60, paragraphs: 3, initWithLorem: true)
                     , style: TextStyle(
                          color: Colors.grey[600],
                          height: 1.4
                      )
                  )
              ),
            ],
          ),
        )
    );
  }
}