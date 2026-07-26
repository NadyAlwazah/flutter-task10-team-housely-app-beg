import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/property_model.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/review_model.dart';

final List<PropertyModel> recommendedProperties = [
  PropertyModel(
    id: 1,
    title: "Ayana Homestay",
    location: "Imogiri, Yogyakarta",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 310,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description:
        "Beautiful modern homestay with garden view.Beautiful modern homestay with garden view.Beautiful modern homestay with garden view.Beautiful modern homestay with garden view.Beautiful modern homestay with garden view.Beautiful modern homestay with garden view.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),

  PropertyModel(
    id: 2,
    title: "Green Villa",
    location: "Bantul, Yogyakarta",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),
];

List<PropertyModel> popularProperties = [
  PropertyModel(
    id: 3,
    title: "Ayana Homestay",
    location: "Imogiri, Yogyakarta  12 153 5153123 ",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 310,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description: "Beautiful modern homestay with garden view.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),

  PropertyModel(
    id: 4,
    title: "Green Villa",
    location: "Bantul, Yogyakarta",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),
  PropertyModel(
    id: 5,
    title: "Ayana Homestay",
    location: "Imogiri, Yogyakarta",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 310,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description: "Beautiful modern homestay with garden view.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),

  PropertyModel(
    id: 6,
    title: "Green Villa",
    location: "Bantul, Yogyakarta",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),
  PropertyModel(
    id: 7,
    title: "Green Villa",
    location: "Bantul, Yogyakarta",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),
];
List<PropertyModel> nearbyProperties = [
  PropertyModel(
    id: 8,
    title: "Ayana Homestay",
    location: "Imogiri, Yogyakarta  12 153 5153123 ",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 310,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description: "Beautiful modern homestay with garden view.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),

  PropertyModel(
    id: 9,
    title: "Green Villa",
    location: "Bantul, Yogyakarta",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),
  PropertyModel(
    id: 10,
    title: "Ayana Homestay",
    location: "Imogiri, Yogyakarta",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 310,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description: "Beautiful modern homestay with garden view.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),

  PropertyModel(
    id: 11,
    title: "Green Villa",
    location: "Bantul, Yogyakarta",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),
  PropertyModel(
    id: 12,
    title: "Green Villa",
    location: "Bantul, Yogyakarta",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    reviews: [
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview1Png,
        rating: 4.5,
        comment:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. 1500s,",
      ),
      ReviewModel(
        reviewerName: "Theresa Webb",
        reviewerImage: AssetsData.imageReview2Png,
        rating: 3.5,
        comment: "Amazing place, very clean and cozy! ",
      ),
    ],
  ),
];
