import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin{
  AnimationController ?_controller;
  Animation<Color?>? _colorAnimation;
  Animation<double?>? _sizeAnimation;
  Animation<double> ?_curve;

  bool isFav=false;


  @override
  void initState() {
   _controller=AnimationController(
     duration: Duration(milliseconds: 500),

       vsync: this
   );

   _curve=CurvedAnimation(parent: _controller!, curve: Curves.slowMiddle);


   _colorAnimation = ColorTween(begin: Colors.grey[400], end: Colors.red).animate(_curve!);
_sizeAnimation=TweenSequence(
  <TweenSequenceItem<double>>[

    TweenSequenceItem<double>(tween: Tween(begin: 30,end: 50), weight: 50),
    TweenSequenceItem<double>(tween: Tween(begin: 50,end: 30), weight: 50),

  ]
).animate(_curve!);

   //_controller!.forward();

   _controller!.addListener(() {

     print(_controller!.value);
     print(_colorAnimation!.value);
   });

   _controller!.addStatusListener((status) {

    if(status==AnimationStatus.completed){
      setState(() {

        isFav=true;

      });
    }
    if(status==AnimationStatus.dismissed){

      setState(() {
        isFav=false;
      });
    }

   });




    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(

        animation: _controller!,

        builder:(context,_){

          return IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: _colorAnimation!.value,
                  size: _sizeAnimation!.value,
                ),
                onPressed: () {

               isFav?_controller!.reverse():_controller!.forward();



                },
              );


        }

    );



  }
}