/// id : "69148a7d-090e-4750-bf8f-78cf52ce25f9"
/// created_at : "2025-07-23T09:30:07.666477+00:00"
/// is_favorate : true
/// for_user : "d957a073-057d-4a61-babb-4d37878cf847"
/// for_product : "56edf3fa-2013-4b3b-9f0f-62b185cb3bc2"

class FavorateModel {
  FavorateModel({
      String? id, 
      String? createdAt, 
      bool? isFavorate, 
      String? forUser, 
      String? forProduct,}){
    _id = id;
    _createdAt = createdAt;
    _isFavorate = isFavorate;
    _forUser = forUser;
    _forProduct = forProduct;
}

  FavorateModel.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['created_at'];
    _isFavorate = json['is_favorate'];
    _forUser = json['for_user'];
    _forProduct = json['for_product'];
  }
  String? _id;
  String? _createdAt;
  bool? _isFavorate;
  String? _forUser;
  String? _forProduct;
FavorateModel copyWith({  String? id,
  String? createdAt,
  bool? isFavorate,
  String? forUser,
  String? forProduct,
}) => FavorateModel(  id: id ?? _id,
  createdAt: createdAt ?? _createdAt,
  isFavorate: isFavorate ?? _isFavorate,
  forUser: forUser ?? _forUser,
  forProduct: forProduct ?? _forProduct,
);
  String? get id => _id;
  String? get createdAt => _createdAt;
  bool? get isFavorate => _isFavorate;
  String? get forUser => _forUser;
  String? get forProduct => _forProduct;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['created_at'] = _createdAt;
    map['is_favorate'] = _isFavorate;
    map['for_user'] = _forUser;
    map['for_product'] = _forProduct;
    return map;
  }

}