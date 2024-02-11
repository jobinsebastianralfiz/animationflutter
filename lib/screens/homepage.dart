import 'package:animationsflutter/screens/details.dart';
import 'package:animationsflutter/widgets/apptext.dart';
import 'package:flutter/material.dart';

import '../models/activity_models.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> activitiesList = [];
  GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _addactivity();
    });
  }

  void _addactivity() {
    List<Activity> _activities = [
      Activity(
        name: 'Hiking at Yosemite National Park',
        location: 'California, USA',
        imageUrl: 'assets/img/hiking.jpg',
        price: 0,
      ),
      Activity(
        name: 'Skiing in Aspen',
        location: 'Aspen, Colorado, USA',
        imageUrl: 'assets/img/skiing.jpg',
        price: 100,
      ),
      Activity(
        name: 'Skydiving in Dubai',
        location: 'Dubai, United Arab Emirates',
        imageUrl: 'assets/img/skydiving.jpg',
        price: 300,
      ),
      Activity(
        name: 'Scuba Diving in Great Barrier Reef',
        location: 'Queensland, Australia',
        imageUrl: 'assets/img/scuba.jpg',
        price: 150,
      ),
    ];

    Future ft = Future(() {});
    _activities.forEach((Activity activity) {
      ft = ft.then((value) {
        return Future.delayed(Duration(milliseconds: 500), () {
          activitiesList.add(buildCard(activity));
          _listKey.currentState!.insertItem(activitiesList.length - 1);
        });
      });
    });
  }

  Tween<Offset> _offest = Tween(begin: Offset(1, 0), end: Offset(0, 0));

  double targetValue = 24.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff162035),
      body: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0, end: 1),
                  curve: Curves.easeIn,
                  duration: const Duration(seconds: 1),
                  builder: (BuildContext context, double val, Widget? child) {
                    return Opacity(
                      opacity: val,
                      child: Padding(
                        padding: EdgeInsets.only(top: val * 100),
                        child: child,
                      ),
                    );
                  },
                  child: AppText(
                    data: "Pick Your \nFavorite Activity",
                    color: Colors.white,
                    size: 26,
                  )),
              SizedBox(
                height: 10,
              ),
              Flexible(
                  child: AnimatedList(
                key: _listKey,
                initialItemCount: activitiesList.length,
                itemBuilder: (context, index, animation) {
                  return SlideTransition(
                    position: animation.drive(_offest),
                    child: activitiesList[index],
                  );
                },
              )),
              SizedBox(
                height: 20,
              ),
            ],
          )),
    );
  }

  Card buildCard(Activity activity) {
    return Card(
      color: Color(0xff59567B),
      child: Container(
        height: 100,
        child: Center(
          child: ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Details(
                            activity: activity,
                          )));
            },
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Hero(
                tag: 'activity-img-${activity.imageUrl}',
                child: Image.asset(
                  activity.imageUrl,
                  height: 100,
                ),
              ),
            ),
            trailing: AppText(
              data: activity.price.toString(),
              color: Colors.white,
            ),
            title: AppText(
              data: activity.name,
              color: Colors.white,
            ),
            subtitle: AppText(
              data: activity.location,
              color: Colors.white54,
            ),
          ),
        ),
      ),
    );
  }
}
