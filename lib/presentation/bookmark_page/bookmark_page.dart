import 'package:flutter/material.dart';
import 'package:polban_news/core/app_export.dart';
import 'package:polban_news/widgets/app_bar/custom_app_bar.dart';
import 'package:polban_news/widgets/custom_icon_button.dart';
import 'package:polban_news/presentation/bookmark_page/controller/bookmark_controller.dart';
import 'package:polban_news/presentation/homepage_page/widgets/homepage_item_widget.dart';

class BookmarkPage extends StatefulWidget {
  @override
  _BookmarkPageState createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {
  final controller = Get.put(BookmarkController());
  String _pilihan = 'Bookmark';
  String _islogin = '';
  bool isDataInitialized = false; // Tambahkan flag

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    _islogin = await controller.fetchBearerToken();
    if (_islogin != '') {
      controller.fetchBookmark();
    }
    setState(() {
      isDataInitialized =
          true; // Set flag menjadi true setelah pemanggilan selesai
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget contentWidget;

    if (!isDataInitialized) {
      // Tampilkan widget loading jika data belum diinisialisasi
      contentWidget = Center(
        child: CircularProgressIndicator(),
      );
    } else if (_islogin != '') {
      contentWidget = Padding(
        padding: getPadding(top: 13),
        child: Obx(() => ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return SizedBox(
                  height: getVerticalSize(20.00),
                );
              },
              itemCount: controller.news.length,
              itemBuilder: (context, index) {
                final newsModel = controller.news[index];
                return HomepageItemWidget(newsModel);
              },
            )),
      );
    } else {
      contentWidget = Padding(
        padding: EdgeInsets.only(top: 80),
        child: Center(
          child: Text(
            "Bookmark hanya bisa diakses setelah login",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorConstant.whiteA700,
        appBar: CustomAppBar(
          height: getVerticalSize(40.00),
          title: Padding(
            padding: getPadding(left: 12),
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
              height: getSize(24.00),
              width: getSize(24.00),
              margin: getMargin(left: 13, top: 7, right: 13, bottom: 9),
            ),
          ],
          styleType: Style.bgFillWhiteA700,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: getPadding(left: 16, top: 24, right: 16, bottom: 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: getPadding(left: 33, right: 18),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pilihan = 'Bookmark';
                          });
                        },
                        child: Padding(
                          padding: getPadding(top: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                height: 50,
                                width: 50,
                                child: CustomImageView(
                                  svgPath: _pilihan == 'Bookmark'
                                      ? ImageConstant.imgIBookmarkActive
                                      : ImageConstant.imgIBookmarkInactive,
                                ),
                              ),
                              Padding(
                                padding: getPadding(top: 5),
                                child: Text(
                                  "Bookmark",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: _pilihan == 'Bookmark'
                                      ? AppStyle.txtPoppinsMedium12
                                      : AppStyle.txtPoppinsMedium12Gray900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pilihan = 'Disukai';
                          });
                        },
                        child: Padding(
                          padding: getPadding(left: 43, bottom: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                height: 50,
                                width: 50,
                                child: CustomImageView(
                                  svgPath: _pilihan == 'Disukai'
                                      ? ImageConstant.imgFavoriteActive
                                      : ImageConstant.imgFavoriteInactive,
                                ),
                              ),
                              Padding(
                                padding: getPadding(top: 5),
                                child: Text(
                                  "Disukai",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: _pilihan == 'Disukai'
                                      ? AppStyle.txtPoppinsMedium12
                                      : AppStyle.txtPoppinsMedium12Gray900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _pilihan = 'Terakhir Dilihat';
                          });
                        },
                        child: Padding(
                          padding: getPadding(left: 28, bottom: 1),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CustomIconButton(
                                height: 50,
                                width: 50,
                                child: CustomImageView(
                                  svgPath: _pilihan == 'Terakhir Dilihat'
                                      ? ImageConstant.imgLastViewActive
                                      : ImageConstant.imgLastViewInactive,
                                ),
                              ),
                              Padding(
                                padding: getPadding(top: 5),
                                child: Text(
                                  "Terakhir Dilihat",
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: _pilihan == 'Terakhir Dilihat'
                                      ? AppStyle.txtPoppinsMedium12
                                      : AppStyle.txtPoppinsMedium12Gray900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: getPadding(top: 10),
                  child: Divider(
                    height: getVerticalSize(2),
                    thickness: getVerticalSize(2),
                    color: ColorConstant.blueGray100,
                  ),
                ),
                contentWidget,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
