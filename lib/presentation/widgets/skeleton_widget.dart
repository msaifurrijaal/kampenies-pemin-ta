// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:kampenies/config/theme.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonMentor extends StatelessWidget {
  const SkeletonMentor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: const EdgeInsets.all(0.5),
      width: 170,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: blueColor.withOpacity(0.5),
            spreadRadius: 0.1,
            blurRadius: 0.1,
            offset: const Offset(0, 0),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(shape: BoxShape.circle),
              width: 80,
              height: 80,
              child: const Skeleton(
                height: double.infinity,
                width: double.infinity,
              ),
            ),
            const SizedBox(height: 15),
            const Skeleton(
              height: 10,
              width: double.maxFinite,
            ),
            const SizedBox(height: 15),
            const Skeleton(
              height: 10,
              width: double.maxFinite,
            ),
            const SizedBox(height: 15),
            const Skeleton(
              height: 30,
              width: 60,
            ),
          ],
        ),
      ),
    );
  }
}

class SkeletonArticle extends StatelessWidget {
  const SkeletonArticle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 220,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: greyLightColor, width: 3),
        ),
      ),
      width: double.infinity,
      child: const Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Skeleton(
                width: 45,
                height: 45,
              ),
              SizedBox(width: 10),
              Skeleton(width: 100, height: 15),
            ],
          ),
          Column(
            children: [
              Skeleton(
                height: 20,
                width: double.infinity,
              ),
              SizedBox(height: 10),
              Skeleton(
                height: 20,
                width: double.infinity,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Skeleton(
                height: 20,
                width: 50,
              ),
              Skeleton(
                height: 30,
                width: 30,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SkeletonEmployee extends StatelessWidget {
  const SkeletonEmployee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteColor,
      padding: const EdgeInsets.all(16),
      child: const Row(
        children: [
          Skeleton(
            height: 125,
            width: 125,
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Skeleton(
                  height: 15,
                  width: 100,
                ),
                SizedBox(height: 10),
                Skeleton(
                  height: 10,
                  width: 100,
                ),
                SizedBox(height: 10),
                Skeleton(
                  height: 10,
                  width: double.infinity,
                ),
                SizedBox(height: 10),
                Skeleton(
                  height: 30,
                  width: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Skeleton extends StatelessWidget {
  const Skeleton({super.key, this.height, this.width});

  final double? height, width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      child: Container(
        height: height,
        width: width,
        decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(
            Radius.circular(16),
          ),
        ),
      ),
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
    );
  }
}
