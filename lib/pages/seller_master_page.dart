import 'package:fluroapp/pages/about_page.dart';
import 'package:fluroapp/pages/buyer_order_page.dart';
import 'package:fluroapp/pages/cart_page.dart';
import 'package:fluroapp/pages/location_page.dart';
import 'package:fluroapp/pages/privacy_page.dart';
import 'package:fluroapp/pages/product_master_page.dart';
import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:fluroapp/pages/sign_in_page.dart';
import 'package:fluroapp/pages/terms_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SellerMasterPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      settings: RouteSettings(name: 'seller-master-page'),
      builder: (BuildContext context) {
        return SellerMasterPage();
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
        'Palengke',
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
            backgroundColor: backgroundColor,
            labelType: NavigationRailLabelType.all,
            selectedIconTheme: IconThemeData(color: color),
            selectedLabelTextStyle: Theme.of(context).textTheme.overline.copyWith(color: color, fontWeight: FontWeight.bold),
            unselectedIconTheme: IconThemeData(color: scrimColor),
            unselectedLabelTextStyle: Theme.of(context).textTheme.overline.copyWith(color: scrimColor, fontWeight: FontWeight.normal),
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
            selectedIndex: 0,
          ),
          VerticalDivider(
            width: 0.0,
            thickness: 0.1,
            color: Color(0xFF4C364D),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(2.0),
              itemCount: sellers.length,
              itemBuilder: (context, index) {
                final seller = sellers.elementAt(index);

                return AspectRatio(
                  aspectRatio: 2.8 / 1.0,
                  child: SellerTile(
                    seller: seller,
                    onTap: () {
                      Navigator.of(context).push(ProductMasterPage.route(seller));
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
          ),
        ],
      ),
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
                  'Home',
                  style: TextStyle(
                    color: backgroundColor,
                  ),
                ),
                onTap: () {},
              ),
            ),
            ListTile(
              title: Text(
                'My Orders',
                style: TextStyle(
                  color: scrimColor,
                ),
              ),
              onTap: () {
                Navigator.of(context).push(BuyerOrderPage.route());
              },
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
                Navigator.of(context).pushAndRemoveUntil(SignInPage.route(), (route) => false);
              },
            ),
          ],
        ),
      ),
    );

    final floatingActionButton = FloatingActionButton(
      onPressed: () {
        Navigator.of(context).push(LocationPage.route());
      },
      child: Icon(Icons.my_location),
      backgroundColor: color1,
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor.withOpacity(0.54),
      appBar: appBar,
      body: body,
      drawer: drawer,
      floatingActionButton: floatingActionButton,
    );
  }
}

class SellerTile extends StatelessWidget {
  final Seller seller;
  final GestureTapCallback onTap;

  const SellerTile({
    Key key,
    @required this.seller,
    @required this.onTap,
  })  : assert(seller != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var imageUrl = seller.imageUrl;
    var name = seller.name;
    var address = seller.address;

    var city = address.city;
    var province = address.province;

    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white30,
          border: Border.all(
            width: 0.2,
            color: Color(0xFF4C364D),
          ),
        ),
        child: Row(
          children: [
            Container(
              width: 10.0,
              color: Color(0xFFF7A992),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(12.0),
                child: Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.0 / 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          border: Border.all(
                            width: 0.4,
                            color: Color(0xFF4C364D),
                          ),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12.0),
                          child: Image.network(
                            '$imageUrl',
                            alignment: AlignmentDirectional.center,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '$name',
                            maxLines: 1,
                            style: Theme.of(context).textTheme.subtitle2.copyWith(color: Color(0xFF4C364D), fontSize: 24.0),
                          ),
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 16.0,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16.0,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16.0,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16.0,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 16.0,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                              Text(
                                ' (433)',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            'Delivery Area',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                          Text(
                            '$city, $province',
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodyText2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              width: 10.0,
              color: Color(0xFFF7A992),
            ),
          ],
        ),
      ),
    );
  }
}
