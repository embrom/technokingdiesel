import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:technokingdiesel/update.dart';

class View extends StatefulWidget {
  final Map data;
  final String id;
  View(this.data, this.id);
  @override
  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  String injectionPump = '';
  String governor = '';
  String timer = '';
  String manufacturer = '';
  String engineType = '';
  String vehicleType = '';
  String rotation = '';
  String injectionOrder = '';
  String injectionInterval = '';
  String preStroke = '';
  String tappetClearnce = '';
  String lockedTimmingLoction = '';
  String nuzzle = '';
  String nuzzleOpeningPressure = '';
  String testOil = '';
  String feedPressure = '';
  String highPressurePipe = '';
  String fuelTemperature = '';
  String onePumpSpeed1 = '';
  String onePumpSpeed2 = '';
  String onePumpSpeed3 = '';
  String onePumpSpeed4 = '';
  String oneNos1 = '';
  String oneNos2 = '';
  String oneNos3 = '';
  String oneNos4 = '';
  String twoNos1 = '';
  String twoNos2 = '';
  String twoNos3 = '';
  String twoNos4 = '';
  String oneRackTravel1 = '';
  String oneRackTravel2 = '';
  String oneRackTravel3 = '';
  String oneRackTravel4 = '';
  String oneDeliver1 = '';
  String oneDeliver2 = '';
  String oneDeliver3 = '';
  String oneDeliver4 = '';
  String oneMax1 = '';
  String oneMax2 = '';
  String oneMax3 = '';
  String oneMax4 = '';
  String lever1 = '';
  String lever2 = '';
  String lever3 = '';
  String lever4 = '';
  String twoRackTravel1 = '';
  String twoRackTravel2 = '';
  String twoRackTravel3 = '';
  String twoRackTravel4 = '';
  String twoDeliver1 = '';
  String twoDeliver2 = '';
  String twoDeliver3 = '';
  String twoDeliver4 = '';
  String oneRemark = '';
  String twoRemark = '';
  String overFlow = '';
  String adjustmentOfGoverner = '';

