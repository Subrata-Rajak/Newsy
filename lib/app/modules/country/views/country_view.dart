import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsy/app/data/arguments/country_news_arguments.dart';
import 'package:newsy/app/modules/country_news/controllers/country_news_controller.dart';
import 'package:newsy/app/routes/app_pages.dart';
import 'package:newsy/common/utils/image_paths.dart';
import 'package:newsy/core/country.dart';

import '../controllers/country_controller.dart';

class CountryView extends GetView<CountryController> {
  final CountryController _controller = Get.put(CountryController());

  CountryView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        itemCount: Country.countryNames.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () async {
              Get.toNamed(
                Routes.COUNTRY_NEWS,
                arguments: CountryNewsArguments(
                  countryName: Country.countryNames[index],
                ),
              );

              await CountryNewsController.instance.getCountryNews(
                Country.countries[Country.countryNames[index]].toString(),
              );
            },
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(
                    10,
                  ),
                ),
                border: Border.all(color: Colors.black),
                image: DecorationImage(
                    image: AssetImage(
                      CountryFlagPaths
                          .countryFlags[Country.countryNames[index]]!,
                    ),
                    fit: BoxFit.cover),
              ),
              child: Center(
                child: Text(
                  Country.countryNames[index],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
