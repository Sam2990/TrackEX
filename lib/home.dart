// // import 'package:cloud_firestore/cloud_firestore.dart';
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:trackex/newdata.dart';
// // import 'main.dart';
// // import 'functions.dart';
// // class home extends StatefulWidget {
// //   const home({Key? key}) : super(key: key);
// //
// //   @override
// //   State<home> createState() => _homeState();
// // }
// //
// // class _homeState extends State<home> {
// //   @override
// //
// //   // User? user = FirebaseAuth.instance.currentUser;
// //   // String? displayName = user?.displayName;
// //   String? name = getUserName();
// //
// //
// //
// //   String TotalBalance= '4218.00';
// //   Widget build(BuildContext context) {
// //
// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: (){
// //           Navigator.of(context).push(MaterialPageRoute(builder: (context) => Newdata(),));
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //       body: FutureBuilder<QuerySnapshot>(
// //         future: FirebaseFirestore.instance.collection('your_collection_name').get(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Scaffold(
// //               body: Center(child: CircularProgressIndicator()),
// //             );
// //           }
// //           if (snapshot.hasError) {
// //             return Scaffold(
// //               body: Center(child: Text('Error fetching data')),
// //             );
// //           }
// //           List<DocumentSnapshot>? data = snapshot.data?.docs;
// //
// //           return Scaffold(
// //             floatingActionButton: FloatingActionButton(
// //               onPressed: () {
// //                 Navigator.of(context).push(
// //                   MaterialPageRoute(
// //                     builder: (context) => Newdata(),
// //                   ),
// //                 );
// //               },
// //               child: Icon(Icons.add),
// //             ),
// //             body: CustomScrollView(
// //               slivers: [
// //                 SliverToBoxAdapter(
// //                   child: Stack(
// //                     clipBehavior: Clip.none,
// //                     children: [
// //                       Container(
// //                         width: MediaQuery.of(context).size.width,
// //                         height: MediaQuery.of(context).size.height * 0.38,
// //                         decoration: BoxDecoration(
// //                           color: Color(0xfff56300),
// //                           borderRadius: BorderRadius.only(
// //                             bottomLeft: Radius.circular(18),
// //                             bottomRight: Radius.circular(18),
// //                           ),
// //                         ),
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             SizedBox(height: MediaQuery.of(context).size.height * 0.12,),
// //                             Row(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Container(
// //                                   child: Column(
// //                                     mainAxisAlignment: MainAxisAlignment.start,
// //                                     crossAxisAlignment: CrossAxisAlignment.start,
// //                                     children: [
// //                                       Padding(
// //                                         padding: const EdgeInsets.only(left: 18.0),
// //                                         child: Text(
// //                                           'Hey! Good to See You',
// //                                           style: TextStyle(
// //                                             color: Colors.white,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                       Padding(
// //                                         padding: const EdgeInsets.only(left: 16.0),
// //                                         child: Text(
// //                                           name ?? 'Unknown User',
// //                                           style: const TextStyle(
// //                                             color: Colors.white,
// //                                             fontSize: 28,
// //                                             fontWeight: FontWeight.bold,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                   margin: EdgeInsets.only(right: 12, left: 12),
// //                                   padding: EdgeInsets.all(0.2),
// //                                   decoration: BoxDecoration(
// //                                     color: Colors.white.withOpacity(0.28),
// //                                     borderRadius: BorderRadius.all(Radius.circular(12)),
// //                                   ),
// //                                   child: IconButton(
// //                                     onPressed: () {
// //                                       FirebaseAuth.instance.signOut();
// //                                     },
// //                                     icon: Icon(Icons.logout, color: Colors.white),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Positioned(
// //                         top: MediaQuery.of(context).size.height * 0.28,
// //                         left: MediaQuery.of(context).size.width * 0.08,
// //                         child: Container(
// //                           width: MediaQuery.of(context).size.width * 0.84,
// //                           height: MediaQuery.of(context).size.height * 0.2,
// //                           decoration: BoxDecoration(
// //                             color: Color(0xffe65100),
// //                             borderRadius: BorderRadius.all(Radius.circular(24)),
// //                           ),
// //                           child: Padding(
// //                             padding: const EdgeInsets.all(18.0),
// //                             child: Column(
// //                               mainAxisAlignment: MainAxisAlignment.start,
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   'Total Balance',
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 10,
// //                                   ),
// //                                 ),
// //                                 Text(
// //                                   '₹ ' + TotalBalance,
// //                                   style: TextStyle(
// //                                     color: Colors.white,
// //                                     fontSize: 28,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SliverList(
// //                   delegate: SliverChildBuilderDelegate(
// //                         (context, index) {
// //                       String type = data?[index]['type'];
// //                       return ListTile(
// //                         title: Text(type),
// //                       );
// //                     },
// //                     childCount: data?.length ?? 0,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       )
// //     );
// //   }
// // }
// //
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:trackex/newdata.dart';
// import 'main.dart';
// import 'functions.dart';
//
//
// class home extends StatefulWidget {
//   const home({Key? key}) : super(key: key);
//
//   @override
//   State<home> createState() => _homeState();
// }
//
// class _homeState extends State<home> {
//   @override
//   String? name = getUserName();
//   String TotalBalance = '4218.00';
//
// //
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: () {
// //           Navigator.of(context).push(
// //             MaterialPageRoute(builder: (context) => Newdata()),
// //           );
// //         },
// //         child: Icon(Icons.add),
// //       ),
// //       body: FutureBuilder<QuerySnapshot>(
// //         future:
// //             FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.email??'Unknown User').get(),
// //         builder: (context, snapshot) {
// //           if (snapshot.connectionState == ConnectionState.waiting) {
// //             return Scaffold(
// //               body: Center(child: CircularProgressIndicator()),
// //             );
// //           }
// //           if (snapshot.hasError) {
// //             return Scaffold(
// //               body: Center(child: Text('Error fetching data')),
// //             );
// //           }
// //           List<DocumentSnapshot>? data = snapshot.data?.docs;
// //
// //           return Scaffold(
// //             floatingActionButton: FloatingActionButton(
// //               onPressed: () {
// //                 Navigator.of(context).push(
// //                   MaterialPageRoute(
// //                     builder: (context) => Newdata(),
// //                   ),
// //                 );
// //               },
// //               child: Icon(Icons.add),
// //             ),
// //             body: CustomScrollView(
// //               slivers: [
// //                 SliverToBoxAdapter(
// //                   child: Stack(
// //                     clipBehavior: Clip.none,
// //                     children: [
// //                       Container(
// //                         width: MediaQuery.of(context).size.width,
// //                         height: MediaQuery.of(context).size.height * 0.38,
// //                         decoration: BoxDecoration(
// //                           color: Color(0xfff56300),
// //                           borderRadius: BorderRadius.only(
// //                             bottomLeft: Radius.circular(18),
// //                             bottomRight: Radius.circular(18),
// //                           ),
// //                         ),
// //                         child: Column(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             SizedBox(
// //                               height: MediaQuery.of(context).size.height * 0.12,
// //                             ),
// //                             Row(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Container(
// //                                   child: Column(
// //                                     mainAxisAlignment: MainAxisAlignment.start,
// //                                     crossAxisAlignment:
// //                                         CrossAxisAlignment.start,
// //                                     children: [
// //                                       Padding(
// //                                         padding:
// //                                             const EdgeInsets.only(left: 18.0),
// //                                         child: Text(
// //                                           'Hey! Good to See You',
// //                                           style: TextStyle(
// //                                             color: Colors.white,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                       Padding(
// //                                         padding:
// //                                             const EdgeInsets.only(left: 16.0),
// //                                         child: Text(
// //                                           name ?? 'Unknown User',
// //                                           style: const TextStyle(
// //                                             color: Colors.white,
// //                                             fontSize: 28,
// //                                             fontWeight: FontWeight.bold,
// //                                           ),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //                                 Container(
// //                                   margin: EdgeInsets.only(right: 12, left: 12),
// //                                   padding: EdgeInsets.all(0.2),
// //                                   decoration: BoxDecoration(
// //                                     color: Colors.white.withOpacity(0.28),
// //                                     borderRadius:
// //                                         BorderRadius.all(Radius.circular(12)),
// //                                   ),
// //                                   child: IconButton(
// //                                     onPressed: () {
// //                                       FirebaseAuth.instance.signOut();
// //                                     },
// //                                     icon:
// //                                         Icon(Icons.logout, color: Colors.white),
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       Positioned(
// //                         top: MediaQuery.of(context).size.height * 0.28,
// //                         left: MediaQuery.of(context).size.width * 0.08,
// //                         child: Hero(
// //                           tag: 'balance',
// //                           child: Container(
// //                             width: MediaQuery.of(context).size.width * 0.84,
// //                             height: MediaQuery.of(context).size.height * 0.2,
// //                             decoration: BoxDecoration(
// //                               color: Color(0xffe65100),
// //                               borderRadius:
// //                                   BorderRadius.all(Radius.circular(24)),
// //                             ),
// //                             child: Padding(
// //                               padding: const EdgeInsets.all(18.0),
// //                               child: Column(
// //                                 mainAxisAlignment: MainAxisAlignment.start,
// //                                 crossAxisAlignment: CrossAxisAlignment.start,
// //                                 children: [
// //                                   Text(
// //                                     'Total Balance',
// //                                     style: TextStyle(
// //                                       color: Colors.white,
// //                                       fontSize: 10,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     '₹ $TotalBalance',
// //                                     style: TextStyle(
// //                                       color: Colors.white,
// //                                       fontSize: 28,
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SliverList(
// //                   delegate: SliverChildBuilderDelegate(
// //                     (context, index) {
// //                       String type = data?[index]['type'];
// //                       return ListTile(
// //                         title: Text(type),
// //                       );
// //                     },
// //                     childCount: data?.length ?? 0,
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           );
// //         },
// //       ),
// //     );
// //   }
// // }
//   Widget build(BuildContext context) {
//     return Scaffold(
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.of(context).push(
//               MaterialPageRoute(builder: (context) => Newdata(),));
//         },
//         child: Icon(Icons.add),
//       ),
//       body: FutureBuilder<QuerySnapshot>(
//         future: FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.email??'Unknown User')
//             .orderBy('datetime',descending: true)
//             .get(),
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
//           List<DocumentSnapshot>? data = snapshot.data?.docs;
//
//           return CustomScrollView(
//             slivers: [
//               SliverToBoxAdapter(
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Container(
//                       width: MediaQuery
//                           .of(context)
//                           .size
//                           .width,
//                       height: MediaQuery
//                           .of(context)
//                           .size
//                           .height * 0.38,
//                       decoration: BoxDecoration(
//                         color: Color(0xfff56300),
//                         borderRadius: BorderRadius.only(
//                           bottomLeft: Radius.circular(18),
//                           bottomRight: Radius.circular(18),
//                         ),
//                       ),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: MediaQuery
//                               .of(context)
//                               .size
//                               .height * 0.12,),
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Container(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 18.0),
//                                       child: Text(
//                                         'Hey! Good to See You',
//                                         style: TextStyle(
//                                           color: Colors.white,
//                                         ),
//                                       ),
//                                     ),
//                                     Padding(
//                                       padding: const EdgeInsets.only(
//                                           left: 16.0),
//                                       child: Text(
//                                         name ?? 'Unknown User',
//                                         style: const TextStyle(
//                                           color: Colors.white,
//                                           fontSize: 28,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Container(
//                                 margin: EdgeInsets.only(right: 12, left: 12),
//                                 padding: EdgeInsets.all(0.2),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white.withOpacity(0.28),
//                                   borderRadius: BorderRadius.all(
//                                       Radius.circular(12)),
//                                 ),
//                                 child: IconButton(
//                                   onPressed: () {
//                                     FirebaseAuth.instance.signOut();
//                                   },
//                                   icon: Icon(Icons.logout, color: Colors.white),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     Positioned(
//                       top: MediaQuery
//                           .of(context)
//                           .size
//                           .height * 0.28,
//                       left: MediaQuery
//                           .of(context)
//                           .size
//                           .width * 0.08,
//                       child: Hero(
//                         tag: 'balance',
//                         child: Container(
//                           width: MediaQuery
//                               .of(context)
//                               .size
//                               .width * 0.84,
//                           height: MediaQuery
//                               .of(context)
//                               .size
//                               .height * 0.2,
//                           decoration: BoxDecoration(
//                             color: Color(0xffe65100),
//                             borderRadius: BorderRadius.all(Radius.circular(24)),
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.all(18.0),
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'Total Balance',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                                 Text(
//                                   '₹ $TotalBalance',
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 28,
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: MediaQuery
//                           .of(context)
//                           .size
//                           .height * 0.48,
//                       child: Padding(
//                         padding: EdgeInsets.all(16.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           // crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Transactions History',
//                               style: TextStyle(
//                                 fontSize: 18,
//                               fontWeight: FontWeight.w500,
//                               ),
//                             ),
//                             SizedBox(child:Icon(Icons.arrow_drop_down_sharp)),
//                           ],
//                         ),
//                       ),
//                     ),
//
//                   ],
//                 ),
//               ),
//               SliverPadding(
//                 padding: EdgeInsets.only(top: 126.0),
//                 sliver: SliverList(
//                   delegate: SliverChildBuilderDelegate(
//                         (context, index) {
//                       String type = data?[index]['what'];
//                       final amount1 =data?[index]['amount'];
//                       final date = data?[index]['datetime'];
//                       final DateTime date1 = date.toDate();
//                       return ListTile(
//                         title: Text(type),
//                         subtitle: Text('₹$amount1  on  ${date1.day}-${date1.month}-${date1.year}'),
//                         trailing: Icon(data?[index]['type']=='Income'?Icons.arrow_upward:Icons.arrow_downward,color:data?[index]['type']=='Income'?Colors.green:Colors.red ),
//                         isThreeLine: true,
//
//                       );
//                     },
//                     childCount: data?.length ?? 0,
//                   ),
//                 ),
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:trackex/HomePage.dart';
import 'package:trackex/login.dart';
import 'package:trackex/newdata.dart';
import 'login.dart';
import 'main.dart';
import 'functions.dart';
import 'stats.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String? name = getUserName();
  int totalBalance = 4218;
  int income = 4282;
  int expenses = 2428;
  String? email= FirebaseAuth.instance.currentUser?.email;
  String? name2 = getUserName();
  DateTime date =DateTime.now();

  @override
  void initState() {
    super.initState();
    getDataFromFirestore();
  }
  Future<void> getDataFromFirestore() async {
    try {
      Stream<DocumentSnapshot> stream = FirebaseFirestore.instance
          .collection("$email$name2")
          .doc(date.month.toString() + date.year.toString())
          .snapshots();

      stream.listen((DocumentSnapshot snapshot) {
        if (snapshot.exists) {
          Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;

          if (data != null) {
            if (data.containsKey('Income')) {
              setState(() {
                income = data['Income'];
              });
            } else {
              setState(() {
                income = 0;
              });
            }

            if (data.containsKey('Expences')) {
              setState(() {
                expenses = data['Expences'];
              });
            } else {
              setState(() {
                expenses = 0;
              });
            }

            totalBalance = income - expenses;
          }
        } else {
          setState(() {
            income = 0;
            expenses = 0;
            totalBalance = 0;
          });
        }
      });
    } catch (error) {
      // Handle the error here
      print('Error retrieving data: $error');
    }
  }

  // Future<void> getDataFromFirestore() async {
  //   try {
  //     DocumentSnapshot snapshot = await FirebaseFirestore.instance
  //         .collection("$email$name2")
  //         .doc(date.month.toString() + date.year.toString())
  //         .get();
  //
  //     if (snapshot.exists) {
  //       Map<String, dynamic>? data = snapshot.data() as Map<String, dynamic>?;
  //
  //       if (data != null) {
  //         if (data.containsKey('Income')) {
  //           setState(() {
  //             income = data['Income'];
  //           });
  //         } else {
  //           setState(() {
  //             income = 0;
  //           });
  //         }
  //
  //         if (data.containsKey('Expences')) {
  //           setState(() {
  //             expenses = data['Expecses'];
  //           });
  //         } else {
  //           setState(() {
  //             expenses = 0;
  //           });
  //         }
  //
  //         totalBalance = income - expenses;
  //       }
  //     } else {
  //       setState(() {
  //         income = 0;
  //         expenses = 0;
  //         totalBalance = 0;
  //       });
  //     }
  //   } catch (error) {
  //     // Handle the error here
  //     print('Error retrieving data: $error');
  //   }
  // }



  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection(FirebaseAuth.instance.currentUser?.email??'Unknown User').orderBy('datetime',descending: true,).snapshots(),
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.38,
                      decoration: BoxDecoration(
                        color: Color(0xfff56300),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: MediaQuery.of(context).size.height * 0.12),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 18.0),
                                      child: Text(
                                        'Hey! Good to See You',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16.0),
                                      child: Text(
                                        name ?? 'Unknown User',
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 12, left: 12),
                                padding: EdgeInsets.all(0.2),
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.28),
                                  borderRadius: BorderRadius.all(Radius.circular(12)),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    FirebaseAuth.instance.signOut();
                                    // Navigator.pop(context);
                                    //Navigator.replace(context, oldRoute:MaterialPageRoute(builder: (context) => HomePage(),), newRoute: MaterialPageRoute(builder: (context) => Login(),));
                                     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Login(),));
                                  },
                                  icon: Icon(Icons.logout, color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.28,
                      left: MediaQuery.of(context).size.width * 0.08,
                      child: Hero(
                        tag: 'balance',
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.84,
                          height: MediaQuery.of(context).size.height * 0.21,
                          decoration: BoxDecoration(
                            color: Color(0xffe65100),
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Total Balance',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                          ),
                                        ),
                                        Text(
                                          '₹ $totalBalance',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 28,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0,bottom: 24,right: 18),
                                      child: Text('*This month',style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 6
                                      ),),
                                    ),
                                  ],
                                ),

                                SizedBox(height: 8,),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8,right: 8),
                                      child: Container(
                                        child: Icon(Icons.add_circle,color: Colors.white.withOpacity(0.96),size: 22),
                                      ),
                                    ),
                                    Text('Income',style:TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.6,
                                    ) ,), SizedBox(
                                      width: MediaQuery.of(context).size.width*0.18,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        child: Icon(Icons.remove_circle,color: Colors.white.withOpacity(0.96),size: 22),
                                      ),
                                    ),
                                    Text('Expences',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14,
                                    ),),

                                  ],
                                ),
                                SizedBox(height: 2,),
                                Row(
                                  children: [
                                    SizedBox(
                                      width: 16,
                                    ),
                                    Text('₹ $income',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24
                                    ),),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width*0.24,
                                    ),
                                    Text('₹ $expenses',style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 24,
                                    ),),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.height * 0.48,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 42.0,top: 42,left: 12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Transactions History',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Icon(Icons.arrow_drop_down_sharp),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverPadding(
                padding: EdgeInsets.only(top: 166.0),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      String type = data[index]['what'];
                      final amount = data[index]['amount'];
                      final date = data[index]['datetime'];
                      final DateTime date1 = date.toDate();
                      return ListTile(
                        title: Text(type),
                        subtitle: Text('₹$amount  on ${date1.day}-${date1.month}-${date1.year}'),
                        trailing: Icon(
                          data[index]['type'] == 'Income' ? Icons.arrow_downward : Icons.arrow_upward,
                          color: data[index]['type'] == 'Income' ? Colors.green : Colors.red,
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
