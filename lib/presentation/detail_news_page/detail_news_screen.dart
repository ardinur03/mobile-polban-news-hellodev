import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/presentation/detail_news_page/controller/detail_news_controller.dart';

class DetailNewsScreen extends StatelessWidget {
  final News news;
  const DetailNewsScreen({Key? key, required this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailNewsController>(
      init: DetailNewsController(),
      builder: (controller) {
        print('onTap triggered with news id $news');
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 38),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: Container(
                            width: double.infinity,
                            height: 400,
                            child: ClipRRect(
                              child: InteractiveViewer(
                                child: Image.network(
                                  news.galleries.isNotEmpty
                                      ? news.galleries[0]
                                      : 'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 270,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 7,
                                offset: Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image(
                              image: NetworkImage(
                                news.galleries.isNotEmpty
                                    ? news.galleries[0]
                                    : 'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Positioned(
                          top: 10,
                          left: 10,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(
                                  context); // Replace with your navigation code
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(57, 224, 224, 224),
                              ),
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      news.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 15,
                        backgroundImage: NetworkImage(
                          'https://randomuser.me/api/portraits/men/1.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'oleh ${news.author}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${news.created_at}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.toggleBookmark();
                              },
                              child: Obx(
                                () => Icon(
                                  controller.bookmarkStatus.value
                                      ? Icons.bookmark
                                      : Icons.bookmark_border,
                                  color: controller.bookmarkStatus.value
                                      ? Color.fromARGB(255, 0, 0, 0)
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            GestureDetector(
                              onTap: () {
                                controller.toggleLove();
                              },
                              child: Obx(
                                () => Icon(
                                  controller.loveStatus.value
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: controller.loveStatus.value
                                      ? Color.fromARGB(255, 0, 0, 0)
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            ),
                            SizedBox(width: 5),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      news.content,
                      style: TextStyle(fontSize: 14),
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
