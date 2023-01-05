import 'package:coffeeappui/util/coffee_tile.dart';
import 'package:coffeeappui/util/coffee_type.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeeType = [
    ['Cappucino', true],
    ['Latte', false],
    ['Noir', false],
    ['Thé', false],
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeeType.length; i++) {
        coffeeType[i][1] = false;
      }
      coffeeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Icon(Icons.menu),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Icon(Icons.person),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'favorie',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'alerte',
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0),
              child: Text(
                "Café bou séll té woor",
                style: GoogleFonts.bebasNeue(
                  fontSize: 56,
                ),
              ),
            ),
            rowSection,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Rechercher votre café préféré...',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeType(
                        coffeeType: coffeeType[index][0],
                        isSelected: coffeeType[index][1],
                        onTap: () {
                          coffeeTypeSelected(index);
                        });
                  }),
            ),
            const SizedBox(height: 25),
            Container(
              height: 50,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: coffeeType.length,
                  itemBuilder: (context, index) {
                    return CoffeeTile(
                      coffeeImagePath: 'lib/images/coffee.jpg',
                      coffeeName: 'coffee',
                      coffeePrice: '450',
                    );
                  }),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/coffee.jpg',
                    coffeeName: 'coffee',
                    coffeePrice: '450',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/latte.jpg',
                    coffeeName: 'Latte',
                    coffeePrice: '300',
                  ),
                  CoffeeTile(
                    coffeeImagePath: 'lib/images/milk.jpg',
                    coffeeName: 'Lait',
                    coffeePrice: '350',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget rowSection = Container(
  height: 60,
  width: double.infinity,
  margin: EdgeInsets.all(25),
  padding: EdgeInsets.all(10),
  transformAlignment: Alignment.centerLeft,
  color: Colors.black26,
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        color: Colors.orange,
        height: 30,
        width: 30,

      ),
      Container(
        color: Colors.blue,
        height: 30,
        width: 30,
      ),
      Container(
        color: Colors.purple,
        height: 30,
        width: 30,
      ),
      Container(
        color: Colors.pinkAccent,
        height: 30,
        width: 30,
      ),
      Container(
        color: Colors.brown,
        height: 30,
        width: 30,
      ),


    ],
  ),
);