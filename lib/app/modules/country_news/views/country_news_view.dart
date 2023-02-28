import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:newsy/app/data/arguments/country_news_arguments.dart';

import '../../../../common/widgets/list_items/news_list_items.dart';
import '../controllers/country_news_controller.dart';

class CountryNewsView extends GetView<CountryNewsController> {
  const CountryNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as CountryNewsArguments;

    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              args.countryName,
            ),
          ),
          body: controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Scrollbar(
                  thickness: 5,
                  radius: const Radius.circular(
                    20,
                  ),
                  scrollbarOrientation: ScrollbarOrientation.right,
                  child: ListView.separated(
                    itemCount: controller.allNews!.articles.length,
                    itemBuilder: (context, index) {
                      return NewsListItems(
                        source:
                            controller.allNews!.articles[index]!.source!.name,
                        imagePath:
                            controller.allNews!.articles[index]!.urlToImage,
                        publishedAt:
                            controller.allNews!.articles[index]!.publishedAt,
                        title: controller.allNews!.articles[index]!.title,
                        description:
                            controller.allNews!.articles[index]!.description,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 10,
                      );
                    },
                  ),
                ),
        );
      },
    );
  }
}
