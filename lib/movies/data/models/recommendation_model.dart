import 'package:movies/movies/domain/entities/recommendation.dart';

class RecommendationModel extends Recommendation {
  const RecommendationModel({
    super.backdropPath,
    required super.id,
  });

  factory RecommendationModel.fromJson(Map<String, dynamic> json) =>
      RecommendationModel(
        backdropPath: json['backdrop_path'] ?? '/yeXCUUSaAZFH4Zyd4Spgq4nl1xr.jpg',
        id: json['id'],
      );
}
