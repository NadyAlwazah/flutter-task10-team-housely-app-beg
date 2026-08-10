class ReviewModel {
  final String reviewerEmail;
  final String reviewerName;
  final String reviewerImage;
  final double rating;
  final String comment;
  final String? reviewImage;

  ReviewModel({
    required this.reviewerName,
    required this.reviewerImage,
    required this.rating,
    required this.comment,
    this.reviewImage,
    required this.reviewerEmail,
  });
}
