import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});
  static String id= 'LoadingScreen';

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.4,
            crossAxisSpacing: 10,
            mainAxisSpacing: 75,
          ),
          itemCount: 10,
          itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.all(8.0),
              decoration: const BoxDecoration(color: Colors.white),
              child: SkeletonItem(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: SkeletonParagraph(
                              style: SkeletonParagraphStyle(
                                  lines: 3,
                                  spacing: 6,
                                  lineStyle: SkeletonLineStyle(
                                    randomLength: true,
                                    height: 10,
                                    borderRadius: BorderRadius.circular(8),
                                    minLength: MediaQuery.of(context).size.width / 6,
                                    maxLength: MediaQuery.of(context).size.width / 3,
                                  )),
                            ),
                          )
                        ],
                      ),
                        ],
                      )
                    ,
                  )),
            ),
          ),

    );
  }
}