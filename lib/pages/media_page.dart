// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/bloc/media/media_bloc.dart';
import 'package:kampenies/kampenies__app_icons.dart';
import 'package:kampenies/theme.dart';
import 'package:kampenies/widgets/skeleton_widget.dart';
import '../widgets/card_article.dart';

class Media_Page extends StatefulWidget {
  const Media_Page({super.key});

  @override
  State<Media_Page> createState() => _Media_PageState();
}

class _Media_PageState extends State<Media_Page> {
  @override
  void initState() {
    super.initState();
    context.read<MediaBloc>().add(GetArticlesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          shadowColor: blueColor,
          elevation: 1,
          backgroundColor: Colors.white,
          toolbarHeight: 140,
          automaticallyImplyLeading: false,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Artikel",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: blueColor,
                            ),
                      ),
                      const SizedBox(width: 20),
                      Text(
                        "Video",
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w500,
                              color: greyColor,
                            ),
                      ),
                    ],
                  ),
                  const Icon(
                    Kampenies_Appp.list_bookmark,
                    color: blackColor,
                    size: 26,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SearchBar(
                      side: const MaterialStatePropertyAll(
                        BorderSide(color: lightBlueColor, width: 2),
                      ),
                      backgroundColor:
                          const MaterialStatePropertyAll(bgEditTextColor),
                      onChanged: (value) {
                        BlocProvider.of<MediaBloc>(context)
                            .add(SearchArticle(query: value));
                      },
                      textStyle: MaterialStatePropertyAll(
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: greyColor,
                              )),
                      hintText: "Cari Artikel",
                      hintStyle: MaterialStatePropertyAll(
                          Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontWeight: FontWeight.w100,
                                color: greyColor,
                              )),
                      elevation: const MaterialStatePropertyAll(0),
                      shape: MaterialStateProperty.all(
                        const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(45),
                          ), // Mengatur border radius menjadi 10
                        ),
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(10),
                        child: const Icon(
                          Icons.search,
                          color: blackColor,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      'images/icon_setting.png',
                      width: 32,
                      height: 32,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        body: BlocBuilder<MediaBloc, MediaState>(
          builder: (context, state) {
            if (state is ArticlesLoading) {
              return ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return const SkeletonArticle();
                },
              );
            }
            if (state is ArticlesSuccess) {
              return ListView.builder(
                shrinkWrap: true,
                itemCount: state.articles.length,
                itemBuilder: (context, index) {
                  return CardArticle(
                    articles: state.articles[index],
                  );
                },
              );
            }
            if (state is ArticleError) {
              return Center(
                child: Text(state.errorMessage),
              );
            }
            return const Center(
              child: Text("NO DATA"),
            );
          },
        ),
      ),
    );
  }
}
