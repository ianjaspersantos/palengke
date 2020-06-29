import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:fluroapp/pages/seller_order_page.dart';
import 'package:flutter/material.dart';

class BuyerOrderDetail extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return BuyerOrderDetail();
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
        'Order Details',
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
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: 2.6 / 1.0,
                  child: OrderTile(
                    onTap: () {},
                  ),
                ),
                SizedBox(
                  height: 2.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: 12,
                    itemBuilder: (context, index) {
                      return OrderItemTile();
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(
                        height: 2.0,
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  showDialog<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Thank You'),
                        content: Text('We appreciate you leaving us a review'),
                        actions: [
                          FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              'CLOSE',
                              style: Theme.of(context).textTheme.button.copyWith(color: color1),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Ink(
                  color: color1,
                  height: 56.0,
                  child: Center(
                    child: Text(
                      'WRITE A REVIEW',
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

class OrderItemTile extends StatelessWidget {
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
              child: CachedNetworkImage(
                imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/romaine_lettuce_960x.jpg?v=1526788344',
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
