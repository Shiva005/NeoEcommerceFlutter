import 'package:carousel_slider/carousel_slider.dart';
import 'package:clay_containers/clay_containers.dart';
import 'package:clay_containers/widgets/clay_containers.dart';
import 'package:flutter/material.dart';

import 'gridview.dart';

void main() => runApp(MyApp());

List<String> cake_image = <String>[
  'https://www.cashadvance6online.com/data/archive/img/242039656.png',
  'https://cdn.brightbakery.com/wp-content/uploads/2018/05/red-velvet-piece.png',
  'https://i.pinimg.com/originals/7d/59/53/7d5953f1d20f935a82091455399701fb.png',
  'https://img.pngio.com/filerecipe-pound-cakepng-pound-cake-png-237_213.png',
  'https://img2.pngio.com/fruit-cake-settepani-fruitcake-png-1500_1013.png',
  'https://www.pngarts.com/files/4/Bakery-Biscuit-Download-PNG-Image.png',
  'https://www.pngpix.com/wp-content/uploads/2016/10/PNGPIX-COM-Cake-Piece-PNG-Transparent-Image-2.png',
  'https://www.pngkit.com/png/full/6-67628_carrot-cake-png.png',
  'https://i.pinimg.com/originals/18/9a/72/189a72ca501151fe559d1eff41febcd1.png'
];

class MyApp extends StatelessWidget {
  Color baseColor = Color(0xFFf2f2f2);
  final List<String> cake_category = <String>[
    'Butter Cake',
    'Red Velvet Cake',
    'Pound Cake',
    'Sponge Cake',
    'Genoise Cake',
    'Biscuit Cake',
    'Chiffon Cake',
    'Carrot Cake',
    'Angel Food Cake'
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: baseColor,
        appBar: PreferredSize(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClayContainer(
                height: 50,
                borderRadius: 7,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Icon(Icons.menu, size: 30.0),
                    ),
                    Center(
                      child: ClayText(
                        "Cake Factory",
                        color: Colors.black,
                        size: 18,
                        spread: 0.8,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(Icons.more_vert, size: 30.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(100),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 120,
                child: ListView.builder(
                    itemCount: cake_category.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: ClayContainer(
                              height: 80,
                              width: 80,
                              borderRadius: 80,
                              curveType: CurveType.convex,
                              depth: 50,
                              color: baseColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.network(
                                  cake_image[index],
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: ClayText(
                              cake_category[index],
                              color: Colors.teal[500],
                              spread: 0.5,
                              size: 12,
                            ),
                          ),
                        ],
                      );
                    }),
              ),
              SizedBox(height: 20.0),
              Container(
                height: 220,
                child: CarouselWithIndicatorDemo(),
              ),
              Container(
                height: 500,
                child: AnimatedGrid(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CarouselWithIndicatorDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CarouselSlider(
        items: imageSliders,
        options: CarouselOptions(
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.2,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            }),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: cake_image.map((url) {
          int index = cake_image.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index
                  ? Color.fromRGBO(0, 0, 0, 0.9)
                  : Color.fromRGBO(0, 0, 0, 0.4),
            ),
          );
        }).toList(),
      ),
    ]);
  }
}

final List<Widget> imageSliders = cake_image
    .map(
      (item) => Container(
        margin: EdgeInsets.symmetric(vertical: 10.0),
        child: ClayContainer(
          borderRadius: 10,
          depth: 20,
          child: Image.network(item, fit: BoxFit.scaleDown, width: 500.0),
        ),
      ),
    )
    .toList();
