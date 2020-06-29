import 'package:fluroapp/pages/about_page.dart';
import 'package:fluroapp/pages/order_detail_page.dart';
import 'package:fluroapp/pages/privacy_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:fluroapp/pages/sign_in_seller_page.dart';
import 'package:fluroapp/pages/terms_page.dart';
import 'package:flutter/material.dart';

class SellerOrderPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return SellerOrderPage();
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
        'Order Master Page',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      actions: [],
    );

    final drawer = Drawer(
      child: Ink(
        color: color,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              currentAccountPicture: Hero(
                tag: 'buyer',
                child: Icon(
                  Icons.store,
                  color: backgroundColor,
                  size: 80.0,
                ),
              ),
              accountName: Text(
                'Ian Jasper Santos',
                style: TextStyle(color: backgroundColor),
              ),
              accountEmail: Text(
                'ianjaspersantos@gmail.com',
                style: TextStyle(color: backgroundColor),
              ),
              decoration: BoxDecoration(
                color: scrimColor,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: scrimColor.withOpacity(0.5),
                border: Border(
                  left: BorderSide(
                    color: backgroundColor,
                    width: 5.0,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(
                  'My Orders',
                  style: TextStyle(
                    color: backgroundColor,
                  ),
                ),
                onTap: () {},
              ),
            ),
            ListTile(
              title: Text(
                'Privacy Policy',
                style: TextStyle(
                  color: scrimColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(PrivacyPage.route());
              },
            ),
            ListTile(
              title: Text(
                'Terms Of Service',
                style: TextStyle(
                  color: scrimColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(TermsPage.route());
              },
            ),
            ListTile(
              title: Text(
                'About Us',
                style: TextStyle(
                  color: scrimColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(AboutPage.route());
              },
            ),
            ListTile(
              title: Text(
                'Logout',
                style: TextStyle(
                  color: scrimColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(SignInSellerPage.route(), (route) => false);
              },
            ),
          ],
        ),
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor.withOpacity(0.54),
      appBar: appBar,
      drawer: drawer,
      body: ListView.separated(
        itemCount: 12,
        itemBuilder: (context, index) {
          return AspectRatio(
            aspectRatio: 2.6 / 1.0,
            child: OrderTile(
              onTap: () {
                Navigator.of(context).push(OrderDetailPage.route());
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

class OrderTile extends StatelessWidget {
  final GestureTapCallback onTap;

  const OrderTile({
    Key key,
    @required this.onTap,
  })  : assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          border: Border(
            top: BorderSide(
              color: scrimColor,
              width: 0.2,
            ),
            bottom: BorderSide(
              color: scrimColor,
              width: 0.2,
            ),
            left: BorderSide(
              color: color,
              width: 10.0,
            ),
            right: BorderSide(
              color: color,
              width: 10.0,
            ),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      'Order #156123',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0),
                    ),
                  ),
                  Text(
                    'P245.00',
                    style: Theme.of(context).textTheme.subtitle1.copyWith(color: color1, fontSize: 24.0),
                  ),
                ],
              ),
              Text(
                'June 13 at 12:09 PM',
                style: Theme.of(context).textTheme.caption.copyWith(color: scrimColor),
              ),
              Divider(),
              Text(
                'Ian Jasper Santos (ianjaspersantos@gmail.com)',
                style: Theme.of(context).textTheme.caption.copyWith(color: scrimColor),
              ),
              Text(
                'San Isidro, San Luis, Pampanga',
                style: Theme.of(context).textTheme.caption.copyWith(color: scrimColor),
              ),
              Spacer(),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 4.0,
                ),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Text(
                  'Processing',
                  style: Theme.of(context).textTheme.caption.copyWith(color: backgroundColor),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
