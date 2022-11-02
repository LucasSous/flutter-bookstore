class Publisher {
  dynamic id;
  dynamic name;
  dynamic city;

  Publisher({
    this.id,
    required this.name,
    required this.city,
  });

  Publisher.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['nome'];
    city = json['cidade'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['nome'] = name;
    data['cidade'] = city;
    return data;
  }
}
