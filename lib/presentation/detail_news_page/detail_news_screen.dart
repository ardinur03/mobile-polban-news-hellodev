// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:polban_news/presentation/detail_news_page/controller/detail_news_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailNewsScreen extends StatefulWidget {
  final News news;
  const DetailNewsScreen({Key? key, required this.news}) : super(key: key);

  @override
  _DetailNewsScreenState createState() => _DetailNewsScreenState();
}

class _DetailNewsScreenState extends State<DetailNewsScreen> {
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailNewsController>(
      init: DetailNewsController(),
      builder: (controller) {
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
                            // width: double.infinity,
                            // height: 400,
                            child: ClipRRect(
                              child: InteractiveViewer(
                                child: Image.network(
                                  widget.news.galleries.isNotEmpty
                                      ? widget.news.galleries[_currentIndex]
                                      : 'https://t4.ftcdn.net/jpg/02/51/95/53/360_F_251955356_FAQH0U1y1TZw3ZcdPGybwUkH90a3VAhb.jpg',
                                  // fit: BoxFit.cover,
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
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 270,
                                enlargeCenterPage: true,
                                viewportFraction:
                                    1.0, //  menyesuaikan lebar CarouselSlider
                                scrollDirection: Axis.horizontal,
                                reverse: false,
                                disableCenter: true,
                                enableInfiniteScroll: false,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                              carouselController: _carouselController,
                              items: widget.news.galleries.map((gallery) {
                                return Container(
                                  width: double.infinity,
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
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.network(
                                      gallery,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            //get lenght of widget.news.galleris
                            children: [
                              for (int i = 0;
                                  i < widget.news.galleries.length && i < 4;
                                  i++)
                                GestureDetector(
                                  onTap: () {
                                    final targetIndex =
                                        (_currentIndex ~/ 4) * 4 + i;
                                    _carouselController
                                        .animateToPage(targetIndex);
                                  },
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 300),
                                    width: 16.0,
                                    height: 5.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: (Theme.of(context).brightness ==
                                                  Brightness.light
                                              ? Color.fromARGB(216, 65, 62, 62)
                                              : Color.fromARGB(
                                                  255, 223, 223, 223))
                                          .withOpacity(i == _currentIndex % 4
                                              ? 0.9
                                              : 0.4),
                                    ),
                                  ),
                                ),
                            ],
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
                      widget.news.title,
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
                        backgroundImage: Image.network(
                          widget.news.logo == null
                              ? 'https://external-content.duckduckgo.com/iu/?u=http%3A%2F%2Fwww.buffalohockeybeat.com%2Fwp-content%2Fuploads%2F2019%2F02%2FPilut6.jpg&f=1&nofb=1&ipt=482f3fd2da682caf2e10497f1dbc2538b9172ff0d680bf5e7adfbf2c7ca7473c&ipo=images'
                              : widget.news.logo,
                          fit: BoxFit.cover,
                        ).image,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'oleh ${widget.news.author}',
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '${widget.news.created_at}',
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
                      widget.news.content,
                      style: TextStyle(fontSize: 14),
                      textAlign: TextAlign.justify,
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
