class Details {
  String name, iList1;

  Details(String name, String iList1) {
    this.name = name;
    this.iList1 = iList1;
  }

  Details.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? "";
    iList1 = json['ilist1'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['ilist1'] = this.iList1;
    return data;
  }
}
