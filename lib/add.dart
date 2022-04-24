import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Detail extends StatefulWidget {
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
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
  Widget build(BuildContext context) {
    var title1 = TextStyle(fontSize: 16, fontWeight: FontWeight.w700);
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(onPressed: () async {
        if (manufacturer != '') {
          List<String> manu = (manufacturer.toString()).split(' ');

          for (int i = 0; i < manu.length; i++) {
            for (int y = 1; y < manu[i][i].length + 1; y++) {
              indexList.add(manu[i].substring(0, y).toLowerCase());
            }
          }
        }
        if (vehicleType != '') {
          List<String> vehi = (vehicleType.toString()).split(' ');

          for (int i = 0; i < vehi.length; i++) {
            for (int y = 1; y < vehi[i][i].length + 1; y++) {
              indexList.add(vehi[i].substring(0, y).toLowerCase());
            }
          }
        }
        if (governor != '') {
          List<String> gover = (governor.toString()).split(' ');
          for (int i = 0; i < gover.length; i++) {
            for (int y = 1; y < gover[i].length + 1; y++) {
              indexList.add(gover[i].substring(0, y).toLowerCase());
            }
          }
        }
        if (engineType != '') {
          List<String> engi = (engineType.toString()).split(' ');

          for (int i = 0; i < engi.length; i++) {
            for (int y = 1; y < engi[i].length + 1; y++) {
              indexList.add(engi[i].substring(0, y).toLowerCase());
            }
          }
        }
        if (timer != '') {
          List<String> time = (timer.toString()).split(' ');

          for (int i = 0; i < time.length; i++) {
            for (int y = 1; y < time[i].length + 1; y++) {
              indexList.add(time[i].substring(0, y).toLowerCase());
            }
          }
        }
        if (injectionPump != '') {
          List<String> inj = (injectionPump.toString()).split(' ');

          for (int i = 0; i < inj.length; i++) {
            for (int y = 1; y < inj[i].length + 1; y++) {
              indexList.add(inj[i].substring(0, y).toLowerCase());
              log(indexList.toString());
            }
          }
        }
        setState(() {});
        await FirebaseFirestore.instance
            .collection('data')
            .doc(DateTime.now().toIso8601String())
            .set({
          'injectionPump': injectionPump,
          'governor': governor,
          'timer': timer,
          'manufacturer': manufacturer,
          'engineType': engineType,
          'vehicleType': vehicleType,
          'rotation': rotation,
          'injectionOrder': injectionOrder,
          'injectionInterval': injectionInterval,
          'preStroke': preStroke,
          'tappetClearnce': tappetClearnce,
          'lockedTimmingLoction': lockedTimmingLoction,
          'nuzzle': nuzzle,
          'nuzzleOpeningPressure': nuzzleOpeningPressure,
          'testOil': testOil,
          'feedPressure': feedPressure,
          'highPressurePipe': highPressurePipe,
          'fuelTemperature': fuelTemperature,
          'onePumpSpeed1': onePumpSpeed1,
          'onePumpSpeed2': onePumpSpeed2,
          'onePumpSpeed3': onePumpSpeed3,
          'onePumpSpeed4 ': onePumpSpeed4,
          'oneNos1': oneNos1,
          'oneNos2': oneNos2,
          'oneNos3': oneNos3,
          'oneNos4': oneNos4,
          'twoNos1': twoNos1,
          'twoNos2': twoNos2,
          'twoNos3': twoNos3,
          'twoNos4': twoNos4,
          'oneRackTravel1': oneRackTravel1,
          'oneRackTravel2': oneRackTravel2,
          'oneRackTravel3': oneRackTravel3,
          'oneRackTravel4': oneRackTravel4,
          'oneDeliver1': oneDeliver1,
          'oneDeliver2': oneDeliver2,
          'oneDeliver3': oneDeliver3,
          'oneDeliver4': oneDeliver4,
          'oneMax1': oneMax1,
          'oneMax2': oneMax2,
          'oneMax3': oneMax3,
          'oneMax4': oneMax4,
          'lever1': lever1,
          'lever2': lever2,
          'lever3': lever3,
          'lever4': lever4,
          'twoRackTravel1': twoRackTravel1,
          'twoRackTravel2': twoRackTravel2,
          'twoRackTravel3': twoRackTravel3,
          'twoRackTravel4': twoRackTravel4,
          'twoDeliver1': twoDeliver1,
          'twoDeliver2': twoDeliver2,
          'twoDeliver3': twoDeliver3,
          'twoDeliver4': twoDeliver4,
          'oneRemark': oneRemark,
          'twoRemark': twoRemark,
          'overFlow': overFlow,
          'adjustmentOfGoverner': adjustmentOfGoverner,
          'advanceAngle1': advanceAngle1,
          'advanceAngle2': advanceAngle2,
          'advanceAngle3': advanceAngle3,
          'advanceAngle4': advanceAngle4,
          'advanceAngle5': advanceAngle5,
             'advanceAngle6': advanceAngle6,
          'note': note,
          'searchArray': indexList,
          'date': DateTime.now().toIso8601String()
        });

        Navigator.of(context).pop();
      }),
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('Add Document'),
      ),
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
                                    'INJECTION PUMP',
                                    style: title1,
                                  )),
                              Container(
                                width: width / 8,
                                child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
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
                                    child: TextFormField(onChanged: (value) {
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
                                    child: TextFormField(onChanged: (value) {setState(() {
                                          
                                        });
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
                                  preStroke = value.toString();
                                })),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text('2) Injection Order'),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
                                  feedPressure = value.toString();
                                })),
                          ))
                    ],
                  ),
                  Row(
                    children: [
                      Text('2) Nozzle Opening Preassure'),
                      Container(
                          width: width / 8,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(onChanged: (value) {
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
                                      child: TextFormField(onChanged: (value) {
                                        onePumpSpeed1 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneRackTravel1 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneNos1 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneDeliver1 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneMax1 = value.toString();
                                        ;
                                      }))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        onePumpSpeed2 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneRackTravel2 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneNos2 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneDeliver2 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneMax2 = value.toString();
                                        ;
                                      }))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        onePumpSpeed3 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneRackTravel3 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneNos3 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneDeliver3 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneMax3 = value.toString();
                                      }))),
                                ],
                              ),
                              DataRow(
                                cells: <DataCell>[
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        onePumpSpeed4 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneRackTravel4 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneNos4 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        oneDeliver4 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
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
                                child: TextFormField(
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
                          child: TextFormField(onChanged: (value) {
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
                          child: TextFormField(onChanged: (value) {
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
                                    child: TextFormField(onChanged: (value) {
                                      lever1 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoRackTravel1 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoNos1 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoDeliver1 = value.toString();
                                    }))),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      lever2 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoRackTravel2 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoNos2 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoDeliver2 = value.toString();
                                    }))),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      lever3 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoRackTravel3 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoNos3 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoDeliver3 = value.toString();
                                    }))),
                              ],
                            ),
                            DataRow(
                              cells: <DataCell>[
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      lever4 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoRackTravel4 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
                                      twoNos4 = value.toString();
                                    }))),
                                DataCell(Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(onChanged: (value) {
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
                              child: TextFormField(
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
                          child: TextFormField(onChanged: (value) {
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
                                      child: TextFormField(onChanged: (value) {
                                        advanceAngle1 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        advanceAngle2 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        advanceAngle3 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        advanceAngle4 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
                                        advanceAngle5 = value.toString();
                                      }))),
                                  DataCell(Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(onChanged: (value) {
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
