// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShoppingCartData _$ShoppingCartDataFromJson(Map<String, dynamic> json) {
  return ShoppingCartData(
      id: json['id'] as int,
      name: json['name'] as String,
      price: (json['price'] as num)?.toDouble(),
      number: json['number'] as int,
      spec: (json['spec'] as Map<String, dynamic>)?.map(
        (k, e) => MapEntry(k, e as int),
      ),
      specName: json['specName'] as String,
      checked: json['checked'] as bool);
}

Map<String, dynamic> _$ShoppingCartDataToJson(ShoppingCartData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'number': instance.number,
      'spec': instance.spec,
      'specName': instance.specName,
      'checked': instance.checked
    };
