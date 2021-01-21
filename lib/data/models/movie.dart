// Our movie model
class Movie {
  final int id, year, numOfRatings, criticsReview, metascoreRating;
  final double rating;
  final List<String> genra;
  final String plot, title, poster, backdrop, releaseDate, movieLength;
  final List<Map> cast;

  Movie(
      {this.poster,
      this.backdrop,
      this.title,
      this.id,
      this.year,
      this.numOfRatings,
      this.criticsReview,
      this.metascoreRating,
      this.rating,
      this.genra,
      this.plot,
      this.cast,
      this.releaseDate,
      this.movieLength});
}

// our demo data movie data
List<Movie> movies = [
  Movie(
    id: 1,
    title: "Dark",
    year: 2020,
    poster: "assets/jpgs/poster_6.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Action", "Drama"],
    plot: plotText,
    releaseDate: "30 Dec, 2020",
    movieLength: "104",
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Marriage Story",
    year: 2020,
    poster: "assets/jpgs/poster_1.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Action", "Drama"],
    plot: plotText,
    releaseDate: "12 Aug, 2029",
    movieLength: "120",
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Spider Man",
    year: 2020,
    poster: "assets/jpgs/poster_7.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Action", "Drama"],
    plot: plotText,
    releaseDate: "12 Aug, 2029",
    movieLength: "120",
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Guardians and Galaxy",
    year: 2020,
    poster: "assets/jpgs/poster_3.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Action", "Drama"],
    plot: plotText,
    releaseDate: "13 Jan, 2028",
    movieLength: "89",
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "Bloodshot",
    year: 2020,
    poster: "assets/jpgs/poster_5.jpg",
    backdrop: "assets/images/backdrop_1.jpg",
    numOfRatings: 150212,
    rating: 7.3,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Action", "Drama"],
    plot: plotText,
    releaseDate: "30 Dec, 2020",
    movieLength: "132",
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 2,
    title: "Spies Disguise",
    year: 2019,
    poster: "assets/jpgs/poster_4.jpg",
    backdrop: "assets/images/backdrop_2.jpg",
    numOfRatings: 150212,
    rating: 8.2,
    criticsReview: 50,
    metascoreRating: 76,
    genra: ["Action", "Biography", "Drama"],
    plot: plotText,
    releaseDate: "30 Dec, 2020",
    movieLength: "98",
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
  Movie(
    id: 1,
    title: "No Time To Die",
    year: 2020,
    poster: "assets/jpgs/poster_2.jpg",
    backdrop: "assets/images/backdrop_3.jpg",
    numOfRatings: 150212,
    rating: 7.6,
    criticsReview: 50,
    metascoreRating: 79,
    genra: ["Action", "Drama"],
    plot: plotText,
    releaseDate: "30 Dec, 2020",
    movieLength: "89",
    cast: [
      {
        "orginalName": "James Mangold",
        "movieName": "Director",
        "image": "assets/images/actor_1.png",
      },
      {
        "orginalName": "Matt Damon",
        "movieName": "Carroll",
        "image": "assets/images/actor_2.png",
      },
      {
        "orginalName": "Christian Bale",
        "movieName": "Ken Miles",
        "image": "assets/images/actor_3.png",
      },
      {
        "orginalName": "Caitriona Balfe",
        "movieName": "Mollie",
        "image": "assets/images/actor_4.png",
      },
    ],
  ),
];

String plotText =
    "American car designer Carroll Shelby and driver Kn Miles battle corporate interference and the laws of physics to build a revolutionary race car for Ford in order.";
