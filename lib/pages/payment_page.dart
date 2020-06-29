import 'package:fluroapp/pages/confirmed_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return PaymentPage();
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
        'Payment',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      actions: [],
    );

    final body = Container(
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(16.0),
                padding: EdgeInsets.all(16.0),
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
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'All transactions are secured and encrypted',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    RadioListTile(
                      onChanged: (value) {},
                      value: false,
                      groupValue: 'payment',
                      title: Text('PayPal'),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    RadioListTile(
                      onChanged: (value) {},
                      value: true,
                      groupValue: 'payment',
                      title: Text('Cash On Delivery (COD)'),
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
                  Navigator.of(context).pushAndRemoveUntil(ConfirmedPage.route(), (route) => route.settings.name == 'seller-master-page');
                },
                child: Ink(
                  color: color1,
                  height: 56.0,
                  child: Center(
                    child: Text(
                      'CONFIRM ORDER',
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

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: appBar,
      body: body,
    );
  }
}
