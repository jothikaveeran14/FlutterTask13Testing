import 'package:flutter/material.dart';
class ProductDetails extends StatefulWidget {
  final product_name;
  final product_picture;
  final product_cost;
  final product_details;
  ProductDetails({
    this.product_name,
    this.product_picture,
    this.product_cost,
    this.product_details
  });
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('FashApp', style: TextStyle(color: Colors.white),),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              height: 300.0,
              width: width,
              child: Image.asset(widget.product_picture),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(widget.product_name,style: TextStyle(fontSize: 25.0,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10.0,
            ),
            Text(widget.product_cost,style: TextStyle(fontSize: 15.0,color: Colors.black,fontWeight: FontWeight.bold),),
            SizedBox(
              height: 10.0,
            ),
            Text(widget.product_details,
              style: TextStyle(fontSize: 15.0,color: Colors.grey[500],fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 20.0,
            ),
            MaterialButton(
              onPressed: ()=>
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      //Here values of the product is passed to the product details page
                      builder: (context) => PaymentPage(),
                    ),
                  ),
              color: Colors.pink,
              textColor: Colors.white,
              child: Text("Buy Now"),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PaymentPage"),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children:[
            Form(
              child: Expanded(
                child: Column(
                  children: [
                    TweenAnimationBuilder(
                      duration: Duration(seconds: 5),
                      tween: Tween<double>(begin: 100,end: 250),
                      builder: (BuildContext context,dynamic value,Widget child) {
                        return Container(
                          height: value,
                          width: value,
                          child: Image.asset('assets/card.jpg'),
                        );
                      },
                    ),
                    TextFormField(
                      key: Key('payment-field'),
                      decoration: InputDecoration(hintText: 'CardNumber'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Expired Date'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'CVV'),
                    ),
                    TextFormField(
                      decoration: InputDecoration(hintText: 'Card Holder'),
                    ),
                  ],
                ),
              ),
            ),
            RaisedButton(
              key: Key('payment-button'),
              color: Colors.grey,
              child: Text("Pay",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20.0),),
            ),
          ],
        ),
      ),
    );
  }
}
