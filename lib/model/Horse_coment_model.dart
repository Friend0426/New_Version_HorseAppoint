class Horse_cmnt_model{
  late String cmnt,img,owner_name;
  late int time_of_cmnt;

  Horse_cmnt_model({required this.cmnt, required this.img,required this.owner_name, required this.time_of_cmnt});

  factory Horse_cmnt_model.fromJson(Map<dynamic, dynamic> json) {
    return Horse_cmnt_model(
      cmnt: json["cmnt"],
      img: json["img"],
      owner_name: json["owner_name"],
      time_of_cmnt: json["time_of_cmnt"],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      "cmnt": this.cmnt,
      "img": this.img,
      "owner_name": this.owner_name,
      "time_of_cmnt": this.time_of_cmnt,
    };
  }

//
}