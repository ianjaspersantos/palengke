import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluroapp/pages/product_detail_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'cart_page.dart';

class ProductMasterPage extends StatefulWidget {
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
  _ProductMasterPageState createState() => _ProductMasterPageState();
}

class _ProductMasterPageState extends State<ProductMasterPage> {
  int index = 0;

  List<Product> get items {
    if (index == 0) {
      return products.where((element) => true).toList();
    } else if (index == 1) {
      return products.where((element) => element.tag == ProductTag.fruits).toList();
    } else if (index == 2) {
      return products.where((element) => element.tag == ProductTag.snacks).toList();
    } else if (index == 3) {
      return products.where((element) => element.tag == ProductTag.meats).toList();
    } else if (index == 4) {
      return products.where((element) => element.tag == ProductTag.fishes).toList();
    } else if (index == 5) {
      return products.where((element) => element.tag == ProductTag.veggies).toList();
    } else if (index == 6) {
      return products.where((element) => element.tag == ProductTag.pet).toList();
    } else if (index == 7) {
      return products.where((element) => element.tag == ProductTag.seeds).toList();
    } else if (index == 8) {
      return products.where((element) => element.tag == ProductTag.health).toList();
    } else {
      return products.where((element) => element.tag == ProductTag.school).toList();
    }
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
        '${widget.seller.name}',
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
            selectedIndex: index,
            onDestinationSelected: (int index) => setState(() => this.index = index),
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
                label: Text('Seafoods'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.carrot),
                label: Text('Veggies'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.paw),
                label: Text('Pet'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.seedling),
                label: Text('Seeds'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.heartbeat),
                label: Text('Health'),
              ),
              NavigationRailDestination(
                icon: Icon(FontAwesomeIcons.graduationCap),
                label: Text('School'),
              ),
            ],
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
              itemCount: items.length,
              itemBuilder: (context, index) {
                final product = items.elementAt(index);

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
                  child: CachedNetworkImage(
                    imageUrl: '$imageUrl',
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
  final ProductTag tag;

  const Product({
    @required this.createdTime,
    @required this.updatedTime,
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.price,
    @required this.tag,
  });

  String get formattedPrice {
    return 'PHP ${price.toStringAsFixed(2)}';
  }
}

enum ProductTag {
  fruits,
  snacks,
  meats,
  fishes,
  veggies,
  pet,
  seeds,
  health,
  school,
}

final products = [
  // Fruits
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '1',
    imageUrl: 'https://www.freshproduce.com.ph/430-home_default_2x/orange-mandarin.jpg',
    name: 'Orange Mandarin - 1pc',
    price: 38.00,
    tag: ProductTag.fruits,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '2',
    imageUrl: 'https://www.freshproduce.com.ph/432-home_default_2x/lemon-yellow.jpg',
    name: 'Lemoon Yellow - 1pc',
    price: 25.00,
    tag: ProductTag.fruits,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '3',
    imageUrl: 'https://www.freshproduce.com.ph/628-home_default_2x/apple-fuji-size-88.jpg',
    name: 'Apple Fuji - 1pc',
    price: 42.00,
    tag: ProductTag.fruits,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '4',
    imageUrl: 'https://www.freshproduce.com.ph/539-home_default_2x/orange-navel-size-88.jpg',
    name: 'Orange - 1pc',
    price: 47.00,
    tag: ProductTag.fruits,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '5',
    imageUrl: 'https://www.freshproduce.com.ph/392-home_default_2x/mango-ripe.jpg',
    name: 'Mango Ripe - 1pc',
    price: 46.00,
    tag: ProductTag.fruits,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '6',
    imageUrl: 'https://www.freshproduce.com.ph/614-home_default_2x/blueberry-imported-170gms.jpg',
    name: 'Blueberry - 170gm',
    price: 500.00,
    tag: ProductTag.fruits,
  ),

  // Vegies
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '7',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Chopsuey_960x.jpg?v=1575277049',
    name: 'Chopsuey - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '8',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_T_71283e08-27e6-4946-b053-cd2a027b5c97_960x.jpg?v=1575952310',
    name: 'Pinakbet Tagalog - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '9',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Sinigang_PB_Small_998d0057-c572-45ae-9e04-c6ea3c1b215c_960x.jpg?v=1575285968',
    name: 'Sinigang - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '10',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_I_960x.jpg?v=1575949404',
    name: 'Pinakbet Ilocano - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '11',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/nilaga_960x.jpg?v=1585839804',
    name: 'Nilaga - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '12',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/bolalo_960x.jpg?v=1585839187',
    name: 'Bulalo - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '13',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Chopsuey_960x.jpg?v=1575277049',
    name: 'Chopsuey - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '14',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_T_71283e08-27e6-4946-b053-cd2a027b5c97_960x.jpg?v=1575952310',
    name: 'Pinakbet Tagalog - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '15',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Sinigang_PB_Small_998d0057-c572-45ae-9e04-c6ea3c1b215c_960x.jpg?v=1575285968',
    name: 'Sinigang - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '16',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/Pakbet_I_960x.jpg?v=1575949404',
    name: 'Pinakbet Ilocano - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '17',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/nilaga_960x.jpg?v=1585839804',
    name: 'Nilaga - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '18',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/bolalo_960x.jpg?v=1585839187',
    name: 'Bulalo - 1.5Kg',
    price: 280.00,
    tag: ProductTag.veggies,
  ),
  // ----------
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '19',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/red_chili_wholesale_960x.png?v=1525676807',
    name: 'Chili Red - 1/4Kg',
    price: 70.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '20',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/ginger_095b732a-163d-4980-86e4-c6cac04af8c4_960x.jpg?v=1591452383',
    name: 'Ginger - 1/4Kg',
    price: 90.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '21',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/romaine_lettuce_960x.jpg?v=1526788344',
    name: 'Lettuce Romaine - 1.1Kg',
    price: 300.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '22',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/cauliflower_2_960x.jpg?v=1526787253',
    name: 'Cauliflower - 1.1Kg',
    price: 300.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '23',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/IMG_3276_960x.jpg?v=1575871843',
    name: 'Bell Pepper Red - 1/2Kg',
    price: 200.00,
    tag: ProductTag.veggies,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '24',
    imageUrl: 'https://cdn.shopify.com/s/files/1/0024/9695/4415/products/iceburg_960x.jpg?v=1585839569',
    name: 'Lettuce Iceberg - 1.1Kg',
    price: 300.00,
    tag: ProductTag.veggies,
  ),
  // SNACKS
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '25',
    imageUrl: 'https://pinoystore.kr/wp-content/uploads/2019/08/piattoscheese.jpg',
    name: 'Piattos - 1pc',
    price: 83.00,
    tag: ProductTag.snacks,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '26',
    imageUrl: 'https://www.homeshop.ph/image/cache/catalog/Products/Snacks/Chips/Nova-Cheddar-Chips-78g-500x500-product_popup.png',
    name: 'Nova - 1pc',
    price: 28.00,
    tag: ProductTag.snacks,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '27',
    imageUrl: 'https://www.beagleycopperman.com/media/catalog/product/cache/1/image/x800/9df78eab33525d08d6e5fb8d27136e95/6/5/6515-min.jpg',
    name: 'V-Cut - 1pc',
    price: 13.00,
    tag: ProductTag.snacks,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '28',
    imageUrl: 'https://www.sarisaristore.se/659-large_default/boy-bawang-cornick-garlic-flavor.jpg',
    name: 'Boy Bawang - 1pc',
    price: 50.00,
    tag: ProductTag.snacks,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '29',
    imageUrl: 'https://food.homeshop.ph/image/cache/catalog/Products/Snacks/Chips/Granny-Goose-Tortillos-Chili-Flavor-100g-500x500-product_popup.jpg',
    name: 'Tortillos - 1pc',
    price: 30.00,
    tag: ProductTag.snacks,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '30',
    imageUrl: 'https://i5.walmartimages.ca/images/Large/101/328/999999-4800016101328.jpg',
    name: 'Chippy - 1pc',
    price: 10.00,
    tag: ProductTag.snacks,
  ),
  // MEAT
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '31',
    imageUrl: 'https://thegreengrocermanila.com/wp-content/uploads/2015/12/naturally-raised-chicken-whole-dressed-1.jpg',
    name: 'Chicken',
    price: 250.00,
    tag: ProductTag.meats,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '32',
    imageUrl: 'https://www.caloriesecrets.net/wp-content/uploads/2017/08/pork-meat.jpg',
    name: 'Pork',
    price: 230.00,
    tag: ProductTag.meats,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '33',
    imageUrl: 'https://cdn.britannica.com/68/143268-050-917048EA/Beef-loin.jpg',
    name: 'Beef',
    price: 210.00,
    tag: ProductTag.meats,
  ),
  // FISHES
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '34',
    imageUrl: 'https://s3.amazonaws.com/bilyoimg/wp-content/uploads/2019/12/22175424/galungong.jpg',
    name: 'Galunggong - 1kg',
    price: 100.00,
    tag: ProductTag.fishes,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '35',
    imageUrl: 'https://geneticliteracyproject.org/wp-content/uploads/2018/12/dsg-nsst-gxt-un-foeq-1024x683.jpeg',
    name: 'Tilapia - 1kg',
    price: 100.00,
    tag: ProductTag.fishes,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '36',
    imageUrl: 'https://i0.wp.com/www.tagaloglang.com/ux/wp-content/uploads/2016/03/fresh_bangus_milkfish.jpg?fit=640%2C399&ssl=1',
    name: 'Bangus',
    price: 10.00,
    tag: ProductTag.fishes,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '37',
    imageUrl: 'https://shop.legalseafoods.com/images/popup/RawShrimp_102717.jpg',
    name: 'Shrimp',
    price: 10.00,
    tag: ProductTag.fishes,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '38',
    imageUrl: 'https://image.shutterstock.com/image-photo/serrated-mud-crab-mangrove-black-260nw-481911880.jpg',
    name: 'Crab',
    price: 10.00,
    tag: ProductTag.fishes,
  ),
  // PET FOOD
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '39',
    imageUrl:
        'https://www.pedigree.com/images/default-source/products/dry/pedigree-dry-dog-food-small-dog-roasted-chicken-rice-vegetable-flavor-front.tmb-400max.jpg?sfvrsn=a63c6349_0',
    name: 'Pedigree',
    price: 100.00,
    tag: ProductTag.pet,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '40',
    imageUrl: 'https://cf.shopee.ph/file/4a4349332a96eec2c8cc4c60eab6f88f',
    name: 'Infinity',
    price: 100.00,
    tag: ProductTag.pet,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '41',
    imageUrl: 'https://ph-test-11.slatic.net/p/3a68c79c2f4a6f65ac580f170d4a0f14.jpg',
    name: 'Whoopee',
    price: 100.00,
    tag: ProductTag.pet,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '42',
    imageUrl: 'https://www.petwarehouse.ph/8843-thickbox_default/versele-laga-lara-junior-2kg-cat-dry-food.jpg',
    name: 'Lara Junior',
    price: 100.00,
    tag: ProductTag.pet,
  ),
  // SEEDS
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '43',
    imageUrl: 'https://ph-test-11.slatic.net/p/1937a158a5c9d36d7548213944f68eea.jpg',
    name: 'Pechay Seeds',
    price: 100.00,
    tag: ProductTag.seeds,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '44',
    imageUrl: 'https://ph-test-11.slatic.net/p/5d2cad776fee72e1309c86672b614ff6.jpg',
    name: 'Basil Seeds',
    price: 100.00,
    tag: ProductTag.seeds,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '45',
    imageUrl: 'https://ph-test-11.slatic.net/p/a709260318a283973e1f3fdf740d6081.png',
    name: 'Chili Seeds',
    price: 100.00,
    tag: ProductTag.seeds,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '46',
    imageUrl: 'https://ph-test-11.slatic.net/p/4ff11f177abe550b59a870a90036a806.png',
    name: 'Kalabasa',
    price: 100.00,
    tag: ProductTag.seeds,
  ),
  // Health
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '47',
    imageUrl: 'https://ph-test-11.slatic.net/p/ac8419227846a069d7789aaa4fea0027.jpg',
    name: 'Cleene Tissue',
    price: 100.00,
    tag: ProductTag.health,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '48',
    imageUrl: 'https://ph-test-11.slatic.net/p/5d122e37583182f4f315e91e51814705.jpg',
    name: 'Penshoppe Sanitizer',
    price: 100.00,
    tag: ProductTag.health,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '49',
    imageUrl: 'https://ph-test-11.slatic.net/p/ba3c29973837d882cdf112ce474c06c0.jpg',
    name: 'MamyPoko',
    price: 100.00,
    tag: ProductTag.health,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '50',
    imageUrl: 'https://ph-test-11.slatic.net/p/41d4d69e46a80ca69e4b2850269ea9b5.jpg',
    name: 'Green Cross Alcohol',
    price: 100.00,
    tag: ProductTag.health,
  ),
  // School
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '51',
    imageUrl: 'https://ph-test-11.slatic.net/p/2056ada2b043ebba5920b1ad37626e26.jpg',
    name: 'Faber Castell',
    price: 100.00,
    tag: ProductTag.school,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '52',
    imageUrl: 'https://ph-test-11.slatic.net/p/7327d96148704eb640a611c0c9465c7b.jpg',
    name: 'Mongol #2 Pencils',
    price: 100.00,
    tag: ProductTag.school,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '53',
    imageUrl: 'https://ph-test-11.slatic.net/p/2a2c0c467392b48c45c9dec3ff412eb7.png',
    name: 'Notebook',
    price: 100.00,
    tag: ProductTag.school,
  ),
  Product(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '54',
    imageUrl: 'https://ph-test-11.slatic.net/p/642a3ecde7fc67c045e6419f101b0854.jpg',
    name: 'Drafting Ruler',
    price: 100.00,
    tag: ProductTag.school,
  ),
];
