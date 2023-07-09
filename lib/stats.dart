//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class RealtimeLineGraph extends StatefulWidget {
//   @override
//   _RealtimeLineGraphState createState() => _RealtimeLineGraphState();
// }
//
// class _RealtimeLineGraphState extends State<RealtimeLineGraph> {
//   List<DataPoint> dataPoints = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Replace 'your_collection' with the name of your Firestore collection
//     // Replace 'x_field' with the name of the field that contains the x-axis data
//     // Replace 'y_field' with the name of the field that contains the y-axis data
//     FirebaseFirestore.instance
//         .collection(FirebaseAuth.instance.currentUser?.email??'Unknown User')
//         .snapshots()
//         .listen((QuerySnapshot snapshot) {
//       setState(() {
//         dataPoints = snapshot.docs.map((DocumentSnapshot document) {
//           final data = document.data() as Map<String, dynamic>;
//           final x = data['datetime'].toDate();
//           final y = data['amount'];
//           final xValue = x.month;
//           final yValue = y;
//           return DataPoint(
//             xValue,
//             yValue,
//           );
//         }).toList();
//       });
//     });
//   }
//
//   dynamic _parseValue(dynamic value) {
//     if (value is String) {
//       return double.tryParse(value) ?? value;
//     } else if (value is Timestamp) {
//       final dateTime = value.toDate();
//       return dateTime.second;
//     } else if (value is num) {
//       return value;
//     } else {
//       return null; // or handle the unexpected data type according to your needs
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body:StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.email??'Unknown User').orderBy('amount',descending: true,).snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//           if (snapshot.hasError) {
//             return Scaffold(
//               body: Center(child: Text('Error fetching data')),
//             );
//           }
//           List<DocumentSnapshot> data = snapshot.data!.docs;
//
//           return CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(height: 36,),
//                         Padding(padding: EdgeInsets.all(24),
//                         child: Center(
//                           child: Text('Statistics',style: TextStyle(
//                             fontSize: 18,
//                             fontWeight: FontWeight.w500,
//                           ),),
//                         ),
//                         ),
//                         Container(
//                           child: SfCartesianChart(
//                             // plotAreaBorderWidth: 8,
//                           series: <LineSeries<DataPoint, num>>[
//                           LineSeries<DataPoint, num>(
//                             dataSource: dataPoints,
//                             xValueMapper: (DataPoint data, _) => data.x,
//                             yValueMapper: (DataPoint data, _) => data.y,
//                             ),
//                           ],
//                             primaryXAxis: NumericAxis(),
//                            primaryYAxis: NumericAxis(),
//                             ),
//                           ),
//                         SizedBox(
//                           height: 44,
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: Text('Top spending',style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//
//                   ],
//                 ),
//               ),
//               SliverPadding(
//                 padding: EdgeInsets.only(top: 26.0),
//                 sliver: SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                       String type = data[index]['what'];
//                       final amount = data[index]['amount'];
//                       final date = data[index]['datetime'];
//                       final DateTime date1 = date.toDate();
//                       return ListTile(
//                         title: Text(type),
//                         subtitle: Text('₹$amount  on ${date1.day}-${date1.month}-${date1.year}'),
//                         trailing: Icon(
//                           data[index]['type'] == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
//                           color: data[index]['type'] == 'Income' ? Colors.green : Colors.red,
//                         ),
//                         isThreeLine: true,
//                       );
//                     },
//                     childCount: data.length,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DataPoint {
//   final num x;
//   final num y;
//
//   DataPoint(this.x, this.y);
// }
//
//
// // Container(
// // child: SfCartesianChart(
// // series: <LineSeries<DataPoint, num>>[
// // LineSeries<DataPoint, num>(
// // dataSource: dataPoints,
// // xValueMapper: (DataPoint data, _) => data.x,
// // yValueMapper: (DataPoint data, _) => data.y,
// // ),
// // ],
// // primaryXAxis: NumericAxis(),
// // primaryYAxis: NumericAxis(),
// // ),
// // ),
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class RealtimeLineGraph extends StatefulWidget {
//   @override
//   _RealtimeLineGraphState createState() => _RealtimeLineGraphState();
// }
//
// class _RealtimeLineGraphState extends State<RealtimeLineGraph> {
//   List<DataPoint> dataPoints = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     FirebaseFirestore.instance
//         .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
//         .snapshots()
//         .listen((QuerySnapshot snapshot) {
//       setState(() {
//         dataPoints = snapshot.docs.map((DocumentSnapshot document) {
//           var data = document.data() as Map<String, dynamic>;
//           var x = data['datetime'].toDate();
//           var y = data['amount'];
//           var xValue = x.month;
//           var yValue = y;
//           return DataPoint(
//             xValue,
//             yValue,
//           );
//         }).toList();
//       });
//     });
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
//             .orderBy('amount', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//           if (snapshot.hasError) {
//             return Scaffold(
//               body: Center(child: Text('Error fetching data')),
//             );
//           }
//           List<DocumentSnapshot> data = snapshot.data!.docs;
//
//           return CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 36,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(24),
//                           child: Center(
//                             child: Text(
//                               'Statistics',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           child: SfCartesianChart(
//                             series: <LineSeries<DataPoint, num>>[
//                               LineSeries<DataPoint, num>(
//                                 dataSource: dataPoints,
//                                 xValueMapper: (DataPoint data, _) => data.x,
//                                 yValueMapper: (DataPoint data, _) => data.y,
//                               ),
//                             ],
//                             primaryXAxis: NumericAxis(),
//                             primaryYAxis: NumericAxis(),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 44,
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: Text(
//                                 'Top spending',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SliverPadding(
//                 padding: EdgeInsets.only(top: 26.0),
//                 sliver: SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                       String type = data[index]['what'];
//                       final amount = data[index]['amount'];
//                       final date = data[index]['datetime'];
//                       final DateTime date1 = date.toDate();
//                       return ListTile(
//                         title: Text(type),
//                         subtitle: Text(
//                             '₹$amount  on ${date1.day}-${date1.month}-${date1.year}'),
//                         trailing: Icon(
//                           data[index]['type'] == 'Income'
//                               ? Icons.arrow_downward
//                               : Icons.arrow_upward,
//                           color: data[index]['type'] == 'Income'
//                               ? Colors.green
//                               : Colors.red,
//                         ),
//                         isThreeLine: true,
//                       );
//                     },
//                     childCount: data.length,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DataPoint {
//   final num x;
//   final num y;
//
//   DataPoint(this.x, this.y);
// }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class RealtimeLineGraph extends StatefulWidget {
//   @override
//   _RealtimeLineGraphState createState() => _RealtimeLineGraphState();
// }
//
// class _RealtimeLineGraphState extends State<RealtimeLineGraph> {
//   List<DataPoint> dataPoints = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     fetchDataPoints();
//   }
//
//   void fetchDataPoints() {
//     FirebaseFirestore.instance
//         .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
//         .orderBy('datetime')
//         .snapshots()
//         .listen((QuerySnapshot snapshot) {
//       setState(() {
//         dataPoints = snapshot.docs.map((DocumentSnapshot document) {
//           var data = document.data() as Map<String, dynamic>;
//           var x = data['datetime'].toDate();
//           var y = data['amount'];
//           var xValue = x.month;
//           var yValue = y;
//           return DataPoint(xValue, yValue);
//         }).toList();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
//             .orderBy('amount', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//           if (snapshot.hasError) {
//             return Scaffold(
//               body: Center(child: Text('Error fetching data')),
//             );
//           }
//           List<DocumentSnapshot> data = snapshot.data!.docs;
//
//           return CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 36,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(24),
//                           child: Center(
//                             child: Text(
//                               'Statistics',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 300,
//                           child: SfCartesianChart(
//                             series: <LineSeries<DataPoint, num>>[
//                               LineSeries<DataPoint, num>(
//                                 dataSource: dataPoints,
//                                 xValueMapper: (DataPoint data, _) => data.x,
//                                 yValueMapper: (DataPoint data, _) => data.y,
//                               ),
//                             ],
//                             primaryXAxis: NumericAxis(),
//                             primaryYAxis: NumericAxis(),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 44,
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: Text(
//                                 'Top spending',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SliverPadding(
//                 padding: EdgeInsets.only(top: 26.0),
//                 sliver: SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                       String type = data[index]['what'];
//                       final amount = data[index]['amount'];
//                       final date = data[index]['datetime'];
//                       final DateTime date1 = date.toDate();
//                       return ListTile(
//                         title: Text(type),
//                         subtitle: Text('₹$amount  on ${date1.day}-${date1.month}-${date1.year}'),
//                         trailing: Icon(
//                           data[index]['type'] == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
//                           color: data[index]['type'] == 'Income' ? Colors.green : Colors.red,
//                         ),
//                         isThreeLine: true,
//                       );
//                     },
//                     childCount: data.length,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DataPoint {
//   final num x;
//   final num y;
//
//   DataPoint(this.x, this.y);
// }
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
//
// class RealtimeLineGraph extends StatefulWidget {
//   @override
//   _RealtimeLineGraphState createState() => _RealtimeLineGraphState();
// }
//
// class _RealtimeLineGraphState extends State<RealtimeLineGraph> {
//   List<DataPoint> dataPoints = [];
//
//   @override
//   void initState() {
//     super.initState();
//
//     fetchDataPoints();
//   }
//
//   void fetchDataPoints() {
//     FirebaseFirestore.instance
//         .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
//         // .orderBy('datetime')
//         .snapshots()
//         .listen((QuerySnapshot snapshot) {
//       setState(() {
//         Map<DateTime, num> dataMap = {};
//
//         for (var document in snapshot.docs) {
//           var data = document.data() as Map<String, dynamic>;
//           var x = data['datetime'].toDate();
//           var y = data['amount'];
//
//           // Sum the amounts for the same date
//           if (dataMap.containsKey(x)) {
//             dataMap[x] = (dataMap[x]! + y)!;
//           } else {
//             dataMap[x] = y;
//           }
//         }
//
//         dataPoints = dataMap.entries.map((entry) {
//           var xValue = entry.key.year;
//           var yValue = entry.value;
//           return DataPoint(xValue, yValue);
//         }).toList();
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
//             .orderBy('amount', descending: true)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               body: Center(child: CircularProgressIndicator()),
//             );
//           }
//           if (snapshot.hasError) {
//             return Scaffold(
//               body: Center(child: Text('Error fetching data')),
//             );
//           }
//           List<DocumentSnapshot> data = snapshot.data!.docs;
//
//           return CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 36,
//                         ),
//                         Padding(
//                           padding: EdgeInsets.all(24),
//                           child: Center(
//                             child: Text(
//                               'Statistics',
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           height: 300,
//                           child: SfCartesianChart(
//                             series: <LineSeries<DataPoint, num>>[
//                               LineSeries<DataPoint, num>(
//                                 dataSource: dataPoints,
//                                 xValueMapper: (DataPoint data, _) => data.x,
//                                 yValueMapper: (DataPoint data, _) => data.y,
//                               ),
//                             ],
//                             primaryXAxis: NumericAxis(),
//                             primaryYAxis: NumericAxis(),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 44,
//                         ),
//                         Row(
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left: 12.0),
//                               child: Text(
//                                 'Top spending',
//                                 style: TextStyle(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               SliverPadding(
//                 padding: EdgeInsets.only(top: 26.0),
//                 sliver: SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                       String type = data[index]['what'];
//                       final amount = data[index]['amount'];
//                       final date = data[index]['datetime'];
//                       final DateTime date1 = date.toDate();
//                       return ListTile(
//                         title: Text(type),
//                         subtitle: Text('₹$amount  on ${date1.day}-${date1.month}-${date1.year}'),
//                         trailing: Icon(
//                           data[index]['type'] == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
//                           color: data[index]['type'] == 'Income' ? Colors.green : Colors.red,
//                         ),
//                         isThreeLine: true,
//                       );
//                     },
//                     childCount: data.length,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
//
// class DataPoint {
//   final num x;
//   final num y;
//
//   DataPoint(this.x, this.y);
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class RealtimeLineGraph extends StatefulWidget {
  @override
  _RealtimeLineGraphState createState() => _RealtimeLineGraphState();
}

class _RealtimeLineGraphState extends State<RealtimeLineGraph> {
  List<DataPoint> dataPoints = [];

  @override
  String imp = 'Income';
  void initState() {
    super.initState();

    fetchDataPoints();
  }

  void fetchDataPoints() {
    FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
        .orderBy('datetime')
        .snapshots()
        .listen((QuerySnapshot snapshot) {
      setState(() {
        Map<DateTime, num> dataMap = {};

        for (var document in snapshot.docs) {
          var data = document.data() as Map<String, dynamic>;
          var x = data['datetime'].toDate();
          var y = data['amount'];

          // Filter the documents based on the desired field
          if (data['type'] == imp) {
            // Sum the amounts for the same date
            if (dataMap.containsKey(x)) {
              dataMap[x] = (dataMap[x]! + y)!;
            } else {
              dataMap[x] = y;
            }
          }
        }

        dataPoints = dataMap.entries.map((entry) {
          var xValue = entry.key;
          var yValue = entry.value;
          return DataPoint(xValue, yValue);
        }).toList();
      });
    });
  }


  // void fetchDataPoints() {
  //   FirebaseFirestore.instance
  //       .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
  //       .orderBy('datetime')
  //       // .where('type',isEqualTo: imp)
  //
  //       .snapshots()
  //       .listen((QuerySnapshot snapshot) {
  //     setState(() {
  //       Map<DateTime, num> dataMap = {};
  //
  //       for (var document in snapshot.docs) {
  //         var data = document.data() as Map<String, dynamic>;
  //         var x = data['datetime'].toDate();
  //         var y = data['amount'];
  //
  //         // Sum the amounts for the same date
  //         if (dataMap.containsKey(x)) {
  //           dataMap[x] = (dataMap[x]! + y)!;
  //         } else {
  //           dataMap[x] = y;
  //         }
  //       }
  //
  //       dataPoints = dataMap.entries.map((entry) {
  //         var xValue = entry.key;
  //         var yValue = entry.value;
  //         return DataPoint(xValue, yValue);
  //       }).toList();
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection(FirebaseAuth.instance.currentUser?.email ?? 'Unknown User')
            // .orderBy('amount', descending: true)
            .where('type',isEqualTo: imp)

            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            return Scaffold(
              body: Center(child: Text('Error fetching data')),
            );
          }
          List<DocumentSnapshot> data = snapshot.data!.docs;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 36,
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 24,bottom: 12),
                          child: Center(
                            child: Column(
                              children: [
                                Text(
                                  'Statistics',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black,
                                    fontSize: 24
                                  ),
                                  // TextStyle(
                                  //   fontSize: 18,
                                  //   fontWeight: FontWeight.w500,
                                  // ),
                                ),
                                Text('Total Transactions',style: TextStyle(
                                  fontSize: 8,
                                ),)
                              ],
                            ),
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.all(12),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //     children: [
                        //       GestureDetector(
                        //         onTap: (){
                        //           setState(() {
                        //             imp='Income';
                        //           });
                        //           fetchDataPoints();
                        //         },
                        //         child: Container(
                        //           width: MediaQuery.of(context).size.width*0.4,
                        //           height: 40,
                        //           decoration: BoxDecoration(
                        //             color: Color(0xffe65100),
                        //             borderRadius: BorderRadius.circular(12),
                        //           ),
                        //           child: Center(
                        //             child: Text('Income',style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 18.5,
                        //             ),),
                        //           ),
                        //         ),
                        //       ),
                        //       GestureDetector(
                        //         onTap: (){
                        //           setState(() {
                        //             imp='Expences';
                        //           });
                        //           fetchDataPoints();
                        //         },
                        //         child: Container(
                        //           width: MediaQuery.of(context).size.width*0.4,
                        //           height: 40,
                        //           decoration: BoxDecoration(
                        //             color: Color(0xffe65100),
                        //             borderRadius: BorderRadius.circular(12),
                        //           ),
                        //           child: Center(
                        //             child: Text('Expenses',style: TextStyle(
                        //               color: Colors.white,
                        //               fontSize: 17,
                        //             ),),
                        //           ),
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Container(
                          height: 300,
                          child: SfCartesianChart(
                            onZooming: (zoomingArgs) => dataPoints,
                            plotAreaBackgroundColor: Colors.white,
                            enableAxisAnimation: true,
                            series: <LineSeries<DataPoint, DateTime>>[
                              LineSeries<DataPoint, DateTime>(
                                dataSource: dataPoints,
                                xValueMapper: (DataPoint data, _) => data.x,
                                yValueMapper: (DataPoint data, _) => data.y,
                                dataLabelSettings:DataLabelSettings(isVisible : true),
                                opacity: 0.92,
                                // color: Colors.green,
                                color:  Color(0xffe65100),

                              ),

                            ],
                            primaryXAxis: DateTimeAxis(

                              dateFormat: DateFormat('yyyy , MMM '), // Format of the date displayed on the axis
                              intervalType: DateTimeIntervalType.days, // Interval type (e.g., days, months, years)
                              interval: 1, // Interval between two consecutive points on the axis
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                            ),
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                                edgeLabelPlacement: EdgeLabelPlacement.shift,
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    imp='Income';
                                  });
                                  fetchDataPoints();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe65100),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text('Income',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.5,
                                    ),),
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  setState(() {
                                    imp='Expences';
                                  });
                                  fetchDataPoints();
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0xffe65100),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Center(
                                    child: Text('Expenses',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 12.0),
                              child: Text(
                                'Valid Transactions',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Icon(Icons.arrow_drop_down_sharp,color: Colors.black,)
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 26.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      String type = data[index]['what'];
                      final amount = data[index]['amount'];
                      final date = data[index]['datetime'];
                      final DateTime date1 = date.toDate();
                      return ListTile(
                        title: Text(type),
                        subtitle: Text(
                            '₹$amount  on ${date1.day}-${date1.month}-${date1.year}'),
                        trailing: Icon(
                          data[index]['type'] == 'Income'
                              ? Icons.arrow_downward
                              : Icons.arrow_upward,
                          color: data[index]['type'] == 'Income'
                              ? Colors.green
                              : Colors.red,
                        ),
                        isThreeLine: true,
                      );
                    },
                    childCount: data.length,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DataPoint {
  final DateTime x;
  final num y;

  DataPoint(this.x, this.y);
}
