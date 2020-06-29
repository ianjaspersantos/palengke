import 'package:flutter/material.dart';

const backgroundColor = Color(0xFFFDF0C4);
const scrimColor = Color(0xFF4C364D);
const color = Color(0xFFF7A992);
const color1 = Color(0xFFED6840);

class SellerDetailPage extends StatelessWidget {
  static PageRoute<T> route<T>() {
    return MaterialPageRoute(
      builder: (BuildContext context) {
        return SellerDetailPage();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      drawerScrimColor: scrimColor.withOpacity(0.54),
      appBar: AppBar(
        elevation: 1.0,
        brightness: Brightness.light,
        backgroundColor: backgroundColor,
        iconTheme: IconThemeData(
          color: scrimColor,
        ),
        title: Text(
          'Seller Detail Page',
          style: Theme.of(context).textTheme.subtitle1.copyWith(color: scrimColor, fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        child: ListView(
          children: [
            AspectRatio(
              aspectRatio: 16.0 / 9.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white12,
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
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: sellers.length,
                        itemBuilder: (context, index) {
                          final seller = sellers.elementAt(index);

                          return AspectRatio(
                            aspectRatio: 1.0 / 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  width: 0.5,
                                  color: scrimColor,
                                ),
                              ),
                              child: Image.network(
                                '${seller.imageUrl}',
                                fit: BoxFit.cover,
                                alignment: AlignmentDirectional.center,
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return SizedBox(
                            width: 2.0,
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 10.0,
                      color: Color(0xFFF7A992),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Seller {
  final DateTime createdTime;
  final DateTime updatedTime;

  final String id;
  final String imageUrl;
  final String name;
  final SellerAddress address;
  final SellerDeliverySchedule schedule;
  final List<SellerTags> tags;
  final double rating;

  const Seller({
    @required this.createdTime,
    @required this.updatedTime,
    @required this.id,
    @required this.imageUrl,
    @required this.name,
    @required this.address,
    @required this.schedule,
    @required this.tags,
    @required this.rating,
  });
}

class SellerAddress {
  final String province;
  final String city;

  const SellerAddress({
    @required this.province,
    @required this.city,
  });
}

class SellerDeliverySchedule {
  final bool sunday;
  final bool monday;
  final bool tuesday;
  final bool wednesday;
  final bool thursday;
  final bool friday;
  final bool saturday;

  const SellerDeliverySchedule({
    @required this.sunday,
    @required this.monday,
    @required this.tuesday,
    @required this.wednesday,
    @required this.thursday,
    @required this.friday,
    @required this.saturday,
  });
}

enum SellerTags {
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

final sellers = [
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '1',
    imageUrl: 'https://centralluzon.politics.com.ph/wp-content/uploads/2020/04/mobile-palengke-baliwag.jpg',
    name: 'Zupafresh',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '2',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTOvqQ10tkbJS7YcRRngnyThbhgyWqUYUug0w&usqp=CAU',
    name: 'Jovie`s Store',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '3',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT8paTv7uO5X2dlSG1sLPiYnegMlU9Y6oD4jA&usqp=CAU',
    name: 'Barrio Market',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '4',
    imageUrl: 'https://fosteringeducationandenvironmentfordevelopment.files.wordpress.com/2018/03/sustainablepalengkelogo.jpg',
    name: 'Fivere',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '1',
    imageUrl: 'https://centralluzon.politics.com.ph/wp-content/uploads/2020/04/mobile-palengke-baliwag.jpg',
    name: 'Zupafresh',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '2',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTOvqQ10tkbJS7YcRRngnyThbhgyWqUYUug0w&usqp=CAU',
    name: 'Jovie`s Store',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '3',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT8paTv7uO5X2dlSG1sLPiYnegMlU9Y6oD4jA&usqp=CAU',
    name: 'Barrio Market',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '4',
    imageUrl: 'https://fosteringeducationandenvironmentfordevelopment.files.wordpress.com/2018/03/sustainablepalengkelogo.jpg',
    name: 'Fivere',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '1',
    imageUrl: 'https://centralluzon.politics.com.ph/wp-content/uploads/2020/04/mobile-palengke-baliwag.jpg',
    name: 'Zupafresh',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '2',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTOvqQ10tkbJS7YcRRngnyThbhgyWqUYUug0w&usqp=CAU',
    name: 'Jovie`s Store',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '3',
    imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcT8paTv7uO5X2dlSG1sLPiYnegMlU9Y6oD4jA&usqp=CAU',
    name: 'Barrio Market',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '4',
    imageUrl: 'https://fosteringeducationandenvironmentfordevelopment.files.wordpress.com/2018/03/sustainablepalengkelogo.jpg',
    name: 'Fivere',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.veggies],
    rating: 5.0,
  ),
  Seller(
    createdTime: DateTime.now(),
    updatedTime: DateTime.now(),
    id: '4',
    imageUrl: 'https://fosteringeducationandenvironmentfordevelopment.files.wordpress.com/2018/03/sustainablepalengkelogo.jpg',
    name: 'Fruit Wisdom',
    address: SellerAddress(
      province: 'Metro Manila',
      city: 'Quezon City',
    ),
    schedule: SellerDeliverySchedule(
      sunday: true,
      monday: true,
      tuesday: true,
      wednesday: true,
      thursday: true,
      friday: true,
      saturday: true,
    ),
    tags: [SellerTags.fruits],
    rating: 5.0,
  ),
];
