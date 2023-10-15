import 'package:flutter/material.dart';
import 'package:store/models/ProductModel.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:store/screens/update_product_page.dart';


class CustomCard extends StatelessWidget {
   CustomCard({
     required this.productModel,
    super.key,
  });
  ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, UpdateProductPage.id, arguments: productModel);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Container(
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.grey.withOpacity(0.2),
                  )
                ]
            ),
            child:  Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 10,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children:  [
                    Text(
                      productModel.title.substring(0, 12),
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          r'$ ' '${productModel.price.toString()}',
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const Icon(Icons.favorite,
                          color: Colors.red,),
                      ],

                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            right: 16,
            bottom: 70,
            child: productModel.image != null ? CachedNetworkImage(
              imageUrl: productModel.image,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) =>const Center(child: Icon(Icons.error)),
              height: 100,
              width: 100,
            ) : Image.asset(
              'assets/default.jpg',
              height: 100,
              width: 100,
            ),
          )
        ],
      ),
    );
  }
}
