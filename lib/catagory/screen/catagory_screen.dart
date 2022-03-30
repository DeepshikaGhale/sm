import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../entity/category.dart';
import '../store/category_store.dart';
import '../widgets/category_card.dart';

class CatagoryScreen extends StatefulWidget {
  const CatagoryScreen({Key? key}) : super(key: key);

  @override
  State<CatagoryScreen> createState() => _CatagoryScreenState();
}

class _CatagoryScreenState extends State<CatagoryScreen> {
  CategoryStore categoryStore = CategoryStore();

  bool isApiHit = false;

  @override
  void didChangeDependencies() async {
    categoryStore = Provider.of<CategoryStore>(context, listen: false);
    if (!isApiHit) {
      await categoryStore.getCatagoryData();
      isApiHit = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('appbar'),
      ),
      body: Observer(
        builder: (BuildContext context) {
          return categoryStore.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : createBody(categoryStore.catagoryResponse.response!);
        },
      ),
    );
  }

  Widget createBody(List<CategoryDetails> categoryDetails) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 11),
                  height: screenHeight * 0.0738916,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Choose Your Options',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: screenHeight * 0.0197044),
                        ),
                        Text(
                          'Free delivery and new deals every day',
                          style: TextStyle(
                            fontSize: screenHeight * 0.0197044,
                          ),
                        ),
                      ])),
              ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: categoryDetails.length,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return CategoryCard(categoryDetails: categoryDetails[index]);
                  })
            ],
          ),
        ));
  }
}
