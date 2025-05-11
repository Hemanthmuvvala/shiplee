import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 241,
            width: 424,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 2.0,
              ),
            ),
            child: Image.asset(
              'assets/images/games.png',
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: const RadialGradient(
                colors: [
                  Color.fromRGBO(224, 224, 224, 0),
                  Color.fromRGBO(255, 255, 255, 0.6),
                ],
                tileMode: TileMode.clamp,
                radius: 1.8,
              ),
            ),
            child: const Text(
              'PRODUCT NAME PRODUCT NAME PRODUCT NAME PRODUCT NAME PRODUCT NAME',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  // Add view product functionality here
                },
                child: Container(
                  padding:
                      const EdgeInsets.all(2), // Space between red and border
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Color(0xFFC5D1D8),
                        width: 2,
                      )),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 35,
                    width: 140,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(222, 34, 52, 1.0),
                          Color.fromRGBO(187, 1, 48, 1.0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text(
                      'COPY CODE',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Add view product functionality here
                },
                child: Container(
                  padding:
                      const EdgeInsets.all(2), // Space between red and border
                  decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(
                        color: Color(0xFFC5D1D8),
                        width: 2,
                      )),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    height: 35,
                    width: 170,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          Color.fromRGBO(222, 34, 52, 1.0),
                          Color.fromRGBO(187, 1, 48, 1.0),
                        ],
                      ),
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: const Text(
                      'VISIT PRODUCT',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 35,
                  color: Colors.red,
                ),
                const SizedBox(width: 10),
                const Text(
                  'PRODUCT DESCRIPTION',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          Container(
            height: 235,
            width: 430,
            child: Image.asset(
              'assets/images/play.png',
            ),
          ),
          Row(
            children: [
              Container(
                  height: 62,
                  width: 64.77,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 46, 45, 45),
                  ),
                  child: Image.asset(
                    'assets/images/emoji.png',
                    height: 34,
                    width: 34,
                  )),
              Container(
                height: 62,
                width: 325,
                decoration: BoxDecoration(
                    gradient: RadialGradient(colors: [
                  Colors.black,
                  Color(0xFF1E5E08),
                ], radius: 3.5)),
                child: Center(
                  child: Text(
                    'WHY A CPL HOLDER PILOT WORK IN A\nHOTEL FT CAPTAIN NIKHITHA TOMAR |',
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 35,
                  color: Colors.red,
                ),
                const SizedBox(width: 10),
                const Text(
                  'PRODUCT REVIEW',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Glacier Silver symbolizes purity and resilience,much like a glacier that has stood tall for millennia. Amid the wave of technology, a phone should also have this purity and strong core.Stellar Black resonates with a luxurious, cosmic-inspired black color with a subtle shimmer and matte finish which gives a high-class appearance.',
              style: TextStyle(fontSize: 10, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 8,
                  height: 35,
                  color: Colors.red,
                ),
                const SizedBox(width: 10),
                const Text(
                  'PRODUCT SCORECARD',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 69,
            width: 390,
             // Black container
            padding:
                EdgeInsets.symmetric(horizontal: 4), 
                // Add horizontal spacing
                decoration:BoxDecoration(
                  color: Color.fromRGBO(52, 52, 52, 1),
                  border:Border.all(
                    color:Color(0xFF707070),

                  )
                ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20),
                  child: Text(
                    'OVERALL SCORE',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  height: 61,
                  width: 77,
                  decoration: BoxDecoration(
                    gradient: RadialGradient(
                      colors: [
                        Color.fromARGB(255, 40, 40, 40),
                        Color(0xFF94FF4C),
                      ],
                      radius: 1.2,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      '8.2',
                      style: TextStyle(fontSize: 25, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
          
          
        ],
      ),
    );
  }
}
