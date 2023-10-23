class Horse_model{
  late String name,year_born,age;

  Horse_model({required this.name, required this.year_born, required this.age});

  factory Horse_model.fromJson(Map<dynamic, dynamic> json) {
    return Horse_model(
      name: json["name"],
      year_born: json["year_born"],
      age: json["age"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "name": this.name,
      "year_born": this.year_born,
      "age": this.age,
    };
  }

//
}