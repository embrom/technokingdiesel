import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:technokingdiesel/widget.dart';

const page = PageTransitionsTheme(builders: {
  TargetPlatform.android: CupertinoPageTransitionsBuilder(),
  TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
  TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
  TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
});
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

  void initialization() {
    FlutterNativeSplash.remove();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          pageTransitionsTheme: page,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(1),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 0, 80, 145),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 0, 80, 145),
                width: 4,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            suffixStyle: TextStyle(color: Colors.white),
          ),
          fontFamily: 'Nunito',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                fontFamily: 'Nunito',
                fontWeight: FontWeight.w700,
                fontSize: 20),
            backgroundColor: Color(0xFF4080B4),
          ),
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            backgroundColor: Color.fromARGB(255, 0, 80, 145),
          ),
          primaryColor: Colors.red,
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.green),
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
  TextEditingController? _addNameController;
  String? searchString = '';
  var focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    _addNameController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    log('scafold');
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: TextFormField(
              cursorColor: Color.fromARGB(255, 0, 80, 145),
              decoration: InputDecoration(
                hintText: 'Cari Mesin...',
                prefixIcon: Icon(Icons.search),
              ),
              focusNode: focusNode,
              onFieldSubmitted: (value) {
                focusNode.unfocus();
              },
              keyboardType: TextInputType.name,
              controller: _addNameController,
              onChanged: (val) {
                setState(() {
                  searchString = val;
                });
              },
            ),
          ),
        ),
        body: Center(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: FirebaseFirestore.instance
                  .collection('data')
                  .orderBy('seri')
                  .limit(50)
                  .snapshots(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Color(0xFF4080B4),
                          color: Color.fromARGB(255, 0, 80, 145),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        reverse: true,
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) {
                          _counter = snapshot.data!.docs.length;
                          log('rebuild');
                          return Card(
                            child: InkWell(
                              onTap: () {
                                focusNode.unfocus();
                                Navigator.of(context)
                                    .push(MaterialPageRoute(builder: (context) {
                                  var data = snapshot.data!.docs.reversed
                                      .toList()[index]
                                      .data();
                                  data['id'] = snapshot.data!.docs.reversed
                                      .toList()[index]
                                      .id;
                                  return Detail('', data);
                                }));
                              },
                              child: Text(
                                snapshot.data!.docs.reversed
                                    .toList()[index]
                                    .data()['seri']
                                    .toString(),
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                          );
                        },
                      );
              }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail('Add Document'),
            ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
