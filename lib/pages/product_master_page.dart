import 'package:fluroapp/pages/product_detail_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cart_page.dart';

class ProductMasterPage extends StatelessWidget {
  const ProductMasterPage({
    Key key,
    @required this.seller,
  })  : assert(seller != null),
        super(key: key);

  static PageRoute<T> route<T>(Seller seller) {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return ProductMasterPage(
          seller: seller,
        );
      },
    );
  }

  final Seller seller;

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(
      elevation: 1.0,
      brightness: Brightness.light,
      backgroundColor: backgroundColor,
      iconTheme: IconThemeData(color: scrimColor),
      actionsIconTheme: IconThemeData(color: scrimColor),
      title: Text(
        '${seller.name}',
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
      child: Row(
        children: [
          NavigationRail(
            elevation: 1.0,
            backgroundColor: Color(0xFFFDF0C4),
            labelType: NavigationRailLabelType.all,
            selectedIconTheme: IconThemeData(color: Color(0xFFF7A992)),
            selectedLabelTextStyle: Theme.of(context).textTheme.overline.copyWith(color: Color(0xFFF7A992), fontWeight: FontWeight.bold),
            unselectedIconTheme: IconThemeData(color: Color(0xFF4C364D)),
            unselectedLabelTextStyle: Theme.of(context).textTheme.overline.copyWith(color: Color(0xFF4C364D), fontWeight: FontWeight.normal),
            destinations: [
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.layerGroup),
                label: Text('All'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.appleAlt),
                label: Text('Fruits'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.hotdog),
                label: Text('Snacks'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.drumstickBite),
                label: Text('Meats'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.fish),
                label: Text('Fishes'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.carrot),
                label: Text('Veggies'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.bone),
                label: Text('Pet'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.seedling),
                label: Text('Seeds'),
              ),
            ],
            selectedIndex: 0,
          ),
          VerticalDivider(
            width: 0.0,
            thickness: 0.1,
            color: Color(0xFF4C364D),
          ),
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(2.0),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 3.0 / 4.0,
                crossAxisCount: 2,
                crossAxisSpacing: 2.0,
                mainAxisSpacing: 2.0,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products.elementAt(index);

                return AspectRatio(
                  aspectRatio: 2.8 / 1.0,
                  child: ProductTile(
                    product: product,
                    isOdd: index.isOdd,
                    onTap: () {
                      Navigator.of(context).push(ProductDetailPage.route(product));
                    },
                  ),
                );
              },
            ),
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

class ProductTile extends StatelessWidget {
  final Product product;
  final GestureTapCallback onTap;
  final bool isOdd;

  const ProductTile({
    Key key,
    @required this.product,
    @required this.onTap,
    @required this.isOdd,
  })  : assert(product != null),
        assert(onTap != null),
        assert(isOdd != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl = product.imageUrl;
    final name = product.name;
    final formattedPrice = product.formattedPrice;

    final borderOdd = Border(
      top: BorderSide(
        width: 0.2,
        color: scrimColor,
      ),
      bottom: BorderSide(
        width: 0.2,
        color: scrimColor,
      ),
      left: BorderSide(
        width: 0.2,
        color: scrimColor,
      ),
      right: BorderSide(
        width: 10,
        color: color,
      ),
    );

    final borderEven = Border(
      top: BorderSide(
        width: 0.2,
        color: scrimColor,
      ),
      bottom: BorderSide(
        width: 0.2,
        color: scrimColor,
      ),
      right: BorderSide(
        width: 0.2,
        color: scrimColor,
      ),
      left: BorderSide(
        width: 10,
        color: color,
      ),
    );

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          border: isOdd ? borderOdd : borderEven,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(1.0),
                child: Hero(
                  tag: '${product.id}',
                  child: Image.network(
                    '$imageUrl',
                    fit: BoxFit.cover,
                    alignment: AlignmentDirectional.center,
                  ),
                ),
              ),
            ),
            Divider(
              height: 0.0,
              thickness: 0.2,
              color: scrimColor,
            ),
            Container(
              padding: EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Text(
                    '$name',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.caption.copyWith(color: scrimColor, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '-',
                    style: Theme.of(context).textTheme.overline,
                  ),
                  Text(
                    '$formattedPrice',
                    style: Theme.of(context).textTheme.caption.copyWith(color: color1),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final DateTime createdTime;
  final DateTime updatedTime;
  final String id;

  final String imageUrl;
  final String name;
  final double price;

  const Product({
    @required this.createdTime,
    @required this.updatedTime,
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.price,
  });

  String get formattedPrice {
    return 'PHP ${price.toStringAsFixed(2)}';
  }
}

final products = [
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '1',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Chopsuey_960x.jpg?v=1575277049',
    name: 'Chopsuey - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '2',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_T_71283e08-27e6-4946-b053-cd2a027b5c97_960x.jpg?v=1575952310',
    name: 'Pinakbet Tagalog - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '3',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Sinigang_PB_Small_998d0057-c572-45ae-9e04-c6ea3c1b215c_960x.jpg?v=1575285968',
    name: 'Sinigang - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '4',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_I_960x.jpg?v=1575949404',
    name: 'Pinakbet Ilocano - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '5',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/nilaga_960x.jpg?v=1585839804',
    name: 'Nilaga - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '6',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/bolalo_960x.jpg?v=1585839187',
    name: 'Bulalo - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '7',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Chopsuey_960x.jpg?v=1575277049',
    name: 'Chopsuey - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '8',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_T_71283e08-27e6-4946-b053-cd2a027b5c97_960x.jpg?v=1575952310',
    name: 'Pinakbet Tagalog - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '9',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Sinigang_PB_Small_998d0057-c572-45ae-9e04-c6ea3c1b215c_960x.jpg?v=1575285968',
    name: 'Sinigang - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '10',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_I_960x.jpg?v=1575949404',
    name: 'Pinakbet Ilocano - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '11',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/nilaga_960x.jpg?v=1585839804',
    name: 'Nilaga - 1.5Kg',
    price: 280.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '12',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/bolalo_960x.jpg?v=1585839187',
    name: 'Bulalo - 1.5Kg',
    price: 280.00,
  ),
  // ----------
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '13',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/red_chili_wholesale_960x.png?v=1525676807',
    name: 'Chili Red - 1/4Kg',
    price: 70.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '14',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/ginger_095b732a-163d-4980-86e4-c6cac04af8c4_960x.jpg?v=1591452383',
    name: 'Ginger - 1/4Kg',
    price: 90.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '15',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/romaine_lettuce_960x.jpg?v=1526788344',
    name: 'Lettuce Romaine - 1.1Kg',
    price: 300.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '16',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/cauliflower_2_960x.jpg?v=1526787253',
    name: 'Cauliflower - 1.1Kg',
    price: 300.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '17',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/IMG_3276_960x.jpg?v=1575871843',
    name: 'Bell Pepper Red - 1/2Kg',
    price: 200.00,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '18',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/iceburg_960x.jpg?v=1585839569',
    name: 'Lettuce Iceberg - 1.1Kg',
    price: 300.00,
  ),
];
