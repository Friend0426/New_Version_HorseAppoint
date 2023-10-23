class Shedule_modle{
  late int hourses;
  late String time,owner_name,owner_phone;

  Shedule_modle({required this.hourses, required this.time, required this.owner_name, required this.owner_phone});

  factory Shedule_modle.fromJson(Map<dynamic, dynamic> json) {
    return Shedule_modle(
      hourses: json["hourses"],
      time: json["time"],
      owner_name: json["owner_name"],
      owner_phone: json["owner_phone"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "hourses": this.hourses,
      "time": this.time,
      "owner_name": this.owner_name,
      "owner_phone": this.owner_phone,
    };
  }

//
}