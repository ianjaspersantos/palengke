import 'package:fluroapp/pages/seller_detail_page.dart';
import 'package:flutter/material.dart';

class LocationPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      fullscreenDialog: true,
      builder: (BuildContext context) {
        return LocationPage();
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
        'Pick Location',
        style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
      ),
      actions: [],
    );

    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor,
      appBar: appBar,
      body: ListView.separated(
        itemCount: locations.length,
        itemBuilder: (context, index) {
          final location = locations.elementAt(index);

          return LocationTile(
            location: location,
            onTap: () {
              Navigator.of(context).pop();
            },
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

class LocationTile extends StatelessWidget {
  final Location location;
  final GestureTapCallback onTap;

  const LocationTile({
    Key key,
    @required this.location,
    @required this.onTap,
  })  : assert(location != null),
        assert(onTap != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        color: Colors.white30,
        child: Container(
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
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
                width: 10,
              ),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${location.city}',
                style: Theme.of(context).textTheme.headline6.copyWith(color: scrimColor),
              ),
              Text(
                '${location.province}',
                style: Theme.of(context).textTheme.bodyText2.copyWith(color: scrimColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Location {
  final String city;
  final String province;

  const Location({
    @required this.city,
    @required this.province,
  });
}

final locations = [
  Location(
    city: 'Angeles',
    province: 'Pampanga',
  ),
  Location(
    city: 'Apalit',
    province: 'Pampanga',
  ),
  Location(
    city: 'Arayat',
    province: 'Pampanga',
  ),
  Location(
    city: 'Bacolor',
    province: 'Pampanga',
  ),
  Location(
    city: 'Candaba',
    province: 'Pampanga',
  ),
  Location(
    city: 'Floridablanca',
    province: 'Pampanga',
  ),
  Location(
    city: 'Guagua',
    province: 'Pampanga',
  ),
  Location(
    city: 'Lubao',
    province: 'Pampanga',
  ),
  Location(
    city: 'Mabalacat',
    province: 'Pampanga',
  ),
  Location(
    city: 'Macabebe',
    province: 'Pampanga',
  ),
  Location(
    city: 'Magalang',
    province: 'Pampanga',
  ),
  Location(
    city: 'Masantol',
    province: 'Pampanga',
  ),
  Location(
    city: 'Mexico',
    province: 'Pampanga',
  ),
  Location(
    city: 'Minalin',
    province: 'Pampanga',
  ),
  Location(
    city: 'Porac',
    province: 'Pampanga',
  ),
  Location(
    city: 'San Fernando',
    province: 'Pampanga',
  ),
  Location(
    city: 'San Luis',
    province: 'Pampanga',
  ),
  Location(
    city: 'San Simon',
    province: 'Pampanga',
  ),
  Location(
    city: 'Sta. Ana',
    province: 'Pampanga',
  ),
  Location(
    city: 'Sta. Rita',
    province: 'Pampanga',
  ),
  Location(
    city: 'Sto. Tomas',
    province: 'Pampanga',
  ),
  Location(
    city: 'Sasmuan',
    province: 'Pampanga',
  ),
];