  String advanceAngle1 = '';
  String advanceAngle2 = '';
  String advanceAngle3 = '';
  String advanceAngle4 = '';
  String advanceAngle5 = '';
  String advanceAngle6 = '';
  String note = '';
  List<String> indexList = [];
  @override
  void initState() {
    injectionPump = widget.data['injectionPump'] ?? 'No Data';
    governor = widget.data['governor'] ?? 'No Data';
    timer = widget.data['timer'] ?? 'No Data';
    manufacturer = widget.data['manufacturer'] ?? 'No Data';
    engineType = widget.data['engineType'] ?? 'No Data';
    vehicleType = widget.data['vehicleType'] ?? 'No Data';
    rotation = widget.data['rotation'] ?? 'No Data';
    injectionOrder = widget.data['injectionOrder'] ?? 'No Data';
    injectionInterval = widget.data['injectionInterval'] ?? 'No Data';
    preStroke = widget.data['preStroke'] ?? 'No Data';
    tappetClearnce = widget.data['tappetClearnce'] ?? 'No Data';
    lockedTimmingLoction = widget.data['lockedTimmingLoction'] ?? 'No Data';
    nuzzle = widget.data['nuzzle'] ?? 'No Data';
    nuzzleOpeningPressure = widget.data['nuzzleOpeningPressure'] ?? 'No Data';
    testOil = widget.data['testOil'] ?? 'No Data';
    feedPressure = widget.data['feedPressure'] ?? 'No Data';
    highPressurePipe = widget.data['highPressurePipe'] ?? 'No Data';
    fuelTemperature = widget.data['fuelTemperature'] ?? 'No Data';
    onePumpSpeed1 = widget.data['onePumpSpeed1'] ?? 'No Data';
    onePumpSpeed2 = widget.data['onePumpSpeed2'] ?? 'No Data';
    onePumpSpeed3 = widget.data['onePumpSpeed3'] ?? 'No Data';
    onePumpSpeed4 = widget.data['onePumpSpeed4'] ?? 'No Data';
    oneNos1 = widget.data['oneNos1'] ?? 'No Data';
    oneNos2 = widget.data['oneNos2'] ?? 'No Data';
    oneNos3 = widget.data['oneNos3'] ?? 'No Data';
    oneNos4 = widget.data['oneNos4'] ?? 'No Data';
    twoNos1 = widget.data['twoNos1'] ?? 'No Data';
    twoNos2 = widget.data['twoNos2'] ?? 'No Data';
    twoNos3 = widget.data['twoNos3'] ?? 'No Data';
    twoNos4 = widget.data['twoNos4'] ?? 'No Data';
    oneRackTravel1 = widget.data['oneRackTravel1'] ?? 'No Data';
    oneRackTravel2 = widget.data['oneRackTravel2'] ?? 'No Data';
    oneRackTravel3 = widget.data['oneRackTravel3'] ?? 'No Data';
    oneRackTravel4 = widget.data['oneRackTravel4'] ?? 'No Data';
    oneDeliver1 = widget.data['oneDeliver1'] ?? 'No Data';
    oneDeliver2 = widget.data['oneDeliver2'] ?? 'No Data';
    oneDeliver3 = widget.data['oneDeliver3'] ?? 'No Data';
    oneDeliver4 = widget.data['oneDeliver4'] ?? 'No Data';
    oneMax1 = widget.data['oneMax1'] ?? 'No Data';
    oneMax2 = widget.data['oneMax2'] ?? 'No Data';
    oneMax3 = widget.data['oneMax3'] ?? 'No Data';
    oneMax4 = widget.data['oneMax4'] ?? 'No Data';
    lever1 = widget.data['lever1'] ?? 'No Data';
    lever2 = widget.data['lever2'] ?? 'No Data';
    lever3 = widget.data['lever3'] ?? 'No Data';
    lever4 = widget.data['lever4'] ?? 'No Data';
    twoRackTravel1 = widget.data['twoRackTravel1'] ?? 'No Data';
    twoRackTravel2 = widget.data['twoRackTravel2'] ?? 'No Data';
    twoRackTravel3 = widget.data['twoRackTravel3'] ?? 'No Data';
    twoRackTravel4 = widget.data['twoRackTravel4'] ?? 'No Data';
    twoDeliver1 = widget.data['twoDeliver1'] ?? 'No Data';
    twoDeliver2 = widget.data['twoDeliver2'] ?? 'No Data';
    twoDeliver3 = widget.data['twoDeliver3'] ?? 'No Data';
    twoDeliver4 = widget.data['twoDeliver4'] ?? 'No Data';
    oneRemark = widget.data['oneRemark'] ?? 'No Data';
    twoRemark = widget.data['twoRemark'] ?? 'No Data';
    overFlow = widget.data['overFlow'] ?? 'No Data';
    adjustmentOfGoverner = widget.data['adjustmentOfGoverner'] ?? 'No Data';
    advanceAngle1 = widget.data['advanceAngle1'] ?? 'No Data';
    advanceAngle2 = widget.data['advanceAngle2'] ?? 'No Data';
    advanceAngle3 = widget.data['advanceAngle3'] ?? 'No Data';
    advanceAngle4 = widget.data['advanceAngle4'] ?? 'No Data';
    advanceAngle5 = widget.data['advanceAngle5'] ?? 'No Data';
    advanceAngle6 = widget.data['advanceAngle6'] ?? 'No Data';
    note = widget.data['note'] ?? 'No Data';
    super.initState();
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
              padding: EdgeInsets.all( 20),
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
                      .doc(widget.id)
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

  @override
  Widget build(BuildContext context) {
    var title1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.grey,
      appBar: AppBar(
          title: Text('View Document'),
          leading: IconButton(
              onPressed: () {
                ScaffoldMessenger.of(context)..removeCurrentSnackBar();

                Navigator.of(context).pop();
              },
              icon: Icon(Icons.arrow_circle_left_rounded)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => Update(widget.data, widget.id),
                  ));
                },
                icon: Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  delete();
                },
                icon: Icon(Icons.delete))
          ]),
      body: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            border: Border.all(color: Colors.black)),
        width: width,
        margin: EdgeInsets.only(left: 140, right: 140),
        child: ListView(
          children: [
            Container(
              height: width / 7,
              child: Container(
                decoration: BoxDecoration(
                    border: Border(
                  bottom: BorderSide(),
                )),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: width / 1.8,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 160, left: 15),
                                  child: Text(
                                    'INJECTION PUMP ',
                                    style: title1,
                                  )),
                              Container(
                                width: width / 8,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: injectionPump,
                                        onChanged: (value) {
                                          injectionPump = value.toString();
                                        })),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 160, left: 15),
                                  child: Text(
                                    'GOVERNOR          ',
                                    style: title1,
                                  )),
                              Container(
                                width: width / 8,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: governor,
                                        onChanged: (value) {
                                          governor = value.toString();
                                        })),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 160, left: 15),
                                  child: Text(
                                    'TIMER                    ',
                                    style: title1,
                                  )),
                              Container(
                                width: width / 8,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: timer,
                                        onChanged: (value) {
                                          timer = value.toString();
                                        })),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              width: width / 10,
                              height: width / 21.4,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(),
                                      left: BorderSide())),
                              child: Text(
                                'MANU-\nMFACTURER',
                                style: title1,
                              ),
                            ),
                            Container(
                              width: width / 8,
                              height: width / 21.4,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(),
                                      bottom: BorderSide())),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: manufacturer,
                                    onChanged: (value) {
                                      manufacturer = value.toString();
                                    }),
                              )),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: width / 10,
                              height: width / 21.4,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(),
                                      left: BorderSide())),
                              child: Text(
                                'ENGINE\nTYPE',
                                style: title1,
                              ),
                            ),
                            Container(
                              width: width / 8,
                              height: width / 21.4,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(),
                                      bottom: BorderSide())),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: engineType,
                                    onChanged: (value) {
                                      engineType = value.toString();
                                    }),
                              )),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: width / 10,
                              height: width / 21.4,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  border: Border(left: BorderSide())),
                              child: Text(
                                'VEHICLE\nMODEL',
                                style: title1,
                              ),
                            ),
                            Container(
                              width: width / 8,
                              height: width / 21.4,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  border: Border(
                                left: BorderSide(),
                              )),
                              child: Center(
                                  child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: vehicleType,
                                    onChanged: (value) {
                                      vehicleType = value.toString();
                                    }),
                              )),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                '1. INJECTION TIMMING',
                style: title1,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      Row(
                        children: [
                          Text('1) Rotation              '),
                        ],
                      ),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: rotation,
                                    onChanged: (value) {
                                      rotation = value.toString();
                                    })),
                          )),
                      Spacer(),
                      Text('4) Prestroke                                    '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: preStroke,
                                    onChanged: (value) {
                                      preStroke = value.toString();
                                    })),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text('2) Injection Order   '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: injectionOrder,
                                    onChanged: (value) {
                                      injectionOrder = value.toString();
                                    })),
                          )),
                      Spacer(),
                      Text('5) Tappet Clearence                      '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: tappetClearnce,
                                    onChanged: (value) {
                                      tappetClearnce = value.toString();
                                    })),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text('3) Injection Interval'),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: injectionInterval,
                                    onChanged: (value) {
                                      injectionInterval = value.toString();
                                    })),
                          )),
                      Spacer(),
                      Text('6) Locked Timming Loctaion        '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: lockedTimmingLoction,
                                    onChanged: (value) {
                                      lockedTimmingLoction = value.toString();
                                    })),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15),
              child: Text(
                '2. ADJUSTMENT OF DELIVERY QUANTITY',
                style: title1,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Test Condition',
                  ),
                  Row(
                    children: [
                      Text('1) Nozzle                                   '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: nuzzle,
                                    onChanged: (value) {
                                      nuzzle = value.toString();
                                    })),
                          )),
                      Spacer(),
                      Text('4) Feed Preasure                            '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: feedPressure,
                                    onChanged: (value) {
                                      feedPressure = value.toString();
                                    })),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text('2) Nozzle Opening Preassure '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: nuzzleOpeningPressure,
                                    onChanged: (value) {
                                      nuzzleOpeningPressure = value.toString();
                                    })),
                          )),
                      Spacer(),
                      Text('5) High Preassure Pipe                 '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: highPressurePipe,
                                    onChanged: (value) {
                                      highPressurePipe = value.toString();
                                    })),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text('3) Test Oil                                 '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: testOil,
                                    onChanged: (value) {
                                      testOil = value.toString();
                                    })),
                          )),
                      Spacer(),
                      Text('6) Fuel Temperature                     '),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                    decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                        border: InputBorder.none),
                                    readOnly: true,
                                    initialValue: fuelTemperature,
                                    onChanged: (value) {
                                      fuelTemperature = value.toString();
                                    })),
                          ))
                    ],
                  ),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            border: TableBorder.all(),
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Pump Speed',
                                  style: title1,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Rack Travel',
                                  style: title1,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Number of Strokes',
                                  style: title1,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Delivery Quantity',
                                  style: title1,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  'Max Spread',
                                  style: title1,
                                ),
                              ),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: onePumpSpeed1,
                                          onChanged: (value) {
                                            onePumpSpeed1 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneRackTravel1,
                                          onChanged: (value) {
                                            oneRackTravel1 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneNos1,
                                          onChanged: (value) {
                                            oneNos1 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneDeliver1,
                                          onChanged: (value) {
                                            oneDeliver1 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneMax1,
                                          onChanged: (value) {
                                            oneMax1 = value.toString();
                                            ;
                                          }))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: onePumpSpeed2,
                                          onChanged: (value) {
                                            onePumpSpeed2 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneRackTravel2,
                                          onChanged: (value) {
                                            oneRackTravel2 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneNos2,
                                          onChanged: (value) {
                                            oneNos2 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneDeliver2,
                                          onChanged: (value) {
                                            oneDeliver2 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneMax2,
                                          onChanged: (value) {
                                            oneMax2 = value.toString();
                                            ;
                                          }))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: onePumpSpeed3,
                                          onChanged: (value) {
                                            onePumpSpeed3 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneRackTravel3,
                                          onChanged: (value) {
                                            oneRackTravel3 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneNos3,
                                          onChanged: (value) {
                                            oneNos3 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneDeliver3,
                                          onChanged: (value) {
                                            oneDeliver3 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneMax3,
                                          onChanged: (value) {
                                            oneMax3 = value.toString();
                                          }))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: onePumpSpeed4,
                                          onChanged: (value) {
                                            onePumpSpeed4 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneRackTravel4,
                                          onChanged: (value) {
                                            oneRackTravel4 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneNos4,
                                          onChanged: (value) {
                                            oneNos4 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneDeliver4,
                                          onChanged: (value) {
                                            oneDeliver4 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: oneMax4,
                                          onChanged: (value) {
                                            oneMax4 = value.toString();
                                          }))),
                                ],
                              ),
                            ],
                          ))),
                  DataTable(
                      dataRowHeight: width * 0.125,
                      border: TableBorder.all(),
                      columns: [
                        DataColumn(
                          label: Text(
                            'Remarks',
                            style: title1,
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: <DataCell>[
                            DataCell(SizedBox(
                              width: width * 0.1383,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(textAlign: TextAlign.center,
                                  decoration:
                                      InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,border: InputBorder.none),
                                  readOnly: true,
                                  initialValue: oneRemark,
                                  onChanged: (value) {
                                    oneRemark = value.toString();
                                  },
                                  maxLines: 10,
                                  keyboardType: TextInputType.multiline,
                                ),
                              ),
                            )),
                          ],
                        ),
                      ])
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Overflow Valve opening  :  '),
                  Container(
                      width: width * 0.4,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(textAlign: TextAlign.center,
                              decoration:
                                  InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,border: InputBorder.none),
                              readOnly: true,
                              initialValue: overFlow,
                              onChanged: (value) {
                                overFlow = value.toString();
                              })))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, top: 40, left: 15),
              child: Row(
                children: [
                  Text(
                    '3.ADJUSTMENT OF GOVERNOR... ',
                    style: title1,
                  ),
                  Container(
                      width: width * 0.6,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(textAlign: TextAlign.center,
                              decoration:
                                  InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,border: InputBorder.none),
                              readOnly: true,
                              initialValue: adjustmentOfGoverner,
                              onChanged: (value) {
                                adjustmentOfGoverner = value.toString();
                              })))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 20, left: 15),
              child: Text(
                '4.ADJUSTMENT OF PUMP WITH GOVERNOR OPERTAION : ',
                style: title1,
              ),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: DataTable(
                          border: TableBorder.all(),
                          columns: <DataColumn>[
                            DataColumn(
                              label: Text(
                                'Lever Position',
                                style: title1,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Rack Travel (mm)',
                                style: title1,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Number of Strokes',
                                style: title1,
                              ),
                            ),
                            DataColumn(
                              label: Text(
                                'Delivery Quantity',
                                style: title1,
                              ),
                            ),
                          ],
                          rows: <DataRow>[
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: lever1,
                                        onChanged: (value) {
                                          lever1 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoRackTravel1,
                                        onChanged: (value) {
                                          twoRackTravel1 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoNos1,
                                        onChanged: (value) {
                                          twoNos1 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoDeliver1,
                                        onChanged: (value) {
                                          twoDeliver1 = value.toString();
                                        }))),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: lever2,
                                        onChanged: (value) {
                                          lever2 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoRackTravel2,
                                        onChanged: (value) {
                                          twoRackTravel2 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoNos2,
                                        onChanged: (value) {
                                          twoNos2 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoDeliver2,
                                        onChanged: (value) {
                                          twoDeliver2 = value.toString();
                                        }))),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: lever3,
                                        onChanged: (value) {
                                          lever3 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoRackTravel3,
                                        onChanged: (value) {
                                          twoRackTravel3 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoNos3,
                                        onChanged: (value) {
                                          twoNos3 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoDeliver3,
                                        onChanged: (value) {
                                          twoDeliver3 = value.toString();
                                        }))),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: lever4,
                                        onChanged: (value) {
                                          lever4 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoRackTravel4,
                                        onChanged: (value) {
                                          twoRackTravel4 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoNos4,
                                        onChanged: (value) {
                                          twoNos4 = value.toString();
                                        }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(textAlign: TextAlign.center,
                                        decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                            border: InputBorder.none),
                                        readOnly: true,
                                        initialValue: twoDeliver4,
                                        onChanged: (value) {
                                          twoDeliver4 = value.toString();
                                        }))),
                              ],
                            ),
                          ],
                        ))),
                DataTable(
                    dataRowHeight: width * 0.125,
                    border: TableBorder.all(),
                    columns: [
                      DataColumn(
                        label: Text(
                          'Remarks',
                          style: title1,
                        ),
                      ),
                    ],
                    rows: [
                      DataRow(
                        cells: <DataCell>[
                          DataCell(SizedBox(
                            width: width * 0.1383,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextFormField(textAlign: TextAlign.center,
                                decoration:
                                    InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,border: InputBorder.none),
                                readOnly: true,
                                initialValue: twoRemark,
                                onChanged: (value) {
                                  twoRemark = value.toString();
                                },
                                maxLines: 10,
                                keyboardType: TextInputType.multiline,
                              ),
                            ),
                          )),
                        ],
                      ),
                    ])
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15, bottom: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'NOTE : ',
                    style: title1,
                  ),
                  Container(
                      width: width * 0.6,
                      child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(textAlign: TextAlign.center,
                              decoration:
                                  InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,border: InputBorder.none),
                              readOnly: true,
                              initialValue: note,
                              onChanged: (value) {
                                note = value.toString();
                              })))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 20, bottom: 20),
              child: Text(
                '5.ADJUSTMENT OF TIMER',
                style: title1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 100),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: DataTable(
                            border: TableBorder.all(),
                            columns: <DataColumn>[
                              DataColumn(
                                label: Text(
                                  'Pump Speed (rpm)',
                                  style: title1,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '1400',
                                  style: title1,
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  '1700',
                                  style: title1,
                                ),
                              ),
                              DataColumn(
                                  label: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox())),
                              DataColumn(
                                  label: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox())),
                              DataColumn(
                                  label: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox())),
                              DataColumn(
                                  label: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SizedBox())),
                            ],
                            rows: <DataRow>[
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        'Average Angle',
                                        style: title1,
                                      ))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: advanceAngle1,
                                          onChanged: (value) {
                                            advanceAngle1 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: advanceAngle2,
                                          onChanged: (value) {
                                            advanceAngle2 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: advanceAngle3,
                                          onChanged: (value) {
                                            advanceAngle3 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: advanceAngle4,
                                          onChanged: (value) {
                                            advanceAngle4 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: advanceAngle5,
                                          onChanged: (value) {
                                            advanceAngle5 = value.toString();
                                          }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(textAlign: TextAlign.center,
                                          decoration: InputDecoration(enabledBorder: InputBorder.none,focusedBorder: InputBorder.none,
                                              border: InputBorder.none),
                                          readOnly: true,
                                          initialValue: advanceAngle6,
                                          onChanged: (value) {
                                            advanceAngle6 = value.toString();
                                          }))),
                                ],
                              ),
                            ],
                          ))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
