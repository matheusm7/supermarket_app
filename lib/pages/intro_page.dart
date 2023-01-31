import 'package:flutter/material.dart';
import 'package:supermarket_app/pages/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //logo
          Padding(
            padding: const EdgeInsets.only(left: 80.0, right: 80, bottom: 40, top: 150),
            child: Image.asset('lib/images/avocado.png'),
          ),

          //we deliver food to your door
          const Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              'Entregamos alimentos em sua casa!',
              textAlign: TextAlign.center,
              style: TextStyle(
              fontSize: 37.9,
              fontWeight: FontWeight.bold,
              ),
            ),
          ),

          const SizedBox(height: 10,),
          //fresh items everyday
          Text(
            "Comida fresca todos os dias ",
            style: TextStyle(color: Colors.grey[600], fontSize: 18),
            ),
            const Spacer(),

          
          //get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) {
                return const HomePage();
              },
             ),
            ),
            child: Container(
              margin: EdgeInsets.all(40 ),
              decoration: BoxDecoration(color: Colors.deepPurple,
              borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text("Vamos lá!", style: TextStyle(color: Colors.white),),
            ),
          ),


        ],
      ),
    );
  }
}