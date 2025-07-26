/// id : "28850776-4f0d-4c43-8a9c-e2ea2bd88143"
/// created_at : "2025-07-23T12:05:20.653587+00:00"
/// rate : 5
/// for_user : "d957a073-057d-4a61-babb-4d37878cf847"
/// for_product : "56edf3fa-2013-4b3b-9f0f-62b185cb3bc2"

class Ratemodel {
  Ratemodel({
      String? id, 
      String? createdAt, 
      num? rate, 
      String? forUser, 
      String? forProduct,}){
    _id = id;
    _createdAt = createdAt;
    _rate = rate;
    _forUser = forUser;
    _forProduct = forProduct;
}

  Ratemodel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _rate = json['rate'];
    _forUser = json['for_user'];
    _forProduct = json['for_product'];
  }
  String? _id;
  String? _createdAt;
  num? _rate;
  String? _forUser;
  String? _forProduct;
Ratemodel copyWith({  String? id,
  String? createdAt,
  num? rate,
  String? forUser,
  String? forProduct,
}) => Ratemodel(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  rate: rate ?? _rate,
  forUser: forUser ?? _forUser,
  forProduct: forProduct ?? _forProduct,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  num? get rate => _rate;
  String? get forUser => _forUser;
  String? get forProduct => _forProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['rate'] = _rate;
    map['for_user'] = _forUser;
    map['for_product'] = _forProduct;
    return map;
  }

}