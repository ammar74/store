import 'package:flutter/material.dart';
import 'package:store/models/ProductModel.dart';
import 'package:store/screens/loading_screen.dart';
import 'package:store/services/get_all_products.dart';
import 'package:store/widgets/custom_card.dart';

class HomePage extends StatelessWidget {
   const HomePage({super.key});

  static String id= 'HomePage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
        ),
        centerTitle: true,
        actions:  [
          IconButton(
              onPressed: (){},
              icon:const Icon(
            Icons.shopping_cart,
            color: Colors.black,)

          ),
        ],
        title: const Text(
          'New Trend',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 65.0, right: 8.0, left: 8.0),
        child: FutureBuilder<List<ProductModel>>(
          future: AllProductsService().getAllProducts(),
          builder: (context,  snapshot) {
            if(snapshot.hasData){
              List<ProductModel> products =snapshot.data!;
              return GridView.builder(
                itemCount: products.length,
                  clipBehavior: Clip.none,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1.4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 75,
                  ),
                  itemBuilder: (context, index){
                    return  CustomCard(productModel: products[index],);
                  });
            }else{
               return const LoadingScreen();
            }

          },)
      ),
    );
  }
}
