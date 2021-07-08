import 'package:flutter/material.dart';
class Recommand extends StatelessWidget {
  const Recommand({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title : Text("Recommand"),
      ),
      body : SafeArea(
          child:Column(
            children: [
              SizedBox(
                height : 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: 160.0,
                      color: Colors.red,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.blue,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.green,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      width: 160.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height : 500,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: <Widget>[
                    Container(
                      height: 150.0,
                      color: Colors.red,
                    ),
                    Container(
                      height: 150.0,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 150.0,
                      color: Colors.green,
                    ),
                    Container(
                      height: 150.0,
                      color: Colors.yellow,
                    ),
                    Container(
                      height: 150.0,
                      color: Colors.orange,
                    ),
                  ],
                ),
              )
            ],
          )
      ),
    );
  }
}
