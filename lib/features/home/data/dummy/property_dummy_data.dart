import 'package:flutter_task10_team_housely_app_beg/core/utils/assets.dart';
import 'package:flutter_task10_team_housely_app_beg/features/home/data/models/agent_model.dart';
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
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Apartment",
    hasAc: true,
    hasWifi: true,

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
    title: "Bali Komang Guest",
    location: "Nusa penida, bali",
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
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Arlene McCoy",
      role: "Senior Agent",
    ),
    type: "Hotel",
    hasAc: true,
    hasWifi: true,

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
    title: "Takatea Homestay",
    location: "Jl. Tentara Pelajar No.47, RW.001 ",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 120,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description: "Beautiful modern homestay with garden view.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Villa",
    hasAc: false,
    hasWifi: true,

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
    title: "Maharani Villa Yogyakarta",
    location:
        "Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 320,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Apartment",
    hasAc: false,
    hasWifi: true,
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
    title: "Bali Komang Guest",
    location: "Nusa Penida, Bali",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 180,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description: "Beautiful modern homestay with garden view.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Villa",
    hasAc: true,
    hasWifi: false,
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
    title: "Batavia Apartments",
    location:
        "Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City,",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 120,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Penhouse",
    hasAc: false,
    hasWifi: true,
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
    title: "Manhattan Hotel ",
    location:
        "Jl. Prof. DR. Satrio No.Kav.19-24, RT.7/RW.4, Kuningan, Karet Kuningan, Kecamatan Setiabudi, Kota Jakarta Selatan",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 230,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Penhouse",
    hasAc: true,
    hasWifi: false,
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
    title: "Maharani Villa Yogyakarta",
    location:
        "Benhil, Jl. Bendungan Hilir Karet Tengsin, Bendungan Hilir, Tanah Abang, Central Jakarta City, ",
    image: AssetsData.imageRecommendedImage1Png,
    pricePerMonth: 320,
    rating: 4.5,
    bedrooms: 3,
    bathrooms: 2,
    buildYear: 2020,
    parking: 1,
    area: 1880,
    status: "For Rent",
    description: "Beautiful modern homestay with garden view.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Apartment",
    hasAc: true,
    hasWifi: true,
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
    title: "Apartement land house",
    location: "Jl. Tentara Pelajar No.47, RW.001",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 320,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Rent",
    description: "Spacious villa with private pool.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Hotel",
    hasAc: false,
    hasWifi: true,
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
    title: "Syria",
    location: "Lataki, Syriea",
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
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Penhouse",
    hasAc: true,
    hasWifi: false,
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
    title: "Germany",
    location: "Barllen, Germany",
    image: AssetsData.imageRecommendedImage2Png,
    pricePerMonth: 420,
    rating: 4.8,
    bedrooms: 4,
    bathrooms: 3,
    buildYear: 2019,
    parking: 2,
    area: 2100,
    status: "For Sale",
    description: "Spacious villa with private pool.",
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Apartment",
    hasAc: false,
    hasWifi: true,
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
    title: "USA",
    location: "los, USA",
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
    agent: AgentModel(
      image: AssetsData.imageAgentPng,
      name: "Theresa Webb",
      role: "Property Agent",
    ),
    type: "Villa",
    hasAc: true,
    hasWifi: false,
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
