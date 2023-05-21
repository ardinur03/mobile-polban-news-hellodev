// ignore_for_file: unused_import

import '../homepage_page/widgets/homepage_item_widget.dart';
import 'controller/homepage_controller.dart';
import 'package:polban_news/data/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/widgets/app_bar/custom_app_bar.dart';
import 'package:polban_news/widgets/custom_button.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:polban_news/data/models/sliderNews_model.dart';

// ignore_for_file: must_be_immutable
class HomepagePage extends StatefulWidget {
  @override
  _HomepagePageState createState() => _HomepagePageState();
}

class _HomepagePageState extends State<HomepagePage> {
  final controller = Get.put(HomepageController());
  int _currentIndex = 0;
  final CarouselController _carouselController = CarouselController();
  //buat variabel untuk menampung data slider
  List<sliderNews> slider = [];
  //Masukan data slider dari controller fecthslider ke variabel slider
  void initState() {
    super.initState();
    controller.fetchSlider().then((value) {
      //Cek apakah fecthSlider berhasil mendapatkan data
      setState(() {
        slider = controller.slider;
      });
    });
  }

  String _kategori = 'Semua';
  String _filter = 'Terbaru';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(
            40.00,
          ),
          title: Padding(
            padding: getPadding(
              left: 12,
            ),
            child: Text(
              "lbl_polban_news".tr,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.left,
              style: AppStyle.txtInterBlack18,
            ),
          ),
          actions: [
            CustomImageView(
              svgPath: ImageConstant.imgNotification,
              height: getSize(
                24.00,
              ),
              width: getSize(
                24.00,
              ),
              margin: getMargin(
                left: 13,
                top: 7,
                right: 13,
                bottom: 9,
              ),
            ),
          ],
          styleType: Style.bgFillWhiteA700,
        ),
        body: SizedBox(
          width: size.width,
          child: RefreshIndicator(
            onRefresh: () async {
              controller.refreshNews(_kategori);
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: getPadding(
                  left: 10,
                  top: 10,
                  right: 10,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(
                          width: 106,
                          height: 25,
                          variant: _kategori == 'Semua'
                              ? ButtonVariant.OutlineBlue200_1
                              : null,
                          text: "lbl_semua".tr,
                          onTap: () {
                            setState(() {
                              _kategori = 'Semua';
                              controller.fetchNews(_kategori);
                            });
                          },
                        ),
                        SizedBox(width: 11),
                        CustomButton(
                          width: 106,
                          height: 25,
                          variant: _kategori == 'Pusat'
                              ? ButtonVariant.OutlineBlue200_1
                              : null,
                          text: "lbl_pusat".tr,
                          onTap: () {
                            setState(() {
                              _kategori = 'Pusat';
                              controller.fetchNews(_kategori);
                            });
                          },
                        ),
                        SizedBox(width: 11),
                        CustomButton(
                          width: 106,
                          height: 25,
                          variant: _kategori == 'Himpunan'
                              ? ButtonVariant.OutlineBlue200_1
                              : null,
                          text: "lbl_himpunan".tr,
                          onTap: () {
                            setState(() {
                              _kategori = 'Himpunan';
                              controller.fetchNews(_kategori);
                            });
                          },
                        ),
                      ],
                    ),
                    Container(
                      height: getVerticalSize(230.00),
                      width: getHorizontalSize(340.00),
                      margin: getMargin(top: 15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 7,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Stack(
                        alignment: Alignment.bottomCenter,
                        children: [
                          if (slider.isNotEmpty)
                            CarouselSlider(
                              options: CarouselOptions(
                                height: getVerticalSize(230.00),
                                autoPlay: true,
                                autoPlayInterval: Duration(seconds: 12),
                                enlargeCenterPage: true,
                                viewportFraction: 1.0,
                                scrollDirection: Axis.horizontal,
                                reverse: false,
                                disableCenter: true,
                                enableInfiniteScroll: true,
                                onPageChanged: (index, reason) {
                                  setState(() {
                                    _currentIndex = index;
                                  });
                                },
                              ),
                              carouselController: _carouselController,
                              items: slider.map((slide) {
                                return Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                    borderRadius: BorderRadius.circular(10),
                                    clipBehavior: Clip.hardEdge,
                                    child: Image.network(
                                      slide.picturePath,
                                      fit: BoxFit.fill,
                                      alignment: Alignment.center,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              width: getHorizontalSize(315.00),
                              margin: getMargin(bottom: 17),
                              child: Text(
                                slider.isNotEmpty
                                    ? slider[_currentIndex].title
                                    : '',
                                maxLines: null,
                                textAlign: TextAlign.justify,
                                // style: AppStyle.txtInterBold18,
                                style: TextStyle(
                                    color: ColorConstant.whiteA700,
                                    fontSize: getSize(
                                      18.00,
                                    ),
                                    fontWeight: FontWeight.w700,
                                    shadows: [
                                      Shadow(
                                        color: Colors.black.withOpacity(0.5),
                                        offset: Offset(0, 3),
                                        blurRadius: 3,
                                      ),
                                    ]),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              //get lenght of widget.news.galleris
                              children: [
                                for (int i = 0; i < 4; i++)
                                  GestureDetector(
                                    onTap: () {
                                      final targetIndex =
                                          (_currentIndex ~/ 4) * 4 + i;
                                      _carouselController
                                          .animateToPage(targetIndex);
                                    },
                                    child: AnimatedContainer(
                                      duration: Duration(milliseconds: 300),
                                      width: 8.0,
                                      height: 8.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 8.0, horizontal: 4.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.light
                                                ? Color.fromARGB(
                                                    216, 65, 62, 62)
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
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 12,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _filter = 'Terbaru';
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_terbaru".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular10,
                                ),
                                Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(90.00),
                                  margin: getMargin(top: 3),
                                  decoration: BoxDecoration(
                                    color: _filter == 'Terbaru'
                                        ? ColorConstant.indigoA200
                                        : ColorConstant.blue200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _filter = 'Terpopuler';
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_terpopuler".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular10,
                                ),
                                Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(90.00),
                                  margin: getMargin(top: 3),
                                  decoration: BoxDecoration(
                                    color: _filter == 'Terpopuler'
                                        ? ColorConstant.indigoA200
                                        : ColorConstant.blue200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _filter = 'Paling Disukai';
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "lbl_paling_disukai".tr,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: AppStyle.txtInterRegular10,
                                ),
                                Container(
                                  height: getVerticalSize(1.00),
                                  width: getHorizontalSize(90.00),
                                  margin: getMargin(top: 3),
                                  decoration: BoxDecoration(
                                    color: _filter == 'Paling Disukai'
                                        ? ColorConstant.indigoA200
                                        : ColorConstant.blue200,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: getPadding(
                        top: 13,
                      ),
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          if (scrollNotification is ScrollEndNotification) {
                            if (controller
                                    .scrollController.position.extentAfter ==
                                0) {
                              controller.loadMoreNews(); // memuat data tambahan
                            }
                          }
                          return true;
                        },
                        child: Obx(() => ListView.separated(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              separatorBuilder: (context, index) {
                                return SizedBox(
                                  height: getVerticalSize(
                                    20.00,
                                  ),
                                );
                              },
                              itemCount: controller.news.length,
                              itemBuilder: (context, index) {
                                final newsModel = controller.news[index];
                                return HomepageItemWidget(newsModel);
                              },
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
