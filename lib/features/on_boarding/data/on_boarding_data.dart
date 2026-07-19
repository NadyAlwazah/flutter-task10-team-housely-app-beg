import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'on_boarding_model.dart';

List<OnBoardingModel> onBoardingPages = [
  OnBoardingModel(
    image1: AssetsData.imageOnboard1png,
    image2: AssetsData.imageOnboard2png,
    title: "Find the perfect place \nfor your future house",

    subTitle:
        "find the best place for your dream house with your family and loved ones",
  ),
  OnBoardingModel(
    image1: AssetsData.imageOnboard3png,
    image2: AssetsData.imageOnboard4png,
    title: "Fast sell your property \n in just one click",
    subTitle: "Simplify the property sales process with just your smartphone",
  ),
  OnBoardingModel(
    image1: AssetsData.imageOnboard5png,
    image2: AssetsData.imageOnboard6png,
    title: "find your dream home with us",
    subTitle:
        "Just search and select your favorite property you want to locate",
  ),
];
