import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:fluroapp/pages/sign_in_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Palengke',
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: GoogleFonts.smythe(fontSize: 108, fontWeight: FontWeight.w300, letterSpacing: -1.5),
          headline2: GoogleFonts.smythe(fontSize: 68, fontWeight: FontWeight.w300, letterSpacing: -0.5),
          headline3: GoogleFonts.smythe(fontSize: 54, fontWeight: FontWeight.w400),
          headline4: GoogleFonts.smythe(fontSize: 38, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          headline5: GoogleFonts.smythe(fontSize: 27, fontWeight: FontWeight.w400),
          headline6: GoogleFonts.smythe(fontSize: 23, fontWeight: FontWeight.w500, letterSpacing: 0.15),
          subtitle1: GoogleFonts.smythe(fontSize: 18, fontWeight: FontWeight.w400, letterSpacing: 0.15),
          subtitle2: GoogleFonts.smythe(fontSize: 16, fontWeight: FontWeight.w500, letterSpacing: 0.1),
          bodyText1: GoogleFonts.openSans(fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.5),
          bodyText2: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25),
          button: GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 1.25),
          caption: GoogleFonts.openSans(fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.4),
          overline: GoogleFonts.openSans(fontSize: 10, fontWeight: FontWeight.w400, letterSpacing: 1.5),
        ),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future<void>.delayed(Duration(seconds: 2)).then((value) => Navigator.of(context).pushReplacement(SignInPage.route()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      drawerScrimColor: Colors.blueGrey.shade900.withOpacity(0.54),
      appBar: AppBar(
        elevation: 0.0,
        brightness: Brightness.dark,
        backgroundColor: Colors.black87,
        iconTheme: IconThemeData(
          color: Colors.blueGrey.shade50,
        ),
      ),
      body: Container(
        color: Colors.black87,
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 16.0,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: backgroundColor,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Hero(
                        tag: 'buyer',
                        child: Icon(
                          Icons.store,
                          size: 100.0,
                          color: backgroundColor,
                        ),
                      ),
                      Text(
                        'Palengke',
                        style: Theme.of(context).textTheme.headline5.copyWith(color: backgroundColor, letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'from',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyText1.copyWith(color: backgroundColor.withOpacity(0.5)),
                  ),
                  Text(
                    'Team Brainnovative',
                    textAlign: TextAlign.center,
                    style:
                        Theme.of(context).textTheme.bodyText1.copyWith(color: backgroundColor, fontSize: 18.0, fontWeight: FontWeight.bold, letterSpacing: 1.2),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
