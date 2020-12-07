import 'package:flutter/material.dart';
import 'package:testing/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var productList = [
    {
      "name": "Kids Red Party Wear Frock",
      "picture": "assets/girl_kid_frock.jpg",
      "cost": "Rs 799",
      "details": "Occasion:PartyWear  Pattern:Embroidery   Size:S, M, L Color:Red  Length:Full Length This Kids Baby Red Party Wear Frock has an excellent quality range."
    },
    {
      "name": "New Butterfly White Designer Branded Fashion Watch For Girls",
      "picture": "assets/girl_watch.jpg",
      "cost": "Rs 500",
      "details": "The look of the watch is such that you can pair it up with any outfit and get noticed in the crowd.You can gift to someone close on special occasions."
    },
    {
      "name": "Fashionable Handbag for girls",
      "picture": "assets/girl_handbag.jpg",
      "cost": "Rs 350",
      "details": "Simple and luxurious, you should receive many compliments with this hand bag.Comes with several colors like black,brown,pink,red,blue,yellow,gray,which can match various styles of dresses and shoes."
    },
    {
      "name": "Kids Fashionable Dungaree Dress Set",
      "picture": "assets/boy_kid_dress.jpg",
      "cost": "Rs 499",
      "details": "Age	0-3 Years  Color	White, Navy Blue  Length	Full Length  Fabric	: Cotton  Sleeve Type: Half Sleeve  Size	S, M, L  This Kids Baby Fashionable Dungaree Dress Set has premium quality range."
    },
    {
      "name": "Fashion Black Earrings For Women Party Wear",
      "picture": "assets/black_earring.jpg",
      "cost": "Rs 150",
      "details": "Ocassion: Women Party wear  Material:Non-Precious Metal  Color:Black  This earrings gives you a trendy look"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FashApp', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body: ListView.builder(
          itemCount: productList.length,
          itemBuilder: (context, index) {
            return SingleProduct(
              prod_name: productList[index]['name'],
              prod_picture: productList[index]['picture'],
              prod_price: productList[index]['cost'],
              prod_details: productList[index]['details'],
            );
          }
      ),
    );
  }
}
class SingleProduct extends StatelessWidget {
  final prod_name;
  final prod_picture;
  final prod_price;
  final prod_details;

  SingleProduct({
    this.prod_name,
    this.prod_picture,
    this.prod_price,
    this.prod_details
  });
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 0.6;
    return InkWell(
      onTap:()=>
          Navigator.of(context).push(
            MaterialPageRoute(
              //Here values of the product is passed to the product details page
              builder: (context) => ProductDetails(
                  product_name: prod_name,
                  product_picture: prod_picture,
                  product_cost: prod_price,
                  product_details: prod_details
              ),
            ),
          ),
      child: Card(
        child: Row(
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              child: Image.asset(prod_picture),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: width,
                    child: Text(prod_name,style: TextStyle(fontSize: 20.0,color: Colors.grey,fontWeight: FontWeight.bold),),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(prod_price,style: TextStyle(color: Colors.grey,fontSize: 15.0,fontWeight: FontWeight.bold),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}