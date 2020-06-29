import 'package:fluroapp/pages/checkout_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return CartPage();
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
        'Cart Page',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor,
      appBar: appBar,
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return CartItem();
              },
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: 2.0,
                );
              },
            ),
          ),
          Divider(
            height: 0.0,
            color: scrimColor,
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: Text('Shipping')),
                    Text('Calculated at next step'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Total',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'PHP 280.00',
                      style: Theme.of(context).textTheme.bodyText2.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  Navigator.of(context).push(CheckoutPage.route());
                },
                child: Ink(
                  color: color1,
                  height: 56.0,
                  child: Center(
                    child: Text(
                      'CHECKOUT',
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

class CartItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              border: Border.all(
                color: scrimColor,
                width: 0.8,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: Image.network(
                'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/romaine_lettuce_960x.jpg?v=1526788344',
                width: 80.0,
                height: 80.0,
                fit: BoxFit.cover,
                alignment: AlignmentDirectional.center,
              ),
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Lettuce Romaine - 1.1Kg',
                      style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor),
                    ),
                    Text(
                      'P300.00 x 2 quantity',
                      style: Theme.of(context).textTheme.caption.copyWith(color: scrimColor),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: color1,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.remove,
                                size: 16.0,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                          Text('   2   '),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: EdgeInsets.all(2.0),
                              decoration: BoxDecoration(
                                color: color1,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.add,
                                size: 16.0,
                                color: backgroundColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            'P600.00',
            style: Theme.of(context).textTheme.subtitle1.copyWith(color: color1),
          ),
        ],
      ),
    );
  }
}
