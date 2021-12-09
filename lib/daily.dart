import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:new_hydrate/user_view.dart';
//import 'package:new_hydrate/auth.dart';
import 'package:new_hydrate/sign_up.dart';
import 'package:new_hydrate/loading.dart';
import 'package:new_hydrate/driver.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class daily extends StatefulWidget {
  const daily({Key? key}) : super(key: key);

  @override
  _daily createState() => _daily();
}

class _daily extends State<daily> {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    double cups = 2;
    double max = 16;
    double total = double.parse(((cups/15.5).toStringAsFixed(2)));
    return Scaffold(
        appBar: AppBar(
          title: Text("Daily Progress"),
        ),
        body: ListView(
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10.0)),
            Column(
              children: [
                Text(
                    "Daily Recommended Intake is 15.5 cups for men and 11.5 cups for women."),
                Text("Please select gender..."),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  TextButton(
                    onPressed: () {
                      //incrementing counter
                      setState(() {
                        max = 15.5;
                        SfRadialGauge(axes: <RadialAxis>[
                          RadialAxis(
                              minimum: 0,
                              maximum: max,
                              ranges: <GaugeRange>[
                                GaugeRange(
                                    startValue: 0,
                                    endValue: 5,
                                    color: Colors.red,
                                    startWidth: 10,
                                    endWidth: 10),
                                GaugeRange(
                                    startValue: 5,
                                    endValue: 12,
                                    color: Colors.orange,
                                    startWidth: 10,
                                    endWidth: 10),
                                GaugeRange(
                                    startValue: 12,
                                    endValue: 16,
                                    color: Colors.green,
                                    startWidth: 10,
                                    endWidth: 10)
                              ],
                              pointers: <GaugePointer>[
                                NeedlePointer(value: cups)
                              ])
                        ]);
                      });
                    },
                    child: const Text("Male"),
                  )

                  /*ElevatedButton(
                    onPressed: () => {
                      setState(() {
                        double cups = 15.5;
                        max = 15.5;
                      })
                    },
                    child: Text("Male"),
                  ),

                  ElevatedButton(
                    onPressed: () => {cups = 11.5, max = 11.5},
                    child: Text("Female"),
                  ),*/
                ]),
                SfRadialGauge(axes: <RadialAxis>[
                  RadialAxis(minimum: 0, maximum: max, ranges: <GaugeRange>[
                    GaugeRange(
                        startValue: 0,
                        endValue: 5,
                        color: Colors.red,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 5,
                        endValue: 12,
                        color: Colors.orange,
                        startWidth: 10,
                        endWidth: 10),
                    GaugeRange(
                        startValue: 12,
                        endValue: 16,
                        color: Colors.green,
                        startWidth: 10,
                        endWidth: 10)
                  ], pointers: <GaugePointer>[
                    NeedlePointer(value: cups)
                  ])
                ]),
                Text("You are $cups cups in. You are $total of the way there!"),
              ],
            ),
          ],
        ));
  }
}

/*
class genderButton extends StatelessWidget {
  genderButton({Key? key, required this.buttonText, required this.cups})
      : super(key: key);
  String buttonText;
  double cups;
  //1 oz = .125 cups
  double total = 0.125 * 1 ;//replace 1 for variable in user_view that tallies
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          ElevatedButton(
            onPressed: () => {
              SfRadialGauge(axes: <RadialAxis>[
                RadialAxis(minimum: 0, maximum: cups, ranges: <GaugeRange>[
                  GaugeRange(
                      startValue: 0,
                      endValue: 50,
                      color: Colors.red,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 50,
                      endValue: 100,
                      color: Colors.orange,
                      startWidth: 10,
                      endWidth: 10),
                  GaugeRange(
                      startValue: 100,
                      endValue: 150,
                      color: Colors.green,
                      startWidth: 10,
                      endWidth: 10)
                ], pointers: <GaugePointer>[
                  NeedlePointer(value: 90)
                ])
              ])
            },
            child: Text(buttonText),
          ),
        ],
      ),
    );
  }
}
*/