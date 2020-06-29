import 'package:fluroapp/pages/buyer_order_detail_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:fluroapp/pages/seller_order_page.dart';
import 'package:flutter/material.dart';

class BuyerOrderPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(builder: (context) {
      return BuyerOrderPage();
    });
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
        'My Orders',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      actions: [],
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor.withOpacity(0.54),
      appBar: appBar,
      body: ListView.separated(
        itemCount: 12,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 2.6 / 1.0,
            child: OrderTile(
              onTap: () {
                Navigator.of(context).push(BuyerOrderDetail.route());
              },
            ),
          );
        },
        separatorBuilder: (context, index) {
          return SizedBox(
            height: 2.0,
          );
        },
      ),
    );
  }
}
