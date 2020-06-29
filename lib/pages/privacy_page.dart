import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';

class PrivacyPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return PrivacyPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 1.0,
      brightness: Brightness.light,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: scrimColor),
      actionsIconTheme: IconThemeData(color: scrimColor),
      title: Text(
        'Privacy Policy',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      actions: [],
    );

    final body = Column(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.all(64.0),
            child: Center(
              child: Text(
                'Oh looks like you are really excited about this app 🤩',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Ink(
            color: color1,
            height: 56.0,
            child: Center(
              child: Text(
                'BACK',
                style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor.withOpacity(0.54),
      appBar: appBar,
      body: body,
    );
  }
}
