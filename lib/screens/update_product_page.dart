import 'package:flutter/material.dart';
import 'package:store/models/ProductModel.dart';
import 'package:store/services/update_product.dart';
import 'package:store/widgets/custom_button.dart';
import 'package:store/widgets/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class UpdateProductPage extends StatefulWidget {
   const UpdateProductPage({super.key});

  static String id='UpdateProductPage';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? title, desc, image, price;
  bool isLoading= false;

  @override
  Widget build(BuildContext context) {
    ProductModel product= ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Update Product',
          style: TextStyle(
            color: Colors.white,
          ),),
          centerTitle: true,
          backgroundColor: Colors.blueGrey,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
                children: [
              const SizedBox(
              height: 8,),
                  CustomTextField(
                    onChanged: (data){
                      title= data;
                    },
                      hintText: 'Product Name',),
                  const SizedBox(
                    height: 15,
                  ),CustomTextField(
                      onChanged: (data){
                        desc= data;
                      },
                      hintText: 'Product Description',),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                    inputType: TextInputType.number,
                      onChanged: (data){
                        price=data.toString();
                      },
                      hintText: 'Product Price', ),
                  const SizedBox(
                    height: 15,
                  ),
                  CustomTextField(
                      onChanged: (data){
                        image= data;
                      },
                      hintText: 'Product Image',
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                      buttonText: 'Update',
                    onTap: () async {
                        isLoading =true;
                        setState(() {
                        });

                      try {
                        await updateProduct(product);
                        print('success');
                      } catch (e) {
                       print(e);
                      }
                        isLoading =false;
                        setState(() {
                        });
                    },
                  ),

                ],
              ),
          ),
          ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      id: product.id,
        title: title !=null ? title! :product.title,
        price: price !=null ?price! :product.price.toString(),
        desc: desc!=null ? desc! : product.description,
        image: image!=null ? image! :product.image,
        category: product.category,
    );
  }
}
