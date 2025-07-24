/// product_id : "56edf3fa-2013-4b3b-9f0f-62b185cb3bc2"
/// created_at : "2025-07-22T11:51:27.773286+00:00"
/// image_url : "https://images.unsplash.com/photo-1546868871-7041f2a55e12?q=80&w=764&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"
/// sale : "50"
/// product_name : "watch"
/// price : "35000"
/// old_price : "50000"
/// category : "electrones"
/// description : "watch of apple"
/// favorate : [{"id":"69148a7d-090e-4750-bf8f-78cf52ce25f9","for_user":"d957a073-057d-4a61-babb-4d37878cf847","created_at":"2025-07-23T09:30:07.666477+00:00","for_product":"56edf3fa-2013-4b3b-9f0f-62b185cb3bc2","is_favorate":true},{"id":"6232eb59-0d3b-46e3-9d8b-6020162f6392","for_user":"2f20435b-f4a1-4376-979e-06851c8e75a8","created_at":"2025-07-23T12:16:21.209489+00:00","for_product":"56edf3fa-2013-4b3b-9f0f-62b185cb3bc2","is_favorate":true}]

class ProdactsModel {
  ProdactsModel({
      String? productId, 
      String? createdAt, 
      String? imageUrl, 
      String? sale, 
      String? productName, 
      String? price, 
      String? oldPrice, 
      String? category, 
      String? description, 
      List<Favorate>? favorate,}){
    _productId = productId;
    _createdAt = createdAt;
    _imageUrl = imageUrl;
    _sale = sale;
    _productName = productName;
    _price = price;
    _oldPrice = oldPrice;
    _category = category;
    _description = description;
    _favorate = favorate;
}

  ProdactsModel.fromJson(dynamic json) {
    _productId = json['product_id'];
    _createdAt = json['created_at'];
    _imageUrl = json['image_url'];
    _sale = json['sale'];
    _productName = json['product_name'];
    _price = json['price'];
    _oldPrice = json['old_price'];
    _category = json['category'];
    _description = json['description'];
    if (json['favorate'] != null) {
      _favorate = [];
      json['favorate'].forEach((v) {
        _favorate?.add(Favorate.fromJson(v));
      });
    }
  }
  String? _productId;
  String? _createdAt;
  String? _imageUrl;
  String? _sale;
  String? _productName;
  String? _price;
  String? _oldPrice;
  String? _category;
  String? _description;
  List<Favorate>? _favorate;
ProdactsModel copyWith({  String? productId,
  String? createdAt,
  String? imageUrl,
  String? sale,
  String? productName,
  String? price,
  String? oldPrice,
  String? category,
  String? description,
  List<Favorate>? favorate,
}) => ProdactsModel(  productId: productId ?? _productId,
  createdAt: createdAt ?? _createdAt,
  imageUrl: imageUrl ?? _imageUrl,
  sale: sale ?? _sale,
  productName: productName ?? _productName,
  price: price ?? _price,
  oldPrice: oldPrice ?? _oldPrice,
  category: category ?? _category,
  description: description ?? _description,
  favorate: favorate ?? _favorate,
);
  String? get productId => _productId;
  String? get createdAt => _createdAt;
  String? get imageUrl => _imageUrl;
  String? get sale => _sale;
  String? get productName => _productName;
  String? get price => _price;
  String? get oldPrice => _oldPrice;
  String? get category => _category;
  String? get description => _description;
  List<Favorate>? get favorate => _favorate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['product_id'] = _productId;
    map['created_at'] = _createdAt;
    map['image_url'] = _imageUrl;
    map['sale'] = _sale;
    map['product_name'] = _productName;
    map['price'] = _price;
    map['old_price'] = _oldPrice;
    map['category'] = _category;
    map['description'] = _description;
    if (_favorate != null) {
      map['favorate'] = _favorate?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// id : "69148a7d-090e-4750-bf8f-78cf52ce25f9"
/// for_user : "d957a073-057d-4a61-babb-4d37878cf847"
/// created_at : "2025-07-23T09:30:07.666477+00:00"
/// for_product : "56edf3fa-2013-4b3b-9f0f-62b185cb3bc2"
/// is_favorate : true

class Favorate {
  Favorate({
      String? id, 
      String? forUser, 
      String? createdAt, 
      String? forProduct, 
      bool? isFavorate,}){
    _id = id;
    _forUser = forUser;
    _createdAt = createdAt;
    _forProduct = forProduct;
    _isFavorate = isFavorate;
}

  Favorate.fromJson(dynamic json) {
    _id = json['id'];
    _forUser = json['for_user'];
    _createdAt = json['created_at'];
    _forProduct = json['for_product'];
    _isFavorate = json['is_favorate'];
  }
  String? _id;
  String? _forUser;
  String? _createdAt;
  String? _forProduct;
  bool? _isFavorate;
Favorate copyWith({  String? id,
  String? forUser,
  String? createdAt,
  String? forProduct,
  bool? isFavorate,
}) => Favorate(  id: id ?? _id,
  forUser: forUser ?? _forUser,
  createdAt: createdAt ?? _createdAt,
  forProduct: forProduct ?? _forProduct,
  isFavorate: isFavorate ?? _isFavorate,
);
  String? get id => _id;
  String? get forUser => _forUser;
  String? get createdAt => _createdAt;
  String? get forProduct => _forProduct;
  bool? get isFavorate => _isFavorate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['for_user'] = _forUser;
    map['created_at'] = _createdAt;
    map['for_product'] = _forProduct;
    map['is_favorate'] = _isFavorate;
    return map;
  }

}