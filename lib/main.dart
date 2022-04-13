import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:paginate_firestore/bloc/pagination_listeners.dart';
import 'package:paginate_firestore/paginate_firestore.dart';
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
  TextEditingController? _addNameController;
  String? searchString = '';
  var focusNode = FocusNode();
  @override
  void initState() {
    super.initState();
    getProducts();
    _addNameController = TextEditingController();
  }

  List<DocumentSnapshot<Map<String, dynamic>>> products =
      []; // stores fetched products
  bool isLoading = false; // track if products fetching
  bool hasMore = true; // flag for more products available or not
  int documentLimit = 20; // docs to be fetched per request
  DocumentSnapshot<Map<String, dynamic>>?
      lastDocument; // flag for last document from where next 10 records to be fetched
  ScrollController _scrollController =
      ScrollController(); // listener for listview scrolling

  getProducts() async {
    if (!hasMore) {
      print('No More Products');
      return;
    }
    if (isLoading) {
      return;
    }
    setState(() {
      isLoading = true;
    });
    QuerySnapshot<Map<String, dynamic>> querySnapshot;
    if (lastDocument == null) {
      log('ge last');
      querySnapshot = await FirebaseFirestore.instance
          .collection('data')
          // .orderBy('date')
          .limit(documentLimit)
          .orderBy('date', descending: true)
          .get();
    } else {
      log('ge page');
      querySnapshot = await FirebaseFirestore.instance
          .collection('data')
          .orderBy('date', descending: true)
          .limit(documentLimit)
          // .orderBy('date')
          .startAfterDocument(lastDocument!)
          .get();
    }
    if (querySnapshot.docs.length < documentLimit) {
      hasMore = false;
    }
    if (querySnapshot.docs.isEmpty) {
      setState(() {
        isLoading = false;
      });
      return;
    }
    log(querySnapshot.docs.last.id);
    lastDocument = querySnapshot.docs.last;

    products.addAll(querySnapshot.docs);

    setState(() {
      isLoading = false;
    });
  }

  @override
  void didChangeDependencies() {
    log('did');
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    log('dsisptos');
    super.dispose();
  }

  PaginateRefreshedChangeListener refreshChangeListener =
      PaginateRefreshedChangeListener();

  @override
  Widget build(BuildContext context) {
    log('scafold');
    _scrollController.addListener(() {
      double maxScroll = _scrollController.position.maxScrollExtent;
      double currentScroll = _scrollController.position.pixels;
      double delta = MediaQuery.of(context).size.height * 0.20;
      if (maxScroll - currentScroll <= delta) {
        getProducts();
      }
    });
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
                child: PaginateFirestore( itemBuilderType: PaginateBuilderType.listView,
                  // orderBy is compulsary to enable pagination
                  query: FirebaseFirestore.instance.collection('data'),

                  listeners: [
                    refreshChangeListener,
                  ],
                  itemBuilder: (context, documentSnapshots, index) =>  InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Detail(
                                        '',
                                        (products[index].data()
                                            as Map<String, dynamic>)),
                                  ));
                                },
                                child:ListTile(
                    leading: CircleAvatar(child: Icon(Icons.person)),
                    title:
                        Text((documentSnapshots[index].data() as Map)['seri']),
                    subtitle: Text(documentSnapshots[index].id),
                  
                 
                ))),
                onRefresh: () async {
                  refreshChangeListener.refreshed = true;
                },
              )
            : StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                stream: FirebaseFirestore.instance
                    .collection('data')
                    .limit(20)
                    .where('searchArray', arrayContains: searchString)
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Detail(
                                        '',
                                        (products[index].data()
                                            as Map<String, dynamic>)),
                                  ));
                                },
                                child: ListTile(
                                  leading:
                                      CircleAvatar(child: Icon(Icons.person)),
                                  title: Text((snapshot.data!.docs[index]
                                      .data()['seri'])),
                                  subtitle: Text(snapshot.data!.docs[index]
                                      .data()['date']),
                                ));
                          },
                        );
                }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            // for (var i = 1; i <= 100; i++) {

            //   List<String> splitList =i.toString().split(" ");
            //         List<String> indexList = [];
            //         for (int i = 0; i < splitList.length; i++) {
            //           for (int y = 1; y < splitList[i].length + 1; y++) {
            //             indexList
            //                 .add(splitList[i].substring(0, y).toLowerCase());
            //           }
            //         }
            //   await FirebaseFirestore.instance
            //       .collection('data')
            //       .doc(DateTime.now().toIso8601String())
            //       .set(
            //           {'seri': '$i', 'date': DateTime.now().toIso8601String()});
            // }

            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail('Add Document'),
            ));
          },
          child: const Icon(Icons.add),
        ));
  }
}
