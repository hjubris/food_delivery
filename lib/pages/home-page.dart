import 'package:flutter/rendering.dart';
import 'package:food_delivery/Models/types-model.dart';
import 'package:food_delivery/Providers/product-provider.dart';
//import 'package:http/http.dart' as http;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/Models/products-model.dart';
import 'package:food_delivery/Providers/type-provider.dart';
import 'package:food_delivery/components/bottom-bar.dart';
import 'package:food_delivery/pages/detail-page.dart';
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
            Flexible(
              flex: 30,
              child: Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.deepPurple),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Flexible(
                      flex: 2,
                      child: Text(
                        "The fastest delivery service! For real don't look it up",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Flexible(
                      flex: 3,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(onPressed: () {}, child: Text("Get Started")),
                          Image.asset(
                            "Logo/logo.png",
                            scale: 35,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 10,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Categories",
                    style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
              ),
            ),

            ///gets food types from server and builds a list of buttons
            types == null
                ? Center(child: CircularProgressIndicator())
                : Flexible(
                    flex: 10,
                    child: Container(
                      // height: 40,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: types?.length,
                        itemBuilder: (context, index) {
                          return buildTypes(index);
                        },
                      ),
                    ),
                  ),

            ///gets products from server and builds a list of cards
            products == null
                ? Center(child: CircularProgressIndicator())
                : Flexible(
                    flex: 50,
                    child: Container(
                      //height: 350,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: products?.length,
                          itemBuilder: (context, index) {
                            return buildProducts(index);
                          }),
                    ),
                  )
          ])),
      bottomNavigationBar: BottomBar(),
    );
  }

  fetchProducts() async {
    List<Product> products = await ProductProvider.fetchProducts();
    this.setState(() {
      this.products = products;

      ///We use this variable when filtering by typeId
      // this.visibleProducts = products;
    });
  }

  fetchTypes() async {
    List<FoodType> types = await TypeProvider.fetchTypes();
    this.setState(() {
      this.types = types;
    });
  }

  ///this build the three categories' buttons, "onPressed" will apply filter
  ///and show only the selected category
  Widget buildTypes(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
          style: ButtonStyle(
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DetailPage(typeId: types![index].id!)),
            );
          },
          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(types![index].name!),
            Padding(
              padding: const EdgeInsets.only(left: 3.0),
              child: Image.asset(types![index].img!),
            ),
          ])),
    );
  }

  Widget buildProducts(int index) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          clipBehavior: Clip.hardEdge,
          elevation: 5,
          shadowColor: Colors.grey[800],
          child: Column(
            children: [
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(products![index].img!, fit: BoxFit.contain),
                  )),
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(products![index].name!, style: TextStyle(fontWeight: FontWeight.w500)),
              ))
            ],
          ),
        ));
  }
}
