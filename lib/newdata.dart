import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:trackex/functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';

import 'main.dart';
import 'functions.dart';
import 'package:flutter/material.dart';
class Newdata extends StatefulWidget {
  const Newdata({Key? key}) : super(key: key);

  @override
  State<Newdata> createState() => _NewdataState();
}

class _NewdataState extends State<Newdata> {
  @override
  var items = [
    'Food',
    'Transportation',
    'Education',
    'Savings',
    'Miscellaneous',
  ];
  var items2 = [
    'Income',
    'Expences'
  ];
  DateTime date =DateTime.now();
  DateTime date8 =DateTime.now();
  TextEditingController amount = TextEditingController();
  TextEditingController explin= TextEditingController();
  String what = 'Miscellaneous';
  String how = 'Income';
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xffe65100),
            // gradient: LinearGradient(
            //     begin: Alignment.topCenter,
            //     colors: [
            //       Color(0xffe65100),
            //       Color(0xfff56300),
            //       Color(0xfff99301),
            //       Color(0xfff7Bc00)
            //     ]
            // )
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(right: 3.2),
              height: MediaQuery.of(context).size.height*0.8,
              width: MediaQuery.of(context).size.width*0.88,
              decoration: BoxDecoration(
                color: Colors.white,
                    //.withOpacity(0.7),
                border: Border.all(
                    color: Colors.white.withOpacity(0.2), width: 1.0),
                gradient: LinearGradient(
                  colors: [
                    Colors.white.withOpacity(0.5),
                    Colors.white.withOpacity(0.2)
                  ],
                  stops: [0.0, 1.0],
                ),
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text('Add Data',style:GoogleFonts.dancingScript(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 36,
                    ),
                    // TextStyle(
                    //   color: Colors.white.withOpacity(0.9),
                    //   fontSize: 36,
                    //   fontWeight: FontWeight.w400,
                    // ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    height: 54,
                    width: MediaQuery.of(context).size.width*0.78,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.1),
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      border: Border.all(
                        color: Colors.white.withOpacity(0.8),
                      )
                    ),
                    child: DropdownButton<String>(
                      value: what,
                        dropdownColor: Colors.yellow.shade100,
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        isExpanded: true,
                        iconSize: 36,
                      underline: Container(color: Colors.transparent),
                        hint: Text('why you spent for?',style: TextStyle(color: Colors.grey.shade200),),
                        style: TextStyle(color: Colors.black.withOpacity(0.72)),
                        icon: Icon(Icons.arrow_drop_down_outlined,color: Colors.black.withOpacity(0.9),),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child:Container(
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    border: Border.all(
                                      color: Colors.orange.withOpacity(0.12),
                                    )
                                ),
                                padding: EdgeInsets.all(8),
                                  width: MediaQuery.of(context).size.width,
                                  child: Text(items)),
                            ),
                          );
                        }).toList(),
                      onChanged: (value){
                        setState(() {
                          what=value??'Miscellaneous';
                        });
                      },
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:16,bottom: 16 ),
                    padding: EdgeInsets.all(8),
                    height: 62,
                    width: MediaQuery.of(context).size.width*0.78,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.8),
                        )
                    ),
                    child: TextField(
                      controller: explin,
                      maxLines: 4,
                      decoration: InputDecoration(

                        hintText: 'Any note on spending ',
                        hintStyle: TextStyle(
                         color: Colors.black.withOpacity(0.4)
                        ),
                        border: InputBorder.none,
                        // focusedBorder:OutlineInputBorder(
                        //   borderSide: BorderSide.none,
                        // ),
                        // disabledBorder: OutlineInputBorder(
                        //   borderSide: BorderSide.none,
                        // )
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 54,
                    width: MediaQuery.of(context).size.width*0.78,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: amount,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.withOpacity(0.1),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.72),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(
                            color: Colors.white.withOpacity(0.72),
                          ),
                        ),
                        label: Text('amount',style: TextStyle(color: Colors.black.withOpacity(0.62)),),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 16),
                    height: 54,
                    width: MediaQuery.of(context).size.width*0.78,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.8),
                        )
                    ),
                    child: DropdownButton<String>(
                      value: how,
                      dropdownColor: Colors.yellow.shade100,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      isExpanded: true,
                      iconSize: 36,
                      underline: Container(color: Colors.transparent),
                      hint: Text('How you spent ?',style: TextStyle(color: Colors.grey.shade200),),
                      style: TextStyle(color: Colors.black.withOpacity(0.72)),
                      icon: Icon(Icons.arrow_drop_down_outlined,color: Colors.black.withOpacity(0.9),),
                      items: items2.map((String items2) {
                        return DropdownMenuItem(
                          value: items2,
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child:Container(
                                decoration: BoxDecoration(
                                    color: Colors.orange.withOpacity(0.1),
                                    borderRadius: BorderRadius.all(Radius.circular(4)),
                                    border: Border.all(
                                      color: Colors.orange.withOpacity(0.12),
                                    )
                                ),
                                padding: EdgeInsets.all(8),
                                width: MediaQuery.of(context).size.width,
                                child: Text(items2)),
                          ),
                        );
                      }).toList(),
                      onChanged: (value2){
                        setState(() {
                          how=value2??'Income';
                        });
                      },
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 16),
                    height: 54,
                    width: MediaQuery.of(context).size.width*0.78,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.1),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.8),
                        )
                    ),
                    child: TextButton(
                      onPressed: ()async{
                        DateTime? newdate = await showDatePicker(context: context, initialDate: date, firstDate: DateTime(2016), lastDate: DateTime(2100));
                        if(newdate== Null )return;
                        setState(() {
                          date=newdate!;
                        });
                      },
                      child: Text('Date : ${date.day} / ${date.month} / ${date.year}'),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top:52),
                    height: 54,
                    width: MediaQuery.of(context).size.width*0.48,
                    decoration: BoxDecoration(
                        color: Color(0xffe65100),
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                        border: Border.all(
                          color: Colors.white.withOpacity(0.8),
                        )
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xffe65100),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12),),
                        shadowColor:  Color(0xfff99301),
                        side: BorderSide(color:Color(0xffe65100), ),
                      ),
                      onPressed: ()async{
                        if(amount.text==""){
                          final snackBar = SnackBar(
                            backgroundColor: Colors.green.shade200,
                              content: Text('Enter amount',style: TextStyle(
                                color: Colors.white,
                              )),
                              // action: SnackBarAction(
                              //   // label: 'Undo',
                              //   // onPressed: () {
                              //   //   // Some code to undo the change.
                              //   //   emaillogin.clear();
                              //   //   paswordlogin.clear();
                              //   // },
                              // )
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }
////////////////////////////////////////////////////////////////
                      else{ Future Addata1(
                            datetime, amount,type,what,note,context
                            )async {
                          final docuser = FirebaseFirestore.instance.collection(
                              FirebaseAuth.instance.currentUser?.email ??
                                  'Unknown User');
                          //.doc(getUserName());
                          final json = {
                            'datetime': datetime,
                            'amount': int.parse(amount.text.trim()),
                            'type': type,
                            'what': what,
                            'note': note.text.trim(),
                          };
                          await docuser.add(json);
                        }
////////////////////////////////////////////////////////////////
                        String? getUserName() {
                          User? user = FirebaseAuth.instance.currentUser;
                          String? displayName = user?.displayName;
                          return displayName;
                        }
////////////////////////////////////////////////////////////////
                        // Addata1(date, amount, how,what, explin,context);
                        Addata1(date, amount, how, what, explin,context);
                        String? email= FirebaseAuth.instance.currentUser?.email;
                        String? name = getUserName();
                        String? col = "$email$name";
                        // final collectionr = col;

                        if(how=='Income'){checkAndAddData(date.month.toString()+date.year.toString(),how,amount,context,col);}
                        else{checkAndAddData(date.month.toString()+date.year.toString(),how,amount,context,col);}
                      }
                      },

                      child: Text('Add transaction'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
