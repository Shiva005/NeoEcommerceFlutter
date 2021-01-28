import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';

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

List<String> cake_category = <String>[
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
List<String> type_veg_nonveg = <String>[
  '● Veg',
  '● Non-Veg',
  '● Veg',
  '● Non-Veg',
  '● Veg',
  '● Non-Veg',
  '● Veg',
  '● Non-Veg',
  '● Veg'
];

List<String> cake_price = <String>[
  '\$120.0',
  '\$212.0',
  '\$338.0',
  '\$410.0',
  '\$111.0',
  '\$148.0',
  '\$165.0',
  '\$268.0',
  '\$121.0',
];

List<Color> type_veg_nonveg_color = <Color>[
  Colors.green,
  Colors.red,
  Colors.red,
  Colors.green,
  Colors.green,
  Colors.red,
  Colors.green,
  Colors.red,
  Colors.green,
];
class AnimatedGrid extends StatefulWidget {
  @override
  _AnimatedGridState createState() => _AnimatedGridState();
}

class _AnimatedGridState extends State<AnimatedGrid> {
  final orientation = Orientation.portrait;
  Color baseColor = Color(0xFFf2f2f2);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: GridView.builder(
          itemCount: cake_image.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: (orientation == Orientation.portrait) ? 2 : 3),
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ClayContainer(
                height: 50,
                width: 50,
                borderRadius: 15.0,
                emboss: true,
                child: GridTile(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClayContainer(
                            width: 80,
                            height: 80,
                            borderRadius: 80,
                            curveType: CurveType.convex,
                            depth: 50,
                            color: baseColor,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Image.network(
                                cake_image[index],
                              ),
                            ),
                          ),
                          Column(
                            children: [
                              ClayText(
                                type_veg_nonveg[index],
                                color: type_veg_nonveg_color[index],
                                spread: 0.5,
                                size: 10,
                              ),
                              SizedBox(height: 10),
                              ClayText(
                                cake_price[index],
                                color: Colors.grey[700],
                                spread: 0.5,
                                size: 12,
                              ),
                              SizedBox(height: 10),
                              ClayText(
                                "5⭐",
                                color: Colors.grey,
                                spread: 0.5,
                                size: 12,
                              ),
                            ],
                          )
                        ],
                      ),
                      ClayContainer(
                        borderRadius: 10,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5),
                          child: ClayText(
                            cake_category[index],
                            color: Colors.teal,
                            spread: 0.5,
                            size: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
