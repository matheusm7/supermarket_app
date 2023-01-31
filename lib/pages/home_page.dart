import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supermarket_app/model/cart_model.dart';
import '../components/grocery_item_tile.dart';
import 'cart_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CartPage();
        },
        ),
        ),
        backgroundColor: Colors.black,
        child: Icon(Icons.shopping_bag),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const SizedBox(height: 48),


          //good morning
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text('Bom dia!', style: TextStyle(fontSize: 20, color: Colors.grey),),
          ),

          const SizedBox(height: 4),


          //lets order fresh items for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              "Vamos escolher alguns produtos para você",
              style: TextStyle(
              fontSize: 37.9,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 24),

          
          //divider
          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Divider(
              thickness: 5,
            ),
          ),
      
          const SizedBox(height: 24),
      
          //fresh items + grid

          const Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Text("Produtos de hoje",
             style: TextStyle(fontSize: 16),
            ),
          ),

          Expanded(
            child: Consumer<CartModel>(
              builder: (context, value, child) {
              return GridView.builder(
                itemCount: value.shopItems.length,
                padding: EdgeInsets.all(12),
           gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             childAspectRatio: 1/1.3,
             ),
               itemBuilder: (context, index) {
                return GroceryItemTile(
                  itemName: value.shopItems[index] [0],
                  itemPrice: value.shopItems[index] [1],
                  imagePath:  value.shopItems[index] [2],
                  color: value.shopItems[index][3],
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false)
                    .addItemToCart(index);
                  },
                );
              },
           );
            },),
          )
        ],
        ),
      ),
    );
  }
}