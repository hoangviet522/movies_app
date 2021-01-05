import 'package:mygarment/presentation/journeys/welcome/welcome_item_model.dart';

class WelcomeItemConstant {
  static List<WelcomeItemModel> welcomeItems = [
    WelcomeItemModel(
        index: 0,
        text: 'Hoà mình vào công nghệ, mở ra thế giới của riêng bạn',
        imagePath: 'welcome_1.jpg',
        title: 'Welcome title 1'),
    WelcomeItemModel(
        index: 1,
        text: 'Tập hợp tất cả những tri thức ngành may mà bạn cần',
        imagePath: 'welcome_2.jpg',
        title: 'Welcome title 2'),
    WelcomeItemModel(
        index: 2,
        text: 'Thao tác linh hoạt, thuận tiện và chính xác',
        imagePath: 'welcome_3.jpg',
        title: 'Welcome title 3')
  ];
}
