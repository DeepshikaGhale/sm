import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../entity/category.dart';
import '../store/category_store.dart';


class CategoryCard extends StatefulWidget {
  const CategoryCard({Key? key, required this.categoryDetails}) : super(key: key);
  final CategoryDetails categoryDetails;

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {

  CategoryStore categoryStore = CategoryStore();

   @override
  void didChangeDependencies() {
    categoryStore = Provider.of<CategoryStore>(context, listen: false);
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Stack(
        children: [
          Card(
            elevation: 0,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.centerRight,
                  height: MediaQuery.of(context).size.height * 0.16748,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Color(0xFFFED4B1),
                        borderRadius: BorderRadius.circular(11)),
                    alignment: Alignment.centerLeft,
                    height: double.infinity,
                    width: screenWidth * 0.2888888888888889,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 12.5, 0, 12.5),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(16, 11, 0, 11),
                    height: screenHeight * 0.136699,
                    width: screenWidth * 0.75833333,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1.5, color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xfff2f2f2),
                          blurRadius: 8,
                          offset: Offset(-2, 2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          //for title
                          child: Text(
                            widget.categoryDetails.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: screenWidth * 0.044444),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 74),
                          //for description
                          child: Text(
                            widget.categoryDetails.description,
                            maxLines: 2,
                            style: TextStyle(
                                fontSize: screenWidth * 0.033333,
                                // color: descriptionGrey,
                                overflow: TextOverflow.ellipsis),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              'Order Now',
                              // style: medium14,
                            ),
                            Icon(
                              Icons.play_circle,
                              size: screenWidth * 0.0323611111,
                              // color: playColor,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              right: MediaQuery.of(context).size.width * 0.07222222,
              bottom: MediaQuery.of(context).size.height * 0.01477832,
              //for catagory image
              child: Image.network(
                widget.categoryDetails.backgroundImage,
                width: MediaQuery.of(context).size.width * 0.27,
                height: MediaQuery.of(context).size.height * 0.14,
              ))
        ],
    );
  }
}
