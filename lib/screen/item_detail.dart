import 'package:flutter/material.dart';
import '../Model/model.dart';

class ItemDetail extends StatelessWidget {
  final Item item;

  ItemDetail({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.bgColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 55,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_left,
                      size: 55,
                    ),
                  ),
                ),
                Image.asset(
                  'images/two_line.png',
                  height: 30,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 220,
              child: Hero(
                tag: item.imageUrl,
                child: Image.asset(item.imageUrl),
              ),
            ),
          ),
          SizedBox(height: 18,),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 199, 199, 199),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(left: 25, right: 25, bottom: 15, top: 15),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 33),
                      ),
                      Text(
                        item.lb,
                        style: TextStyle(color: Colors.black45, fontSize: 18),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                          buildCounterButton(Icons.remove),
                          SizedBox(width: 15,),
                          Text(
                            '1',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(width: 15,),
                          buildCounterButton(Icons.add),
                            ]
                          ),
                          Text('\$' + item.price,
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text(
                        'Fruit Description',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      Text(
                        item.description,
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(height: 15,),
                      Row(
                        children: [
                          buildActionButton(Icons.favorite, item.color, true),
                          SizedBox(width: 15),
                          Expanded(
                            child: buildActionButton(Icons.shopping_cart,
                                item.color, false, "Add to cart"),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCounterButton(IconData icon) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: Colors.grey[100],
      borderRadius: icon == Icons.remove
          ? BorderRadius.only(
              topRight: Radius.circular(15), bottomLeft: Radius.circular(15))
          : BorderRadius.only(
              topLeft: Radius.circular(15), bottomRight: Radius.circular(15)),
    ),
    child: Icon(icon),
  );
}

Widget buildActionButton(IconData icon, Color color, bool outline,
    [String? text]) {
  return Container(
    height: 50,
    decoration: BoxDecoration(
      color: outline ? Colors.white : color,
      borderRadius: BorderRadius.circular(20),
      border: outline ? Border.all(width: 2, color: color) : null,
    ),
    child: Center(
      child: text == null
          ? Icon(icon, size: 45, color: color)
          : Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
    ),
  );
}