import 'package:flutter/material.dart';
import 'package:kampenies/models/articles.dart';

class ItemArticles extends StatelessWidget {
  const ItemArticles({
    Key? key,
    required this.articles,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);
  final Artikel articles;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: screenHeight * 0.28,
        decoration: const BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Color(0xffEAECF0), width: 3))),
        child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: screenHeight * 0.045,
                      decoration: const BoxDecoration(shape: BoxShape.circle),
                      child: Image.network(articles.profile),
                    ),
                    SizedBox(
                      width: screenWidth * 0.04,
                    ),
                    Text(
                      articles.publisher,
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 15, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        articles.title,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w800),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                        softWrap: true,
                      ),
                    ),
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: screenHeight * 0.12,
                      child: Image.network(articles.images),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14)),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${articles.createdAt.hour.toString()} Jam Yang Lalu",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge
                          ?.copyWith(fontSize: 16, color: Colors.grey.shade600),
                    ),
                    const Icon(
                      Icons.bookmark_border_rounded,
                      size: 30,
                    )
                  ],
                )
              ],
            )),
      ),
    );
  }
}
