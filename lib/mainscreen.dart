import 'package:flutter/material.dart';
import 'main.dart';


class Product {
  final String name;
  final String description;
  final int price;
  final String image;

  Product(this.name, this.description, this.price, this.image);

  static List<Product> getProducts() {
    List<Product> items = <Product>[];

    items.add(Product("iPhone", "This is iphone", 100, "iphone.jpg"));
    items.add(
        Product("floppydisk", "This is floppydisk", 100, "floppydisk.jpg"));
    items.add(Product("laptop", "This is laptop", 100, "laptop.jpg"));
    items.add(Product("pendrive", "This is pendrive", 100, "pendrive.jpg"));
    items.add(Product("pixel", "This is pixel", 100, "pixel.jpg"));
    return items;
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final items = Product.getProducts();
  var status = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
        title: Text(widget.title),
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                status = status == 0 ? 1 : 0;
              });
            },
            icon: status == 0 ? Icon(Icons.list) : Icon(Icons.grid_view),
            tooltip: "Change View",
          ),
        ],
      ),
      body: status == 0
          ? ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBox(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(item: items[index]),
                ),
              );
            },
          );
        },
      )
          : GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Adjust the number of columns as needed
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: ProductBoxCard(item: items[index]),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProductPage(item: items[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ProductPage extends StatelessWidget {
  ProductPage({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Product Page"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "assets/images/" + this.item.image,
                width: 500,
                fit: BoxFit.fitWidth,
              ),
              Expanded(
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(this.item.name,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(this.item.description,
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text("Price: " + this.item.price.toString()),
                        RatingBox(),
                      ],
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

class RatingBox extends StatefulWidget {
  @override
  _RatingBoxState createState() => _RatingBoxState();
}

class _RatingBoxState extends State<RatingBox> {
  int _rating = 0;

  void _setRatingAsOne() {
    setState(() {
      _rating = 1;
    });
  }

  void _setRatingAsTwo() {
    setState(() {
      _rating = 2;
    });
  }

  void _setRatingAsThree() {
    setState(() {
      _rating = 3;
    });
  }

  @override
  Widget build(BuildContext context) {
    double _size = 20;
    print(_rating);
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_rating >= 1
                  ? Icon(
                Icons.star,
                size: _size,
              )
                  : Icon(
                Icons.star_border,
                size: _size,
              )),
              color: Colors.red[500],
              iconSize: _size,
              onPressed: _setRatingAsOne),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_rating >= 2
                  ? Icon(
                Icons.star,
                size: _size,
              )
                  : Icon(
                Icons.star_border,
                size: _size,
              )),
              color: Colors.red[500],
              iconSize: _size,
              onPressed: _setRatingAsTwo),
        ),
        Container(
          padding: EdgeInsets.all(0),
          child: IconButton(
              icon: (_rating >= 3
                  ? Icon(
                Icons.star,
                size: _size,
              )
                  : Icon(
                Icons.star_border,
                size: _size,
              )),
              color: Colors.red[500],
              iconSize: _size,
              onPressed: _setRatingAsThree),
        ),
      ],
    );
  }
}

class ProductBoxCard extends StatelessWidget {
  ProductBoxCard({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(top: 6),
      child: Card(
        elevation: 2,
        child: Column(
          children: [
            Container(
              height: 100,
              child: Image.asset("assets/images/" + this.item.image,
                  fit: BoxFit.fill, width: 400),
            ),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(
                    this.item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Padding(padding: EdgeInsets.only(top: 10)),
                  Text(this.item.description),
                  Padding(padding: EdgeInsets.only(top: 5)),
                  Text("Price: " + this.item.price.toString())
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ProductBox extends StatelessWidget {
  ProductBox({Key? key, required this.item}) : super(key: key);

  final Product item;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Image.asset("assets/images/" + this.item.image!),
            Expanded(
                child: Container(
                  padding: EdgeInsets.all(4),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(this.item.name!,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      Text(this.item.description!),
                      Text("Price: " + this.item.price.toString()),
                      RatingBox(),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}