class Movie {
  final String name;
  final String image;

  Movie(this.name, this.image);

  @override
  String toString() {
    return 'Movie { $name $image }';
  }
}
