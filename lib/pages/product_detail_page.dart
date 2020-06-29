import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluroapp/pages/product_master_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class ProductDetailPage extends StatelessWidget {
  static PageRoute<T> route<T>(Product product) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ProductDetailPage(
          product: product,
        );
      },
    );
  }

  const ProductDetailPage({
    Key key,
    @required this.product,
  })  : assert(product != null),
        super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.imageUrl;
    final name = product.name;

    final appBar = AppBar(
      elevation: 1.0,
      brightness: Brightness.light,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: scrimColor),
      actionsIconTheme: IconThemeData(color: scrimColor),
      title: Text(
        'Product Detail Page',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.of(context).push(CartPage.route()),
        ),
      ],
    );

    final body = Container(
      decoration: BoxDecoration(
        color: Colors.white30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: ListView(
              children: [
                AspectRatio(
                  aspectRatio: 1.0 / 1.0,
                  child: Container(
                    decoration: BoxDecoration(
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
                          width: 10.0,
                        ),
                        right: BorderSide(
                          color: color,
                          width: 10.0,
                        ),
                      ),
                    ),
                    child: Hero(
                      tag: '${product.id}',
                      child: CachedNetworkImage(
                        imageUrl: '$imageUrl',
                        fit: BoxFit.cover,
                        alignment: AlignmentDirectional.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Vegetables',
                        style: Theme.of(context).textTheme.overline.copyWith(color: scrimColor),
                      ),
                      Text(
                        '$name',
                        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                        style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Builder(
            builder: (BuildContext context) {
              return InkWell(
                onTap: () {
                  Scaffold.of(context).showSnackBar(
                    SnackBar(
                      content: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '1 Pinakbet Ilocano - 1.5Kg',
                              style: TextStyle(
                                color: backgroundColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' has been added',
                            ),
                          ],
                        ),
                      ),
                      backgroundColor: scrimColor,
                      action: SnackBarAction(
                        label: 'VIEW',
                        textColor: backgroundColor,
                        onPressed: () {
                          Navigator.of(context).push(CartPage.route());
                        },
                      ),
                    ),
                  );
                },
                child: Ink(
                  color: color1,
                  height: 56.0,
                  child: Center(
                    child: Text(
                      'ADD TO CART',
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
      drawerScrimColor: scrimColor,
      appBar: appBar,
      body: body,
    );
  }
}
