import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';

import 'package:technokingdiesel/add.dart';
import 'package:technokingdiesel/update.dart';
import 'package:technokingdiesel/view.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Techno King',
      theme: ThemeData(
          pageTransitionsTheme: page,
          inputDecorationTheme: InputDecorationTheme(
            fillColor: Colors.white,
            contentPadding: EdgeInsets.all(10),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 0, 80, 145),
                width: 2,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: Color.fromARGB(255, 0, 80, 145),
                width: 2,
              ),
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            suffixStyle: TextStyle(color: Colors.white),
          ),
          fontFamily: 'Nunito',
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(
                color: Colors.white,
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
  TextEditingController? _addNameController;
  String? searchString = '';
  var focusNode = FocusNode();
  @override
  void initState() {
    super.initState();

    _addNameController = TextEditingController();
  }

  List<DocumentSnapshot<Map<String, dynamic>>> products = [];
  bool isLoading = false;
  bool hasMore = true;
  int documentLimit = 20;
  DocumentSnapshot<Map<String, dynamic>>? lastDocument;

  PaginateRefreshedChangeListener refreshChangeListener =
      PaginateRefreshedChangeListener();

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
        body: searchString == ''
            ? RefreshIndicator(
                child: PaginateFirestore(
                    itemBuilderType: PaginateBuilderType.listView,
                    // orderBy is compulsary to enable pagination
                    query: FirebaseFirestore.instance
                        .collection('data')
                        .orderBy('date', descending: true),
                    isLive: true,
                    listeners: [
                      refreshChangeListener,
                    ],
                    itemBuilder: (context, documentSnapshots, index) {
                      Map data2 = documentSnapshots[index].data() as Map;
                      return InkWell(
                          onTap: () {
                            // data['id'] = documentSnapshots[index].id;
                            focusNode.unfocus();
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                View(data2, documentSnapshots[index].id),
                            ));
                          },
                          child: ListTile(
                            leading: CircleAvatar(child: Icon(Icons.person)),
                            title: Text(data2['injectionPump']!),
                            subtitle: Text(documentSnapshots[index].id),
                          ));
                    }),
                onRefresh: () async {
                  refreshChangeListener.refreshed = true;
                },
              )
            : StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('data')
                    .limit(30)
                    .where('searchArray',
                        arrayContains: searchString!.toLowerCase())
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
                            log('rebuild');
                            return InkWell(
                                onTap: () {
                                  focusNode.unfocus();
                                  // Navigator.of(context).push(MaterialPageRoute(
                                  //   builder: (context) => Detail(
                                  //       '',
                                  //       (products[index].data()
                                  //           as Map<String, dynamic>)),
                                  // ));
                                },
                                child: ListTile(
                                  leading:
                                      CircleAvatar(child: Icon(Icons.person)),
                                  title: Text((snapshot.data!.docs[index]
                                      .data()['injectionPump'])),
                                  subtitle: Text(snapshot.data!.docs[index]
                                      .data()['note']),
                                ));
                          },
                        );
                }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            focusNode.unfocus();
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail(),
            ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
