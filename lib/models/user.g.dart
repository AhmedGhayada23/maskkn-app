// // GENERATED CODE - DO NOT MODIFY BY HAND

// part of 'user.dart';

// // **************************************************************************
// // JsonSerializableGenerator
// // **************************************************************************

// User _$UserFromJson(Map<String, dynamic> json) => User(
//       id: json['id'] as int?,
//       name: json['name'] as String?,
//       email: json['email'] as String?,
//       phone: json['phone'] as String?,
//       email_verified_at: json['email_verified_at'] as String?,
//       status: json['status'] as String?,
//       website: json['website'] as String?,
//       description: json['description'] as String?,
//       state_id: json['state_id'] as String?,
//       city_id: json['city_id'] as String?,
//       google_id: json['google_id'] as String?,
//       bank: json['bank'] as String?,
//       api_token: json['api_token'] as dynamic,
//       is_apprasial: json['is_apprasial'] as dynamic,
//       is_advertisement: json['is_advertisement'] as dynamic,
//       is_propertyMangment: json['is_propertyMangment'] as dynamic,
//       agency_id: json['agency_id'] as String?,
//       created_at: json['created_at'] as String?,
//       updated_at: json['updated_at'] as String?,
//       avatar: json['avatar'] as String?,
//       role: json['role'] as String?,
//       active_package: json['active_package'] == null
//           ? null
//           : ActivePackage.fromJson(
//               json['active_package'] as Map<String, dynamic>),
//       billing: json['billing'] == null
//           ? null
//           : Billing.fromJson(json['billing'] as Map<String, dynamic>),
//       total_paid: json['total_paid'] as int?,
//       media: (json['media'] as List<dynamic>?)
//           ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
//           .toList(),
//     );

// Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
//       'id': instance.id,
//       'name': instance.name,
//       'email': instance.email,
//       'phone': instance.phone,
//       'email_verified_at': instance.email_verified_at,
//       'status': instance.status,
//       'website': instance.website,
//       'description': instance.description,
//       'state_id': instance.state_id,
//       'city_id': instance.city_id,
//       'google_id': instance.google_id,
//       'bank': instance.bank,
//       'api_token': instance.api_token,
//       'is_apprasial': instance.is_apprasial,
//       'is_advertisement': instance.is_advertisement,
//       'is_propertyMangment': instance.is_propertyMangment,
//       'agency_id': instance.agency_id,
//       'created_at': instance.created_at,
//       'updated_at': instance.updated_at,
//       'avatar': instance.avatar,
//       'role': instance.role,
//       'active_package': instance.active_package,
//       'billing': instance.billing,
//       'total_paid': instance.total_paid,
//       'media': instance.media,
//     };

// ActivePackage _$ActivePackageFromJson(Map<String, dynamic> json) =>
//     ActivePackage(
//       id: json['id'] as int?,
//       name_en: json['name_en'] as String?,
//       name_ar: json['name_ar'] as String?,
//       number_of_listing: json['number_of_listing'] as String?,
//       appraisal: json['appraisal'] as String?,
//       number_of_days: json['number_of_days'] as String?,
//       discount: json['discount'] as String?,
//       enable_360: json['enable_360'] as String?,
//       enable_3d: json['enable_3d'] as String?,
//       enable_advancedEditor: json['enable_advancedEditor'] as String?,
//       status: json['status'] as String?,
//       price: json['price'] as String?,
//       created_at: json['created_at'] as String?,
//       updated_at: json['updated_at'] as String?,
//       active_orders: json['active_orders'] as int?,
//     );

// Map<String, dynamic> _$ActivePackageToJson(ActivePackage instance) =>
//     <String, dynamic>{
//       'id': instance.id,
//       'name_en': instance.name_en,
//       'name_ar': instance.name_ar,
//       'number_of_listing': instance.number_of_listing,
//       'appraisal': instance.appraisal,
//       'number_of_days': instance.number_of_days,
//       'discount': instance.discount,
//       'enable_360': instance.enable_360,
//       'enable_3d': instance.enable_3d,
//       'enable_advancedEditor': instance.enable_advancedEditor,
//       'status': instance.status,
//       'price': instance.price,
//       'created_at': instance.created_at,
//       'updated_at': instance.updated_at,
//       'active_orders': instance.active_orders,
//     };

