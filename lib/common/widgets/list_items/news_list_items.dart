import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsy/common/utils/image_paths.dart';

class NewsListItems extends StatelessWidget {
  final String? source;
  final String? imagePath;
  final DateTime? publishedAt;
  final String? title;
  final String? description;

  const NewsListItems({
    super.key,
    required this.source,
    required this.imagePath,
    required this.publishedAt,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider<Object> getImageProvider(String? imagePath) {
      if (imagePath == null) {
        return const AssetImage(ImagePaths.appLogoImagePath);
      }

      return NetworkImage(imagePath);
    }

    return Card(
      elevation: 8,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            10,
          ),
        ),
      ),
      child: Wrap(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: getImageProvider(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(
              10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      source == null ? "Source Unavailable" : source!,
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                    Text(
                      publishedAt == null
                          ? "Publish time unavailable"
                          : DateFormat.yMMMMd().format(
                              publishedAt!,
                            ),
                      maxLines: 8,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  title == null ? "Name Unavailable" : title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  description == null
                      ? "Description Unavailable"
                      : description!,
                  maxLines: 5,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
