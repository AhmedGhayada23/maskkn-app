// // This is a basic Flutter widget test.
// //
// // To perform an interaction with a widget in your test, use the WidgetTester
// // utility in the flutter_test package. For example, you can send tap and scroll
// // gestures. You can also use WidgetTester to find child components in the widget
// // tree, read text, and verify that the values of widget properties are correct.

// import 'package:maskkn/models/general_details.dart';
// import 'package:maskkn/network-services/required_data_api.dart';
// import 'package:test/test.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';



// void main() {
//   test('getSectorDetails() returns List<SectorType> from API or cache', () async {
//     // Arrange
//     String filename = "sectorsDetails.json";
//     Directory tempDir = await getTemporaryDirectory();
//     File file = File(tempDir.path + "/"+ filename );
//     Duration cacheDuration = Duration(days: 1); // set cache duration to 1 day
//     var apiClient = RequairedData();

//     // Act
//     List<SectorType> result1 = await apiClient.getSectorDetails();
//     expect(result1, isA<List<SectorType>>());

//     // Assert
//     if (file.existsSync()) {
//       // check that file was created or deleted as expected
//       expect(file.lastModifiedSync().isAfter(DateTime.now().subtract(cacheDuration)), isTrue);
//     }

//     // Act - retrieve cached data
//     List<SectorType> result2 = await apiClient.getSectorDetails();
//     expect(result2, isA<List<SectorType>>());

//     // Assert - check that cached data is returned instead of API call
//     expect(result2, equals(result1));
//   });
// }
