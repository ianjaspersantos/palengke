import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:fluroapp/pages/seller_master_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ConfirmedPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return ConfirmedPage();
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
        'Order Confirmed',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      actions: [],
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor.withOpacity(0.54),
      appBar: appBar,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Container(
                margin: EdgeInsets.all(24.0),
                padding: EdgeInsets.all(24.0),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  border: Border(
                    top: BorderSide(
                      color: color,
                      width: 2.0,
                    ),
                    bottom: BorderSide(
                      color: color,
                      width: 2.0,
                    ),
                    left: BorderSide(
                      color: color,
                      width: 2.0,
                    ),
                    right: BorderSide(
                      color: color,
                      width: 2.0,
                    ),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      FontAwesomeIcons.checkCircle,
                      color: color1,
                      size: 128.0,
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Thank You Ian!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'You\'ll receive an email when your order is ready.',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor, fontWeight: FontWeight.normal),
                    ),
                    SizedBox(
                      height: 32.0,
                    ),
                    Text(
                      'ORDER #18273645',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).pushReplacement(SellerMasterPage.route());
                },
                child: Ink(
                  color: color1,
                  height: 56.0,
                  child: Center(
                    child: Text(
                      'CONTINUE SHOPPING',
                      style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
