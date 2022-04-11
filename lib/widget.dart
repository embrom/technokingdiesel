import 'dart:math';

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
  late final Status status;
  @override
  void initState() {
    if (widget.which == 'Edit') {
      status = Status.edit;
    } else if (widget.which == 'Add Document') {
      status = Status.add;
    } else {
      status = Status.view;
    }
    super.initState();
  }

  String appTitle() {
    if (status == Status.view) {
      return widget.data!['num'].toString();
    } else {
      return '' + widget.which;
    }
  }

  Widget value() => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(6),
        child: TextFormField(
          onChanged: (v) {},
          readOnly: status == Status.view,
          initialValue:
              status != Status.add ? widget.data!['num'].toString() : '',
          decoration: InputDecoration(
            border:
                status != Status.view ? OutlineInputBorder() : InputBorder.none,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        floatingActionButton: (status == Status.edit || status == Status.add)
            ? FloatingActionButton(
                onPressed: () {}, child: (Icon(Icons.done_outline_rounded)))
            : SizedBox(),
        appBar: AppBar(title: Text(appTitle()), actions: [
          status == Status.view
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Detail('Edit', widget.data),
                    ));
                  },
                  icon: Icon(Icons.edit))
              : SizedBox(), status == Status.view
              ? IconButton(
                  onPressed: () {
                   
                  },
                  icon: Icon(Icons.delete))
              : SizedBox()
        ]),
        body: value());
  }
}
