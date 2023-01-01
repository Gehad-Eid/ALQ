class achieve {
  String id = "";
  String name = "", detail = "", image = "", date = "";

  achieve({
    required this.id,
    required this.name,
    required this.detail,
    required this.image,
    required this.date,
  });

  achieve.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    detail = json['detail'];
    image = json['image'];
    date = json['date'];
  }
  // //for retrieving data from wishList
  // achieve.fromJson2(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'];
  //   detail = json['detail'];
  //   image = json['image'];
  //   date = json['date'];
  // }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['detail'] = this.detail;
    data['image'] = this.image;
    data['date'] = this.date;
    return data;
  }
}

List<achieve> achieveList = [
  achieve(
      id: '5',
      name: "nmae 1",
      detail: "det1",
      image: "images/rating.png",
      date: '12/12/2022'),
  achieve(
      id: '1',
      name: "nmae 1",
      detail: "det1",
      image: "images/star.png",
      date: '12/12/2022'),
  achieve(
      id: '2',
      name: "nmae 1",
      detail: "det1",
      image: "images/exam.png",
      date: '12/12/2022'),
  achieve(
      id: '3',
      name: "nmae 1",
      detail: "det1",
      image: "images/brain.png",
      date: '12/12/2022'),
  achieve(
      id: '4',
      name: "nmae 1",
      detail: "det1",
      image: "images/rating.png",
      date: '12/12/2022'),
];
