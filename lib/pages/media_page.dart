// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kampenies/bloc/media/media_bloc.dart';
import 'package:kampenies/kampenies__app_icons.dart';
import 'package:kampenies/theme.dart';
import '../widgets/media/item_widget_article.dart';

class Media_Page extends StatefulWidget {
  const Media_Page({super.key});

  @override
  State<Media_Page> createState() => _Media_PageState();
}

class _Media_PageState extends State<Media_Page> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        toolbarHeight: screenHeight * 0.2,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      "Artikel",
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF1570EF)),
                    ),
                    const SizedBox(width: 20),
                    Text(
                      "Video",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade500),
                    ),
                  ],
                ),
                const Icon(
                  Kampenies_Appp.list_bookmark,
                  color: Colors.black,
                  size: 26,
                )
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            SearchBar(
              backgroundColor: const MaterialStatePropertyAll(whiteColor),
              onChanged: (value) {
                MediaBloc().add(SearchArticle(query: value));
                print(MediaBloc().state.toString());
              },
              textStyle: const MaterialStatePropertyAll(
                  TextStyle(color: Colors.black, fontSize: 18)),
              hintText: "Cari Artikel",
              hintStyle: const MaterialStatePropertyAll(TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff98A2B3))),
              //elevation: const MaterialStatePropertyAll(2),
              leading: Container(
                padding: const EdgeInsets.all(10),
                child: const Icon(
                  Icons.search_rounded,
                  color: Color(0xff98A2B3),
                  size: 34,
                ),
              ),
            ),
          ],
        ),
      ),
      body: BlocBuilder<MediaBloc, MediaState>(
        builder: (context, state) {
          if (state is ArticlesLoading) {
            return Center(
              heightFactor: screenHeight * 0.3,
              child: const CircularProgressIndicator(),
            );
          }
          if (state is ArticlesSuccess) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: state.articles.length,
              itemBuilder: (context, index) {
                return ItemArticles(
                  articles: state.articles[index],
                  screenHeight: screenHeight,
                  screenWidth: screenWidth,
                );
              },
            );
          }
          return const Center(
            child: Text("NO DATA"),
          );
        },
      ),
    ));
  }
}
