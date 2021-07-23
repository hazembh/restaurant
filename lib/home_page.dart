import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget story({@required String image, @required String text}) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 15, left: 5, right: 5),
          height: 46,
          width: 69,
          decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(image: AssetImage(image))),
        ),
        Text(
          text,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget content(
      {@required String image, @required int price, @required String name}) {
        
    return Container(
      
        width: 190,
        height: 270,
        decoration: BoxDecoration(
            color: Colors.grey[800], borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: [
            SizedBox(height: 20),
            CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(
                  image,
                )),
            ListTile(
              leading: Text(name,
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              trailing: Text(" \$ $price",
                  style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            Row(
              children: [
                SizedBox(width: 17),
                Icon(Icons.star, color: Colors.white),
                Icon(Icons.star, color: Colors.white),
                Icon(Icons.star, color: Colors.white),
                Icon(Icons.star, color: Colors.white),
                Icon(Icons.star, color: Colors.white),
              ],
            ),
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: Icon(Icons.menu),
          actions: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage('lib/assets/hazem.jpg'),
              ),
            )
          ],
        ),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal:10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(padding: EdgeInsets.all(10)),
                TextField(
                    decoration: InputDecoration(
                        filled: true,
                        hintText: ('Searsh'),
                        hintStyle: TextStyle(color: Colors.white, fontSize: 17),
                        prefixIcon: Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(20),
                        ))),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    story(image: 'lib/assets/pizza1.jpg', text: 'All'),
                    story(image: 'lib/assets/pizza3.jpg', text: 'Pizza'),
                    story(image: 'lib/assets/pizza1.jpg', text: 'All'),
                    story(image: 'lib/assets/pizza3.jpg', text: 'Pizza'),
                    story(image: 'lib/assets/pizza1.jpg', text: 'All'),
                    story(image: 'lib/assets/pizza3.jpg', text: 'Pizza'),
                    story(image: 'lib/assets/pizza1.jpg', text: 'All'),
                    story(image: 'lib/assets/pizza3.jpg', text: 'Pizza'),
                    story(image: 'lib/assets/pizza1.jpg', text: 'All'),
                    story(image: 'lib/assets/pizza3.jpg', text: 'Pizza'),
                    story(image: 'lib/assets/pizza3.jpg', text: 'Pizza'),
                    story(image: 'lib/assets/pizza3.jpg', text: 'Pizza'),
                  ]),
                ),
                SizedBox(height:20),
                Container(
                  height: 510,
                  child: GridView.count(
                    shrinkWrap: false,
                    crossAxisCount: 2,
                    primary: false,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    children:<Widget> [
                      content(image: 'lib/assets/pizza1.jpg',name: 'PIZZA',price: 123),
                      content(image: 'lib/assets/pizza1.jpg',name: 'PIZZA',price: 123),
                        content(image: 'lib/assets/pizza1.jpg',name: 'PIZZA',price: 123),
                      content(image: 'lib/assets/pizza1.jpg',name: 'PIZZA',price: 123),
                        content(image: 'lib/assets/pizza1.jpg',name: 'PIZZA',price: 123),
                      content(image: 'lib/assets/pizza1.jpg',name: 'PIZZA',price: 123),


                    ],
                    

                  ),
                )
              ],
            ),
          ),
        ));
  }
}
