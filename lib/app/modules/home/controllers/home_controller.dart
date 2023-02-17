import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:technical_test/app/core/constants/colors.dart';
import 'package:technical_test/app/core/constants/text_strings.dart';
import 'package:technical_test/app/model/news_model.dart';
import 'package:technical_test/app/modules/home/widgets/news_widgets/news_list.dart';

class HomeController extends GetxController with GetTickerProviderStateMixin {
  //TODO: Implement HomeController
  final navBarIndex = 0.obs;
  late ScrollController scroll;
  late TabController tabCtrl;
  final getStorage = GetStorage();
  var title = ''.obs;
  var subTitle = ''.obs;
  var fetchNews = <News>[].obs;
  var fetchLatest = <News>[].obs;
  var fetchTrending = <News>[].obs;
  var publisherName = ''.obs;
  var publisherImage = ''.obs;
  var newsLink = ''.obs;
  var newsIndex = 0.obs;
  var clickCount = 0.obs;
  var fiveArticle = false.obs;
  var tenArticle = false.obs;
  List<Tab> tabs = [];
  RxList<Tab> tabX = <Tab>[].obs;

  @override
  void onInit() {
    super.onInit();

    scroll = ScrollController();
    updateTab();

    tabCtrl = TabController(length: tabX.length, vsync: this);
    greetingLogic();
    fetchLatestNews();
    fetchTrendingNews();
    fetchNewNews();
    cardPublisherName('');
    cardPublisherImage('');
    cardLink('');
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    tabCtrl.dispose();
  }

  fetchLatestNews() async {
    final String response =
        await rootBundle.loadString('assets/data/latest.json');
    var getModel = newsFromJson(response);
    if (response != '') {
      fetchLatest.value = getModel;
    }
  }

  fetchTrendingNews() async {
    final String response =
        await rootBundle.loadString('assets/data/trending.json');
    var getModel = newsFromJson(response);
    if (response != '') {
      fetchTrending.value = getModel;
    }
  }

  fetchNewNews() async {
    final String response =
        await rootBundle.loadString('assets/data/news.json');
    var getModel = newsFromJson(response);
    if (response != '') {
      fetchNews.value = getModel;
    }
  }

  void changeNavBarIndex(int value) {
    navBarIndex.value = value;
  }

  void greetingLogic() {
    var hour = DateTime.now().hour.toString();
    var minute = DateTime.now().minute.toString();
    var timeString = hour + minute;
    final time = int.parse(timeString);

    if ((time >= 60) && (time <= 1159)) {
      title.value = kGoodMorning;
      subTitle.value = kGoodMorningSubtitle;
    } else if ((time >= 120) && (time <= 1359)) {
      title.value = kGoodAfternoon;
      subTitle.value = kGoodAfternoonSubtitle;
    } else if ((time >= 140) && (time <= 1759)) {
      title.value = kGoodEvening;
      subTitle.value = kGoodEveningSubtitle;
    } else if (((time >= 180) && (time <= 240)) ||
        ((time >= 00) && (time <= 559))) {
      title.value = kGoodNight;
      subTitle.value = kGoodNightSubtitle;
    }
  }

  void cardPublisherName(String name) {
    publisherName.value = name;
  }

  void cardPublisherImage(String image) {
    publisherImage.value = image;
  }

  void cardLink(String link) {
    newsLink.value = link;
  }

  void increment() => clickCount.value++;
  void click() {
    bool fifthArticle = clickCount.value % 5 == 0;
    bool tenthArticle = clickCount.value % 10 == 0;
    if (fifthArticle) {
      fiveArticle.value = fifthArticle;
    }
    fiveArticle.value = fifthArticle;

    if (tenthArticle) {
      tenArticle.value = tenthArticle;
      clickCount.value = 0;
    }
    tenArticle.value = tenthArticle;
  }

  void updateTabLength() {
    var tab = tabX.length;

    tabCtrl = TabController(length: tab, vsync: this);
  }

  updateTab() {
    var readNews = getStorage.read('isNews');
    var readTrend = getStorage.read('isTrending');
    List<Tab> tabs = [const Tab(text: 'Latest')];
    if (readTrend == 'on' && readNews == 'on') {
      tabs.add(const Tab(text: 'Trending'));
      tabs.add(const Tab(text: 'News'));
    }
    if (readTrend == 'off' && readNews == 'on') {
      tabs.add(const Tab(text: 'News'));
    }
    if (readTrend == 'on' && readNews == 'off') {
      tabs.add(const Tab(text: 'Trending'));
    }

    return tabX.value = tabs;
  }

  updateTrendingTab() {
    var readTrend = getStorage.read('isTrending');
    List<Tab> tabs = [const Tab(text: 'Latest')];

    if (readTrend == 'off' || readTrend == null) {
      tabs.remove(const Tab(text: 'Trending'));
    }
    if (readTrend == 'on') {
      tabs.add(const Tab(text: 'Trending'));
    }

    return tabX.value = tabs;
  }

  updateNewsTab() {
    var readTrend = getStorage.read('isTrending');
    var readNews = getStorage.read('isNews');
    List<Tab> tabs = [const Tab(text: 'Latest'), const Tab(text: 'Trending')];

    if (readNews == 'off' || readNews == null) {
      return tabX.value = tabs;
    }
    if (readNews == 'on') {
      tabs.add(const Tab(text: 'News'));
      return tabX.value = tabs;
    }
    tabs = [const Tab(text: 'Latest')];
    return tabX.value = tabs;
  }
}
