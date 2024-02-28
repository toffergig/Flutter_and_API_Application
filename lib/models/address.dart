

import 'package:json_annotation/json_annotation.dart';

part 'address.g.dart';
//part of 'user.dart';

@JsonSerializable()
class Address{
    String street;
    String suite;
    String city;
    String zipcode;
    //Geo geo;

    Address({
      required this.street,
      required this.suite,
      required this.city,
      required this.zipcode,
    });

    factory Address.fromJson(Map<String, dynamic> json) => _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);


}