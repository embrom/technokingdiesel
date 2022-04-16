import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

enum Status {
  view,
  edit,
  add,
}

class Detail extends StatefulWidget {
  final Map<String, dynamic>? data;
  final String which;
  Detail(this.which, [this.data]);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  String? seri;
  late final Status status;
  @override
  void initState() {
    if (widget.which == 'Edit') {
      status = Status.edit;
      seri = widget.data!['seri'];
    } else if (widget.which == 'Add Document') {
      status = Status.add;
    } else {
      seri = widget.data!['seri'];
      status = Status.view;
    }
    super.initState();
  }

  String appTitle() {
    if (status == Status.view) {
      return widget.data!['seri'].toString();
    } else {
      return '' + widget.which;
    }
  }

  void delete() async {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(
        padding: EdgeInsets.zero,
        duration: Duration(minutes: 1),
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: const Text(
                'Apakah Anda yakin ?',
                style: TextStyle(color: Colors.white),
              ),
            ),
            Spacer(),
            TextButton(
                onPressed: () async {
                  await FirebaseFirestore.instance
                      .collection('data')
                      .doc(widget.data!['id'])
                      .delete();
                  ScaffoldMessenger.of(context).removeCurrentSnackBar();
                  Navigator.of(context).pop();
                },
                child: const Text('Delete',
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.w700))),
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                },
                child: const Text('Cancle')),
          ],
        ),
        backgroundColor: Color.fromARGB(255, 77, 76, 76),
      ));
  }

  Widget value() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        child: TextFormField(
          onChanged: (v) {
            seri = v;
          },
          readOnly: status == Status.view,
          initialValue:
              status != Status.add ? widget.data!['seri'].toString() : '',
          decoration: InputDecoration(
            border:
                status == Status.view ? InputBorder.none: OutlineInputBorder() ,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: (status == Status.edit || status == Status.add)
            ? FloatingActionButton(
                onPressed: () async {
                  if (status == Status.add) {
                    List<String> splitList = (seri!.toString()).split(" ");
                    List<String> indexList = [];
                    for (int i = 0; i < splitList.length; i++) {
                      for (int y = 1; y < splitList[i].length + 1; y++) {
                        indexList
                            .add(splitList[i].substring(0, y).toLowerCase());
                      }
                    }
                    await FirebaseFirestore.instance
                        .collection('data')
                        .doc(DateTime.now().toIso8601String())
                        .set({
                      'seri': (seri!.toString()),
                      'searchArray': indexList,
                      'date': DateTime.now().toIso8601String()
                    });

                    Navigator.of(context).pop();
                  } else {
                       List<String> splitList = (seri!.toString()).split(" ");
                    List<String> indexList = [];
                    for (int i = 0; i < splitList.length; i++) {
                      for (int y = 1; y < splitList[i].length + 1; y++) {
                        indexList
                            .add(splitList[i].substring(0, y).toLowerCase());
                      }
                    }
                    await FirebaseFirestore.instance
                        .collection('data')
                        .doc(widget.data!['id'])
                        .update({
                      'seri': seri,'searchArray':indexList,
                      'date': DateTime.now().toIso8601String()
                    });
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                   
                  }
                },
                child: (Icon(Icons.done_outline_rounded)))
            : SizedBox(),
        appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)..removeCurrentSnackBar();

                  Navigator.of(context).pop();
                },
                icon: Icon(Icons.arrow_circle_left_rounded)),
            automaticallyImplyLeading: false,
            title: Text(appTitle()),
            actions: [
              status == Status.view
                  ? IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Detail('Edit', widget.data),
                        ));
                      },
                      icon: Icon(Icons.edit))
                  : SizedBox(),
              status == Status.view
                  ? IconButton(
                      onPressed: () {
                        delete();
                      },
                      icon: Icon(Icons.delete))
                  : SizedBox()
            ]),
        body: value());
  }
}
