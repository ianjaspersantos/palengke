import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:fluroapp/pages/sign_in_seller_page.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return SignUpPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final body = Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: SafeArea(
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(24.0),
                  padding: EdgeInsets.all(24.0),
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.circular(12.0),
                    border: Border.all(
                      color: scrimColor,
                      width: 0.5,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Hero(
                            tag: 'buyer',
                            child: Icon(
                              Icons.store,
                              color: color1,
                              size: 100.0,
                            ),
                          ),
                          Text(
                            'Sign Up to Palengke',
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.headline5.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                          ),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'You\'re signing up as a ',
                                ),
                                TextSpan(
                                  text: 'buyer',
                                  style: TextStyle(color: color1, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.start,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      TextFormField(
                        autocorrect: false,
                        cursorColor: scrimColor,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'First Name',
                          hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      TextFormField(
                        autocorrect: false,
                        cursorColor: scrimColor,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Last Name',
                          hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      TextFormField(
                        autocorrect: false,
                        cursorColor: scrimColor,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Email Address',
                          hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        ),
                      ),
                      SizedBox(
                        height: 6.0,
                      ),
                      TextFormField(
                        autocorrect: false,
                        cursorColor: scrimColor,
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'Password',
                          hintStyle: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      FlatButton(
                        color: color,
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          'SIGN UP',
                          style: Theme.of(context).textTheme.caption.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                      FlatButton(
                        onPressed: () => Navigator.of(context).pop(),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Text(
                          'BACK',
                          style: Theme.of(context).textTheme.caption.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.of(context).pushReplacement(SignInSellerPage.route()),
            child: Ink(
              color: color1,
              height: 56.0,
              child: Center(
                child: Text(
                  'SWITCH TO SELLER',
                  style: Theme.of(context).textTheme.button.copyWith(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      body: body,
    );
  }
}
