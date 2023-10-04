class Pic {
  String bgImage;
  String name;
  String description;
  String type;

  Pic(
      this.bgImage,
      this.description,
      this.name,
      this.type
      );
  static List<Pic> Sower() {
    return [
      Pic(
          'assets/images/sol.jpg',
          'Faculte affilié à lUniversite de Nouakchott',
          'Describtion sur UNV',
          'Faculte'
      ),
    ];
  }
}