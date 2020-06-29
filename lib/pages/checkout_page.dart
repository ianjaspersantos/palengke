import 'package:fluroapp/pages/payment_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';

class CheckoutPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return CheckoutPage();
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
        'Checkout Page',
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
                      'Personal Information',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      autocorrect: false,
                      cursorColor: scrimColor,
                      initialValue: 'Ian Jasper',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'First Name',
                        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      autocorrect: false,
                      cursorColor: scrimColor,
                      initialValue: 'Santos',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Last Name',
                        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      ),
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Billing Address',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      autocorrect: false,
                      cursorColor: scrimColor,
                      initialValue: 'San Isidro',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Address',
                        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      autocorrect: false,
                      cursorColor: scrimColor,
                      initialValue: 'San Luis',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'City/Municipality',
                        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      autocorrect: false,
                      cursorColor: scrimColor,
                      initialValue: 'Pampanga',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Province',
                        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            autocorrect: false,
                            cursorColor: scrimColor,
                            initialValue: 'Philippines',
                            style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'Country',
                              labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 8.0,
                        ),
                        Expanded(
                          child: TextFormField(
                            autocorrect: false,
                            cursorColor: scrimColor,
                            initialValue: '2014',
                            style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                            decoration: InputDecoration(
                              filled: true,
                              labelText: 'Postal Code',
                              labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 24.0,
                    ),
                    Text(
                      'Others',
                      textAlign: TextAlign.start,
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                    TextFormField(
                      autocorrect: false,
                      cursorColor: scrimColor,
                      initialValue: '9171234567',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      decoration: InputDecoration(
                        filled: true,
                        labelText: 'Mobile Number',
                        labelStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        prefixText: '+63',
                        prefixStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      ),
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
                  Navigator.of(context).push(PaymentPage.route());
                },
                child: Ink(
                  color: color1,
                  height: 56.0,
                  child: Center(
                    child: Text(
                      'CONTINUE TO PAYMENT',
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
