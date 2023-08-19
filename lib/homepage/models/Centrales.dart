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
       'assets/images/boul.jpg',
        'Centrale Nouadhibou 100MW est...',
        'Centrale Nouadhibou',
        'Centrale Electrique'
      ),
      Pic(
          'assets/images/sol.jpg',
          'Centrale Nouadhibou 100MW est...',
          'Centrale Nouadhibou',
          'Centrale Electrique'
      ),
      Pic(
          'assets/images/Cnktt.jpg',
          'Centrale Nouadhibou 100MW est...',
          'Centrale Nouadhibou',
          'Centrale Electrique'
      ),
    ];
  }
}