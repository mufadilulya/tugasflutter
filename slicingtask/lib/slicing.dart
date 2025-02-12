import 'package:flutter/material.dart';

class TaskOne extends StatelessWidget {
  const TaskOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: Padding(
          padding: EdgeInsets.symmetric(horizontal: 32),
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        title: Text(
          'Detail',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'SpaceGrotesk',
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 24,
              ),
              Image.asset(
                'assets/images/img2.jpg',
                width: 311,
                height: 329,
              ),
              SizedBox(
                height: 24,
              ),
              Text(
                '#14415',
                style: TextStyle(
                    color: Color(0xffA3D80D),
                    fontSize: 20,
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w700),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Gitar Akustik',
                    style: TextStyle(
                        color: Color(0xff0C0A19),
                        fontSize: 20,
                        fontFamily: 'SpaceGrotesk',
                        fontWeight: FontWeight.w700),
                  ),
                  Icon(Icons.apple_outlined)
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: [
                  Text(
                    '10K+ Sold',
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Icon(
                    Icons.access_time_outlined,
                    size: 9,
                  ),
                  Text(
                    '1h 23m 32s',
                    style: TextStyle(
                      fontSize: 9,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '---------------------------------------',
                    style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.w100,
                      color: Color(0xff979796),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Text(
                "Description",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "Each Apes NFT is a unique masterpiece, and crafted by artists around the globe.",
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'SpaceGrotesk',
                  fontWeight: FontWeight.w300,
                  color: Color(0xff979796),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                Text(
                  'price',
                  style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  '2.23 ETH',
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: 'SpaceGrotesk',
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(Icons.shopping_bag, color: Colors.black, size: 20),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Place bid',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
