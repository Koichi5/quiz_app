import 'package:flutter/material.dart';
import 'package:quiz_app/domain/category/category.dart';

class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({required this.category, Key? key}) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(icon: Icon(Icons.menu), onPressed: () {}),
      //   title: Text('Hello World', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(
      //       bottomRight: Radius.elliptical(90, 30),
      //     ),
      //   ),
      //   elevation: 0,
      // ),
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () {
      //     Navigator.pop(context);
      //   },
      //     icon: const Icon(Icons.arrow_back_ios),
      //   ),
      //   flexibleSpace: Image.network(
      //   'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
      //   fit: BoxFit.cover,
      //   ),
      //   toolbarHeight: 200,
      //   backgroundColor: Colors.transparent,
      // ),
      body: Stack(
        children: [
          Image.asset("assets/images/category_images/category_image1.png", fit: BoxFit.fitHeight,),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 600,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(60),
                  topRight: Radius.circular(60),
                ),
                color: Colors.grey,
              ),
            ),
          ),
          // カード部分の実装
        ],
      ),
      // appBar: AppBar(
      //   leading: IconButton(onPressed: () {
      //     Navigator.pop(context);
      //   },
      //     icon: const Icon(Icons.arrow_back_ios),
      //   ),
      //   flexibleSpace: Image.network(
      //   'https://images.unsplash.com/photo-1513407030348-c983a97b98d8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1352&q=80',
      //   fit: BoxFit.cover,
      //   ),
      //   toolbarHeight: 200,
      //   backgroundColor: Colors.transparent,
      // ),
    );
  }
}
