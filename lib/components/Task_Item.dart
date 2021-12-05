import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/bloc/App_HomePage_States.dart';
import 'package:todo/bloc/App_HomePage_cubit.dart';
import 'package:todo/components/task_ItemOptions.dart';

Widget Task_Item({Map model, BuildContext context}) {
  AppHomePageCubit cubit=AppHomePageCubit.get(context);

  return  Padding(
    padding: EdgeInsets.all(2),
    child: Row( mainAxisSize: MainAxisSize.min,

      children: [
        //task Items Container
         Expanded(
           flex: 1,
           child: Container(
             margin: EdgeInsets.all(5),
             key: ValueKey('Task items Container'),
             width: MediaQuery.of(context).size.width * .8,
             decoration: BoxDecoration(
                 color: Colors.white,
                 borderRadius: BorderRadius.circular(20),
                 boxShadow: [
                   BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 3,
                       blurRadius: 3,
                       offset: Offset(0, 2))
                 ]),
             child: Column(
               mainAxisAlignment: MainAxisAlignment.spaceAround,
               children: [
                 //conyainr for task name
                  Expanded(
                    flex:0,
                    child: Container(
                     margin: EdgeInsets.all(2),
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Container(
                             decoration: BoxDecoration(

                                 color: Colors.white,
                                 borderRadius: BorderRadius.circular(20),
                                 boxShadow: [
                                   BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 1,
                                       blurRadius: 1,
                                       offset: Offset(0, 2))
                                 ]),
                             padding: EdgeInsets.only(left: 1)
                             ,child:  CircleAvatar(
                                child: Icon(
                             Icons.title,
                             color: Colors.black,
                           ),
                           backgroundColor: Colors.white,
                         )),
                         SizedBox(
                           width: 2,
                         ),
                         Expanded(
                           flex: 1,
                           child: RichText(
                             maxLines: 3,
                            overflow: TextOverflow.ellipsis,

                            text: TextSpan( children: <TextSpan>[
                               TextSpan(
                                   text: 'Task name : ',
                                   style: TextStyle(
                                       fontSize: 16,
                                       fontWeight: FontWeight.normal,
                                       color: Colors.grey)),

                               TextSpan(

                                   text: model['taskName'],
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.normal,
                                       color: Colors.black))
                             ]),
                           ),
                         )],
                     ),
                 ),
                  ),
                 Container(
                   margin: EdgeInsets.all(2),
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                     children: [
                       Container(
                           decoration: BoxDecoration(

                               color: Colors.white,
                               borderRadius: BorderRadius.circular(20),
                               boxShadow: [
                                 BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 1,
                                     offset: Offset(0, 2))
                               ]),
                           margin: EdgeInsets.all(2)
                           , child: CircleAvatar(
                         child: Icon(
                           Icons.timer,
                           color: Colors.black,
                         ),
                         backgroundColor: Colors.white,
                       )),
                       SizedBox(
                         width: 2,
                       ),
                       RichText(
                         text: TextSpan(
                             text: 'start at : ',
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.grey),
                             children: <TextSpan>[
                               TextSpan(
                                   text: model['taskIntialTime'],
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.normal,
                                       color: Colors.black))
                             ]),
                       )
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.all(2),
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                     children: [
                       Container(
                           decoration: BoxDecoration(

                               color: Colors.white,
                               borderRadius: BorderRadius.circular(20),
                               boxShadow: [
                                 BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 1,
                                     offset: Offset(0, 2))
                               ]),
                           margin: EdgeInsets.all(2),
                           child: CircleAvatar(
                             child: Icon(
                               Icons.timer_off,
                               color: Colors.black,
                             ),
                             backgroundColor: Colors.white,
                           )),
                       SizedBox(
                         width: 2,
                       ),
                       RichText(
                         text: TextSpan(
                             text: 'end at : ',
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.grey),
                             children: <TextSpan>[
                               TextSpan(
                                   text: model['taskFinshTime'],
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.normal,
                                       color: Colors.black))
                             ]),
                       )
                     ],
                   ),
                 ),
                 Container(
                   margin: EdgeInsets.all(2),
                   child: Row(
                     mainAxisSize: MainAxisSize.max,
                     children: [
                       Container(
                           decoration: BoxDecoration(

                               color: Colors.white,
                               borderRadius: BorderRadius.circular(20),
                               boxShadow: [
                                 BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 1,
                                     blurRadius: 1,
                                     offset: Offset(0, 2))
                               ]),

                           margin: EdgeInsets.all(2),
                           child: CircleAvatar(
                             child: Icon(
                               Icons.date_range,
                               color: Colors.black,
                             ),
                             backgroundColor: Colors.white,
                           )),
                       SizedBox(
                         width: 2,
                       ),
                       RichText(
                         text: TextSpan(
                             text: 'Task date : ',
                             style: TextStyle(
                                 fontSize: 16,
                                 fontWeight: FontWeight.normal,
                                 color: Colors.grey),
                             children: <TextSpan>[
                               TextSpan(
                                   text: model['taskDate'],
                                   style: TextStyle(
                                       fontSize: 18,
                                       fontWeight: FontWeight.normal,
                                       color: Colors.black))
                             ]),
                       )
                     ],
                   ),
                 ),
               ],
             ),
           ),
         ),
        //Task Item Operation
        Expanded(
          flex: 0,
          child: Container(
            margin: EdgeInsets.all(2),
            key: ValueKey('Task item operations'),
            width: MediaQuery.of(context).size.width * .125,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 3,
                      blurRadius: 3,
                      offset: Offset(0, 2))
                ]),
            child: Column(

                mainAxisAlignment: MainAxisAlignment.spaceAround,

                children: [
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.done,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        cubit.updateDatabase('done', model['id']);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.archive,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        cubit.updateDatabase('archived', model['id']);
                      },
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        cubit.deleteFromDatabase(model['id']);
                      },
                    ),
                  ),
                ]),
          ),
        )
      ],


    ),
  );}
