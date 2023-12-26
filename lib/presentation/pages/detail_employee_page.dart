// ignore_for_file: sized_box_for_whitespace

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:kampenies/config/theme.dart';
import 'package:kampenies/util/utils.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../data/models/user.dart';
import '../widgets/card_location_widget.dart';

class DetailEmployeePage extends StatelessWidget {
  const DetailEmployeePage({super.key});

  static const routeName = "/detail-employee-page";

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    double screenHeight =
        mediaQueryData.size.height - mediaQueryData.padding.top;
    double screenWidth = mediaQueryData.size.width;
    final user = ModalRoute.of(context)?.settings.arguments as User;
    final String careerPath = careerPathEmployee(user.division.name);
    print(screenWidth);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight:
            (screenWidth < 400) ? screenHeight * 0.08 : screenHeight * 0.18,
        backgroundColor: whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: blackColor,
          onPressed: () => Navigator.pop(context),
          highlightColor: transparentColor,
          splashColor: transparentColor,
        ),
        title: Text(
          'Profil Karyawan',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.share_outlined,
              color: blackColor,
            ),
          ),
        ],
        elevation: 0.5,
        shadowColor: blueColor,
      ),
      body: Column(
        children: [
          Container(
            height:
                (screenWidth < 400) ? screenHeight * 0.8 : screenHeight * 0.6,
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                child: Column(
                  children: [
                    Image.network(
                      (user.sex == "M")
                          ? "https://randomuser.me/api/portraits/men/${Random().nextInt(25)}.jpg"
                          : "https://randomuser.me/api/portraits/women/${Random().nextInt(25)}.jpg",
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            "Employee",
                            style:
                                Theme.of(context).textTheme.bodyLarge?.copyWith(
                                      color: darkGreyColor,
                                    ),
                          ),
                          const SizedBox(height: 16),
                          const LocationCard(),
                          const SizedBox(height: 24),
                          Text(
                            'Tentang Karyawan',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: darkGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Divisi',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            user.division.name,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: darkGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Jenjang Karir',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            careerPath,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: darkGreyColor,
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Container(
                                alignment: Alignment.center,
                                width: 48,
                                height: 48,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: lightBlueColor,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(
                                  Icons.link,
                                  color: blueColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  minimumSize: MaterialStateProperty.all(
                                    const Size(280, 48),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Image.asset('images/icon_linkedin.png'),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Hubungkan melalui LinkedIn',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge
                                          ?.copyWith(
                                            fontWeight: FontWeight.w500,
                                            color: whiteColor,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              boxShadow: [
                BoxShadow(
                  color: blueColor.withOpacity(
                    0.2,
                  ), // Set the shadow color to blue with 0.2 opacity
                  offset:
                      const Offset(2.0, 2.0), // Set the offset of the shadow
                  blurRadius: 5.0,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            height:
                (screenWidth < 400) ? screenHeight * 0.12 : screenHeight * 0.22,
            alignment: Alignment.center,
            child: ElevatedButton(
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  const Size(double.infinity, 48),
                ),
              ),
              onPressed: () {
                final Uri phoneNumber = Uri.parse('https://wa.me/12345678');
                launchUrl(phoneNumber);
              },
              child: Text(
                'Chat',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontWeight: FontWeight.w700, color: whiteColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
