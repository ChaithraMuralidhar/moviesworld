class Movie {
   String id = "";
   String rank = " ";
   String title = " ";
   String fullTitle = " ";
   String year = " ";
   String image = " ";
   String crew = " ";
   String imDbRating = " ";
   String imDbRatingCount = " ";
   String imageBytes = "";

  Movie({
    required this.id,
    required this.rank,
    required this.title,
    required this.fullTitle,
    required this.year,
    required this.image,
    required this.crew,
    required this.imDbRating,
    required this.imDbRatingCount,
    required this.imageBytes
  });

  factory Movie.fromJson(Map<String,dynamic> json) {
    return Movie(
      id: json['id'] ?? "",
      rank: json['rank'] ?? "",
      title: json['title'] ?? "",
      fullTitle: json['fullTitle'] ?? "",
      year: json['year'] ?? "",
      image: json['image'] ?? "",
      crew: json['crew'] ?? "",
      imDbRating: json['imDbRating'] ?? "",
      imDbRatingCount: json['imDbRatingCount'] ?? "",
      imageBytes: ""
    );
  }

   Map<String, dynamic> toJson() => {
     "id": id,
     "rank": rank,
     "title": title,
     "fullTitle": fullTitle,
     "year": year,
     "image" : image,
     "crew" : crew,
     "imDbRating" : imDbRating,
     "imDbRatingCount" : imDbRatingCount,
     "imageBytes" : ""
   };

}