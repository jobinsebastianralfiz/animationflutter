import 'package:flutter/material.dart';

class SampleScreen extends StatefulWidget {
  const SampleScreen({super.key});

  @override
  State<SampleScreen> createState() => _SampleScreenState();
}

class _SampleScreenState extends State<SampleScreen> {

  double _marign=0;
  double _width=250;
  Color _color=Colors.red;
  double _opacity=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

      body: AnimatedContainer(
        margin: EdgeInsets.all(_marign),
        color: _color,
        width: _width,
        duration: Duration(seconds: 2),




        child: Column(

          children: [
            ElevatedButton(onPressed: (){

              setState(() {

                _marign=50;
                _width=400;
                _color=Colors.blueGrey;

              });

            }, child: Text("Animate"))

             ,AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacity,
               child: Container(
                 height: 150,
                 width: 200,
                 color: Colors.red,
               ),
             ),

            ElevatedButton(onPressed: (){

              setState(() {

               _opacity=0;

              });

            }, child: Text("Hide"))
          ],


        ),
      ),
    );
  }
}