// Billing _$BillingFromJson(Map<String, dynamic> json) => Billing(
//       id: json['id'] as int?,
//       package_id: json['package_id'] as String?,
//       code: json['code'] as String?,
//       secret: json['secret'] as String?,
//       amount: json['amount'] as String?,
//       days: json['days'] as String?,
//       payment_done: json['payment_done'] as String?,
//       status: json['status'] as String?,
//       listing_consumed: json['listing_consumed'] as String?,
//       active: json['active'] as String?,
//       payment_method: json['payment_method'] as String?,
//       slip: json['slip'] as String?,
//       user_id: json['user_id'] as String?,
//       created_at: json['created_at'] as String?,
//       updated_at: json['updated_at'] as String?,
//     );

// Map<String, dynamic> _$BillingToJson(Billing instance) => <String, dynamic>{
//       'id': instance.id,
//       'package_id': instance.package_id,
//       'code': instance.code,
//       'secret': instance.secret,
//       'amount': instance.amount,
//       'days': instance.days,
//       'payment_done': instance.payment_done,
//       'status': instance.status,
//       'listing_consumed': instance.listing_consumed,
//       'active': instance.active,
//       'payment_method': instance.payment_method,
//       'slip': instance.slip,
//       'user_id': instance.user_id,
//       'created_at': instance.created_at,
//       'updated_at': instance.updated_at,
//     };

// Media _$MediaFromJson(Map<String, dynamic> json) => Media(
//       id: json['id'] as int?,
//       model_type: json['model_type'] as String?,
//       model_id: json['model_id'] as String?,
//       uuid: json['uuid'] as String?,
//       collection_name: json['collection_name'] as String?,
//       name: json['name'] as String?,
//       file_name: json['file_name'] as String?,
//       mime_type: json['mime_type'] as String?,
//       disk: json['disk'] as String?,
//       conversions_disk: json['conversions_disk'] as String?,
//       size: json['size'] as String?,
//       manipulations: json['manipulations'] as List<dynamic>?,
//       custom_properties: json['custom_properties'] as List<dynamic>?,
//       generated_conversions: json['generated_conversions'] == null
//           ? null
//           : GeneratedConversions.fromJson(
//               json['generated_conversions'] as Map<String, dynamic>),
//       responsive_images: json['responsive_images'] as List<dynamic>?,
//       order_column: json['order_column'] as String?,
//       created_at: json['created_at'] as String?,
//       updated_at: json['updated_at'] as String?,
//       original_url: json['original_url'] as String?,
//       preview_url: json['preview_url'] as String?,
//     );

// Map<String, dynamic> _$MediaToJson(Media instance) => <String, dynamic>{
//       'id': instance.id,
//       'model_type': instance.model_type,
//       'model_id': instance.model_id,
//       'uuid': instance.uuid,
//       'collection_name': instance.collection_name,
//       'name': instance.name,
//       'file_name': instance.file_name,
//       'mime_type': instance.mime_type,
//       'disk': instance.disk,
//       'conversions_disk': instance.conversions_disk,
//       'size': instance.size,
//       'manipulations': instance.manipulations,
//       'custom_properties': instance.custom_properties,
//       'generated_conversions': instance.generated_conversions,
//       'responsive_images': instance.responsive_images,
//       'order_column': instance.order_column,
//       'created_at': instance.created_at,
//       'updated_at': instance.updated_at,
//       'original_url': instance.original_url,
//       'preview_url': instance.preview_url,
//     };

// GeneratedConversions _$GeneratedConversionsFromJson(
//         Map<String, dynamic> json) =>
//     GeneratedConversions(
//       thumb: json['thumb'] as bool?,
//       small: json['small'] as bool?,
//       medium: json['medium'] as bool?,
//       large: json['large'] as bool?,
//     );

// Map<String, dynamic> _$GeneratedConversionsToJson(
//         GeneratedConversions instance) =>
//     <String, dynamic>{
//       'thumb': instance.thumb,
//       'small': instance.small,
//       'medium': instance.medium,
//       'large': instance.large,
//     };
