import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:technokingdiesel/widget.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    initialization();
  }

  void initialization() async {
    await Future.delayed(const Duration(seconds: 1));

    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          fontFamily: 'Nunito',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(fontFamily: 'Nunito',fontWeight: FontWeight.w700,fontSize: 20),
            backgroundColor: Color(0xFF4080B4),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color(0xFF4080B4),
          ),
          primaryColor: Color(0xFF4080B4),
          scaffoldBackgroundColor: Colors.grey.shade200

          //

          ),
      home: const MyHomePage(title: 'Techno King Diesel'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  // void _incrementCounter() async {
  //   await FirebaseFirestore.instance
  //       .collection('data')
  //       .doc((_counter).toString())
  //       .set({'num': _counter});

  // }

  @override
  Widget build(BuildContext context) {
    log('scafold');
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
            child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('data')
                    .orderBy('num')
                    .snapshots(),
                builder: (context, snapshot) {
                  return snapshot.connectionState == ConnectionState.waiting
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : ListView.builder(
                          shrinkWrap: true,
                          reverse: true,
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            _counter = snapshot.data!.docs.length;
                            log('rebuild');
                            return InkWell(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Detail(
                                      '',
                                      snapshot.data!.docs.reversed
                                          .toList()[index]
                                          .data()),
                                ));
                              },
                              child: Text(
                                snapshot.data!.docs.reversed
                                    .toList()[index]
                                    .data()['num']
                                    .toString(),
                                style: TextStyle(fontSize: 20),
                              ),
                            );
                          },
                        );
                })),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail('Add Document'),
            ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
