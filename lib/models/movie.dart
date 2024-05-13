class Movie {
  String title;
  String backdropPath;
  String orginalTitle;
  String overview;
  String posterPath;
  String releaseDate;

  Movie({
    required this.title,
    required this.backdropPath,
    required this.orginalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
        title: json['title'] ?? '',
        backdropPath: json['backdrop_path'] ?? '',
        orginalTitle: json['original_title'] ?? '',
        overview: json['overview'] ??'',
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '');
  }
}

// {
    //   "backdrop_path": "/bWIIWhnaoWx3FTVXv6GkYDv3djL.jpg",
    //   "id": 940721,
    //   "original_title": "ゴジラ-1.0",
    //   "overview": "Postwar Japan is at its lowest point when a new crisis emerges in the form of a giant monster, baptized in the horrific power of the atomic bomb.",
    //   "poster_path": "/hkxxMIGaiCTmrEArK7J56JTKUlB.jpg",
    //   "media_type": "movie",
    //   "adult": false,
    //   "title": "Godzilla Minus One",
    //   "original_language": "ja",
    //   "genre_ids": [878, 27, 28],
    //   "popularity": 1017.628,
    //   "release_date": "2023-11-03",
    //   "video": false,
    //   "vote_average": 7.889,
    //   "vote_count": 674
    // },