import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/utils/image_paths.dart';
import '../../../../common/widgets/list_items/news_list_items.dart';
import '../controllers/feed_controller.dart';

class FeedView extends GetView<FeedController> {
  const FeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return Scaffold(
          body: SafeArea(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              padding: const EdgeInsets.fromLTRB(
                10,
                10,
                10,
                5,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                            text: const TextSpan(
                              text: "Hi, ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                              children: [
                                TextSpan(
                                  text: "Welcome to",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Text(
                            "Newsy",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const CircleAvatar(
                        backgroundImage: AssetImage(
                          ImagePaths.appLogoImagePath,
                        ),
                        radius: 30,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: controller.searchController,
                    decoration: InputDecoration(
                      enabledBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                        borderSide: BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            20,
                          ),
                        ),
                        borderSide: BorderSide(
                          width: 2,
                          color: Colors.black,
                        ),
                      ),
                      hintText: "like \"Microsoft\"",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (controller.searchController.text.isNotEmpty) {
                            controller
                                .fetchAllNews(controller.searchController.text);
                            controller.searchResultText.value =
                                "\"${controller.searchController.text}\"";
                          }

                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: const Text("Enter Something to Search"),
                              behavior: SnackBarBehavior.floating,
                              margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                              backgroundColor: Colors.blue,
                              action: SnackBarAction(
                                label: "Ok",
                                textColor: Colors.white,
                                onPressed: () {
                                  ScaffoldMessenger.of(context)
                                      .hideCurrentSnackBar();
                                },
                              ),
                            ),
                          );
                        },
                        child: const Icon(
                          Icons.search,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  RichText(
                    text: TextSpan(
                      text: "Showing results for ",
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      children: [
                        TextSpan(
                          text: controller.searchResultText.value,
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: controller.isLoading.value
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
                                  source: controller
                                      .allNews!.articles[index]!.source!.name,
                                  imagePath: controller
                                      .allNews!.articles[index]!.urlToImage,
                                  publishedAt: controller
                                      .allNews!.articles[index]!.publishedAt,
                                  title: controller
                                      .allNews!.articles[index]!.title,
                                  description: controller
                                      .allNews!.articles[index]!.description,
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
