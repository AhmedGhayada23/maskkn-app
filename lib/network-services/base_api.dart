///https://www.mskkn.com/api/login

class BaseAPI {
  //roots
  // static var rootUrl = "https://mskn.om/api";
//tatic var usersPath = "$rootUrl/user";

  //test roots
  static var rootUrlTest = "https://stg.mskkn.com/api";
  static var usersPathTest = "$rootUrlTest/user";

  //auth api
  var loignPath = "$usersPathTest/login";
  var registerPath = "$usersPathTest/register";
  var get_otp = "$rootUrlTest/login/get-otp?phone=";
  var validateOTP = "$rootUrlTest/login/validate-otp";
  var resendOTP = "$usersPathTest/login/get-otp?phone=";
  var loginGoogle = "$rootUrlTest/login/google/callback?access_token=";

  //profile api
  var profileInfo = "$usersPathTest/my/profile";
  var updatprofileInfo = "$usersPathTest/update-profile";
  var updatPassword = "$usersPathTest/update-password";

  //states & cities profile
  var statsPath = "$rootUrlTest/public/state?id=";
  var citiesPath = "$rootUrlTest/public/city";

  //property_request api
  var propertyRequestTypes = "$rootUrlTest/public/property-request-types";
  var propertyManagementApi = "$rootUrlTest/propertyMangment/search";
  var appraisalApi = "$rootUrlTest/appraisal/search";
  var propertyManagementDetailsApi = "$rootUrlTest/public/agencies";
  var promoCodeApi = "$rootUrlTest/promocode";

  var sectorsApi = "$rootUrlTest/public/sectors";
  var sectorsDetailsApi = "$rootUrlTest/public/sector-details";
  var sectorsDetailsIdApi = "$rootUrlTest/public/sector-details-by-type";
  var governorateApi = "$rootUrlTest/states";
  var governorateIdApi = "$rootUrlTest/get-state-cities";
  var areasApi = "$rootUrlTest/get-city-areas";

  var cityApi = "$rootUrlTest/get-state-cities";
  var bankApi = "$rootUrlTest/public/banks";

  //property api
  var search = "$rootUrlTest/search";
  var properties = "$rootUrlTest/properties";
  var appartments = "$rootUrlTest/public/get-apartments";
  var propertyRequestTypesApi = "$rootUrlTest/public/property-request-types";
  var propertyRequest = "$rootUrlTest/property-request";

  // Schedual Tour
  var sentSchedualTour = "$rootUrlTest/properties/schedualtour/store";

  //packages api
  var photographyPackages = "$rootUrlTest/photography-services/packages";
  var packages = "$rootUrlTest/packages";
  var checkPayment = "$rootUrlTest/order/check-payment-by-order-id";
  var packageCheckout = "$rootUrlTest/package-checkout";

  //chat api
  var allChatUsersPath = "$rootUrlTest/messages/users";
  var chatForUser = "$rootUrlTest/messages/user";
  var sendMessagePath = "$rootUrlTest/messages/send-message";

  //favorite api
  var postFavorite = "$rootUrlTest/favorite-property";
  var getFavorite = "$rootUrlTest/my/favorite-properties";
  var deleteFavorite = "$rootUrlTest/delete-favorite-property";

  //best properties
  var bestAppartments = "$rootUrlTest/public/best-apartments";
  var bestVillas = "$rootUrlTest/public/best-villas";

  //required data
  var sectorDetails = "$rootUrlTest/public/sector-details";
  var roomTypes = "$rootUrlTest/public/room-types";
  var features = "$rootUrlTest/features";

  // ads
  var myAdsApi = "$rootUrlTest/my-ads";
  var storeProperties = "$rootUrlTest/properties";

  // Features
  var featuresApi = "$rootUrlTest/features";

  // offers
  var myOfferApi = "$rootUrlTest/property-request";
  var deleteOfferApi = "$rootUrlTest/property-request/delete";

  // maps
  var propertyOffPlanApi = "$rootUrlTest/property-offplan";
  var detailsPropertyOffPlanApi = "$rootUrlTest/property-offplan";

  // more routes
  Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8",
  };
}
