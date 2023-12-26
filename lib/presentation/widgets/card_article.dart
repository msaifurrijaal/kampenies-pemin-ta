import 'package:flutter/material.dart';
import 'package:kampenies/config/theme.dart';

import '../../data/models/article.dart';


class CardArticle extends StatelessWidget {
  const CardArticle({
    Key? key,
    required this.articles,
  }) : super(key: key);
  final Article articles;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 220,
        decoration: const BoxDecoration(
          color: whiteColor,
          border: Border(
            bottom: BorderSide(color: greyLightColor, width: 3),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.network(
                      articles.profile,
                      width: 45,
                      height: 45,
                    ),
                  ),
                  const SizedBox(width: 12),
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
                      maxLines: 2,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Container(
                    clipBehavior: Clip.antiAlias,
                    height: 90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Image.network(articles.images),
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
          ),
        ),
      ),
    );
  }
}
