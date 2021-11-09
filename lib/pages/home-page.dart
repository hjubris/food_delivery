import 'package:food_delivery/Models/types-model.dart';
import 'package:food_delivery/Providers/product-provider.dart';
//import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/products-model.dart';
import 'package:food_delivery/Providers/type-provider.dart';
import 'package:food_delivery/components/bottom-bar.dart';
//import 'package:food_delivery/pages/detail-page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Product>? visibleProducts;
  List<Product>? products;
  List<FoodType>? types;

  @override
  void initState() {
    super.initState();
    this.fetchProducts();
    this.fetchTypes();
  }

  Widget createProducts() {
    return Text("yo");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        elevation: 0,
        title: Text("Home page"),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))],
      ),
      body: Padding(
          padding: EdgeInsets.all(15),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.deepPurple),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "The fastest delivery service! For real don't look it up",
                    //style: TextStyle(color: Colors.white),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(onPressed: () {}, child: Text("Get Started")),
                      Image.asset(
                        "Logo/logo.png",
                        scale: 35,
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:
                  Text("Categories", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            types == null
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: 40,
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: types?.length,
                      itemBuilder: (context, index) {
                        return buildType(index);
                      },
                    ),
                  ),

            ///a Row with temporary buttons to redirect to different categories. TBD
            // Row(children: [
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Align(
            //         child: ElevatedButton(
            //             onPressed: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => DetailPage(
            //                             typeId: 1,
            //                           )));
            //             },
            //             child: Text("Burgers"))),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Align(
            //         child: ElevatedButton(
            //             onPressed: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => DetailPage(
            //                             typeId: 2,
            //                           )));
            //             },
            //             child: Text("Pizzas"))),
            //   ),
            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Align(
            //         child: ElevatedButton(
            //             onPressed: () {
            //               Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                       builder: (context) => DetailPage(
            //                             typeId: 3,
            //                           )));
            //             },
            //             child: Text("Salad"))),
            //   )
            // ]),
            createProducts()
          ])),
      bottomNavigationBar: BottomBar(),
    );
  }

  fetchProducts() async {
    List<Product> products = await ProductProvider.fetchProducts();
    this.setState(() {
      this.products = products;
      // this.visibleProducts = products;    Questa var ci serve per quando filtriamo in base al typeId
    });
  }

  fetchTypes() async {
    List<FoodType> types = await TypeProvider.fetchTypes();
    this.setState(() {
      this.types = types;
    });
  }

  Widget buildType(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
          onPressed: () {},
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(types![index].name!),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Image.asset(types![index].img!),
            ),
          ])),
    );
  }
}
