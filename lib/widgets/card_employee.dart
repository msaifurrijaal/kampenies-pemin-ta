import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kampenies/models/user.dart';
import 'package:kampenies/pages/detail_employee_page.dart';
import 'package:kampenies/theme.dart';
import 'package:kampenies/widgets/card_age_widget.dart';

class CardEmployee extends StatelessWidget {
  const CardEmployee({
    Key? key,
    required this.user,
  }) : super(key: key);
  final User user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          DetailEmployeePage.routeName,
          arguments: user,
        );
      },
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            border:
                Border(bottom: BorderSide(color: Color(0xffEAECF0), width: 3))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                clipBehavior: Clip.antiAlias,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12))),
                child: Image.network(
                  (user.sex == "M")
                      ? "https://randomuser.me/api/portraits/men/${Random().nextInt(25)}.jpg"
                      : "https://randomuser.me/api/portraits/women/${Random().nextInt(25)}.jpg",
                  height: 125,
                  width: 125,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: user.division.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: blueColor,
                                ),
                          ),
                        ],
                        text: '${user.name} - ',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: blackColor, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Employee',
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium
                          ?.copyWith(color: greyColor),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.justify,
                    ),
                    const SizedBox(height: 4),
                    GenderCard(gender: user.sex),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
