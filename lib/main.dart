import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mohammadi_shopping/bloc/product_bloc.dart';
import 'package:mohammadi_shopping/bloc/sliders_bloc.dart';
import 'package:mohammadi_shopping/configs.dart';
import 'package:mohammadi_shopping/repo/product_repo.dart';
import 'package:mohammadi_shopping/repo/sliders_repo.dart';
import 'package:mohammadi_shopping/ui/main_pages/home/home.dart';
import 'package:titled_navigation_bar/titled_navigation_bar.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Home(),
    Home(),
    Home(),
    Home(),
    Home()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarBrightness: Brightness.light,
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.light,
    ));

    return MaterialApp(
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: [Locale("fa", "IR")],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: Configs.IRANSANS),
      home: Scaffold(
        appBar: AppBar(
          title: Text(""),
        ),
        backgroundColor: Colors.white,
        body: MultiBlocProvider(
          providers: [
            BlocProvider<SlidersBloc>(
              create: (context) => SlidersBloc(SlidersRepo()),
              child: _widgetOptions.elementAt(0),
            ),
            BlocProvider<GetNewestProductBloc>(
              create: (context) => GetNewestProductBloc(ProductRepo()),
              child: _widgetOptions.elementAt(0),
            ),
          ],
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: TitledBottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            TitledNavigationBarItem(
                icon: Icons.category, title: Text('دسته‌بندی')),
            TitledNavigationBarItem(
                icon: Icons.card_membership, title: Text('برندها')),
            TitledNavigationBarItem(icon: Icons.home, title: Text('خانه')),
            TitledNavigationBarItem(icon: Icons.search, title: Text('جستجو')),
            TitledNavigationBarItem(icon: Icons.person, title: Text('شما')),
          ],
        ),
      ),
    );
  }
}
