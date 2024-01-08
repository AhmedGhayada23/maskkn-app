// import 'dart:io' as io;
// import 'dart:isolate';
// import 'dart:ui';
// import 'package:async/async.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter_downloader/flutter_downloader.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:maskkn/models/item.dart';
// import 'package:open_file/open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:uuid/uuid.dart';
// import 'package:maskkn/appConfig.dart';
// import 'package:maskkn/models/chat-message.dart';
// import 'package:maskkn/models/chat.dart';
// import 'package:maskkn/services/authentication/authenticate.dart';

// import '../../models/user.dart';

// // a repository that contains all firestore requests and jobs
// class DataService {
//   //adds user to firestore
//   static Future<User?> addUserData(User user) async {
//     DocumentReference userDoc =
//         FirebaseFirestore.instance.collection('Users').doc(user.userId);
//     await userDoc.set(user.toMap());
//     return await getUserData(user.userId!);
//   }

//   static Future<User?> getUserData(String id) async {
//     DocumentReference userDoc =
//         FirebaseFirestore.instance.collection('Users').doc(id);
//     return User.fromFirestore(await userDoc.get());
//   }

//   static Stream<List<Chat>> getChatsStream(String id) {
//     var query = FirebaseFirestore.instance
//         .collection('chats')
//         .where("customerId", isEqualTo: id)
//         .snapshots();
//     var query2 = FirebaseFirestore.instance
//         .collection('chats')
//         .where("sellerId", isEqualTo: id)
//         .snapshots();
//     var list = StreamZip([query, query2]).map((list) {
//       List<Chat> chats = [];
//       list.forEach((element) {
//         chats.addAll(element.docs.map((doc) {
//           return Chat.fromFirestore(doc);
//         }).toList());
//       });
//       return chats;
//     });
//     return list;
//   }

//   static Stream<User> getUserStream() {
//     var query = FirebaseFirestore.instance
//         .collection('Users')
//         .doc(AuthenticationService.currentUser!.userId)
//         .snapshots()
//         .map((event) => User.fromMap(event.data() as Map<String, dynamic>));

//     return query;
//   }

//   static Stream<Chat> getMessagesStream(String id) {
//     var query = FirebaseFirestore.instance
//         .collection('chats')
//         .doc(id)
//         .snapshots()
//         .map((event) => Chat.fromMap(event.data() as Map<String, dynamic>));

//     return query;
//   }

//   static void sendMessage(Chat chat) {
//     FirebaseFirestore.instance
//         .collection('chats')
//         .doc(chat.id)
//         .update(chat.toMap());
//   }

//   static void updateChats(User usr) async {
//     DocumentReference doc =
//         FirebaseFirestore.instance.collection('Users').doc(usr.userId);
//     List<Map<dynamic, dynamic>> data =
//         usr.chats!.map((x) => x.toMap()).toList();

//     await doc.update({"chats": data});
//   }

//   static Future<String> uploadPhoto(
//       XFile? image, String chatId, String id) async {
//     final path = "${chatId}/${id}";
//     final file = io.File(image!.path);
//     final ref = FirebaseStorage.instance.ref().child(path);
//     var task = await ref.putFile(file);
//     if (task.state == TaskState.success) {
//       var url = await downloadImage(path);
//       return url;
//     } else
//       throw Exception("Upload Failed. Please Try Again!");
//   }

//   static Future<String> uploadFile(
//       io.File? file, String chatId, String id) async {
//     final path = "${chatId}/${id}";
//     final ref = FirebaseStorage.instance.ref().child(path);
//     var task = await ref.putFile(file!);
//     if (task.state == TaskState.success) {
//       var url = await downloadImage(path);
//       return url;
//     } else
//       throw Exception("Upload Failed. Please Try Again!");
//   }

//   static Future<String> downloadImage(String imagePath) async {
//     final ref = FirebaseStorage.instance.ref().child(imagePath);
// // no need of the file extension, the name will do fine.
//     var url = await ref.getDownloadURL();
//     return url;
//   }

//   static void startChat(userId) async {
//     final idmessage = const Uuid().v1();
//     final id = const Uuid().v1();
//     var message = ChatMessage(
//         from: AuthenticationService.currentUser!.userId,
//         to: userId,
//         msg: "hi",
//         time: DateTime.now(),
//         type: "txt",
//         id: idmessage);
//     List<ChatMessage> conv = [message];
//     var chat = Chat(
//         customerId: AuthenticationService.currentUser!.userId,
//         sellerId: userId,
//         lastMessage: "hi",
//         lastTime: DateTime.now(),
//         id: id,
//         conversation: conv);
//     AuthenticationService.currentUser!.chats!.add(chat);

//     updateChats(AuthenticationService.currentUser!);
//   }

//   static String? isChatStarted(Item item) {
//     var id = "";
//     AuthenticationService.currentUser!.chats!.forEach((element) {
//       var adMessage = element.conversation!.first;
//       if (adMessage.to!.contains(item.sellerId!) &&
//           adMessage.mediaPath!.contains(item.id!)) {
//         id = element.id!;
//         return;
//       }
//     });
//     return id;
//   }

//   static Future<List> start_Chat(Item item) async {
//     if(isChatStarted(item)!.isNotEmpty){
//        var chattingUser = await getUserData(item.sellerId!);
//        Chat chat =AuthenticationService.currentUser!.chats!.firstWhere((element) => element.sellerId==item.sellerId);
//        return [chattingUser,chat];
//     }
//     final idmessage = const Uuid().v1();
//     final id = const Uuid().v1();
//     var message = ChatMessage(
//         from: AuthenticationService.currentUser!.userId,
//         to: item.sellerId,
//         msg: "",
//         time: DateTime.now(),
//         type: "ad",
//         id: idmessage,
//         mediaPath: item.id); //mediaPath should take the item id
//     List<ChatMessage> conv = [message];
//     var chat = Chat(
//         customerId: AuthenticationService.currentUser!.userId,
//         sellerId: item.sellerId,
//         lastMessage: "",
//         lastTime: DateTime.now(),
//         id: id,
//         conversation: conv);
//     var chattingUser = await getUserData(item.sellerId!);
//     chattingUser!.chats!.add(chat);
//     AuthenticationService.currentUser!.chats!.add(chat);
//     updateChats(AuthenticationService.currentUser!);
//     updateChats(chattingUser);
    
//     return [chattingUser, chat];
//   }

//   static String sendWaitingMessage(chattingUserID, chat) {
//     final idWaiting = const Uuid().v1();
//     var waitingMessage = ChatMessage(
//         from: AuthenticationService.currentUser!.userId,
//         to: chattingUserID,
//         msg: "Sending message....",
//         time: DateTime.now(),
//         type: "txt",
//         id: idWaiting);
//     chat!.conversation!.add(waitingMessage);
//     var index = AuthenticationService.currentUser!.chats!
//         .indexWhere((element) => element.id == chat!.id);
//     if (AuthenticationService.currentUser!.chats!.isNotEmpty)
//       AuthenticationService.currentUser!.chats!.removeAt(index);
//     else
//       index = 0;
//     AuthenticationService.currentUser!.chats!.insert(index, chat);
//     updateChats(AuthenticationService.currentUser!);
//     return idWaiting;
//   }

//   static removeWaitingMessage(id, chat) {
//     chat!.conversation!.removeWhere(
//       (element) => element.id == id,
//     );
//     var index = AuthenticationService.currentUser!.chats!
//         .indexWhere((element) => element.id == chat!.id);
//     if (AuthenticationService.currentUser!.chats!.isNotEmpty)
//       AuthenticationService.currentUser!.chats!.removeAt(index);
//     else
//       index = 0;
//     AuthenticationService.currentUser!.chats!.insert(index, chat!);
//     DataService.updateChats(AuthenticationService.currentUser!);
//   }

//   static SendMessage(
//       messageType, mediaFile, chattingUser, chat, controller) async {
//     final id = const Uuid().v1();

//     var message = ChatMessage(
//         from: AuthenticationService.currentUser!.userId,
//         to: chattingUser.userId,
//         msg: controller.text,
//         time: DateTime.now(),
//         type: messageType,
//         id: id);

//     var mediaPath;
//     if (messageType == "image" || messageType == "video") {
//       var waitingId = DataService.sendWaitingMessage(chattingUser.userId, chat);
//       try {
//         mediaPath = await DataService.uploadPhoto(mediaFile, chat.id!, id);
//         removeWaitingMessage(waitingId, chat);
//       } on Exception catch (e) {
//         removeWaitingMessage(waitingId, chat);
//         Fluttertoast.showToast(
//             gravity: ToastGravity.TOP,
//             backgroundColor: Res.kPrimaryColor,
//             textColor: Res.kPrimaryColor,
//             fontSize: 20,
//             toastLength: Toast.LENGTH_LONG,
//             msg: e.toString());
//         return;
//       }
//     }

//     message.mediaPath = mediaPath;
//     chat!.conversation!.add(message);
//     //DataService.sendMessage(widget.chat!);
//     var index = AuthenticationService.currentUser!.chats!
//         .indexWhere((element) => element.id == chat!.id);
//     if (AuthenticationService.currentUser!.chats!.isNotEmpty)
//       AuthenticationService.currentUser!.chats!.removeAt(index);
//     else
//       index = 0;
//     AuthenticationService.currentUser!.chats!.insert(index, chat!);

//     chattingUser = await DataService.getUserData(chattingUser!.userId!);
//     index =
//         chattingUser!.chats!.indexWhere((element) => element.id == chat!.id);
//     if (chattingUser!.chats!.isNotEmpty) {
//       chattingUser!.chats![index].conversation!.add(message);
//     } else {
//       var newchat = Chat.fromMap(chat!.toMap());
//       newchat.conversation!.clear();
//       newchat.conversation!.add(message);
//       chattingUser!.chats!.add(newchat);
//     }

//     DataService.updateChats(chattingUser!);
//     DataService.updateChats(AuthenticationService.currentUser!);
//     controller.clear();
//   }

//   static SendDocMessage(
//       messageType, mediaFile, chattingUser, chat, fileName) async {
//     final id = const Uuid().v1();

//     var message = ChatMessage(
//         from: AuthenticationService.currentUser!.userId,
//         to: chattingUser.userId,
//         msg: fileName,
//         time: DateTime.now(),
//         type: messageType,
//         id: id);

//     var mediaPath;
//     var waitingId = DataService.sendWaitingMessage(chattingUser.userId, chat);
//     try {
//       mediaPath = await DataService.uploadFile(mediaFile, chat.id!, id);
//       removeWaitingMessage(waitingId, chat);
//     } on Exception catch (e) {
//       removeWaitingMessage(waitingId, chat);
//       Fluttertoast.showToast(
//           gravity: ToastGravity.TOP,
//           backgroundColor: Res.kPrimaryColor,
//           textColor: Res.kPrimaryColor,
//           fontSize: 20,
//           toastLength: Toast.LENGTH_LONG,
//           msg: e.toString());
//       return;
//     }

//     message.mediaPath = mediaPath;
//     chat!.conversation!.add(message);
//     //DataService.sendMessage(widget.chat!);
//     var index = AuthenticationService.currentUser!.chats!
//         .indexWhere((element) => element.id == chat!.id);
//     if (AuthenticationService.currentUser!.chats!.isNotEmpty)
//       AuthenticationService.currentUser!.chats!.removeAt(index);
//     else
//       index = 0;
//     AuthenticationService.currentUser!.chats!.insert(index, chat!);

//     chattingUser = await DataService.getUserData(chattingUser!.userId!);
//     index =
//         chattingUser!.chats!.indexWhere((element) => element.id == chat!.id);
//     if (chattingUser!.chats!.isNotEmpty) {
//       chattingUser!.chats![index].conversation!.add(message);
//     } else {
//       var newchat = Chat.fromMap(chat!.toMap());
//       newchat.conversation!.clear();
//       newchat.conversation!.add(message);
//       chattingUser!.chats!.add(newchat);
//     }

//     DataService.updateChats(chattingUser!);
//     DataService.updateChats(AuthenticationService.currentUser!);
//   }

//   static Future<String?> getDownloadPath() async {
//     io.Directory? directory;
//     try {
//       if (io.Platform.isIOS) {
//         directory = await getApplicationDocumentsDirectory();
//       } else {
//         directory = io.Directory('/storage/emulated/0/Download');
//         // Put file in global download folder, if for an unknown reason it didn't exist, we fallback
//         // ignore: avoid_slow_async_io
//         if (!await directory.exists())
//           directory = await getExternalStorageDirectory();
//       }
//     } catch (err, stack) {
//       print("Cannot get download folder path");
//     }
//     return directory?.path;
//   }

//   static openStream() {
//     ReceivePort _port = ReceivePort();
//     IsolateNameServer.registerPortWithName(
//         _port.sendPort, 'downloader_send_port');
//     _port.listen(receiveData);
//   }

//   static void receiveData(dynamic data) {
//     String id = data[0];
//     DownloadTaskStatus status = data[1];
//     int progress = data[2];
//     if (status == DownloadTaskStatus.complete) {
//       FlutterDownloader.open(taskId: id);
//     }
//   }

//   static Future<void> downloadFile(url, filename) async {
//     var status = await Permission.storage.status;
//     if (!status.isGranted) {
//       await Permission.storage.request();
//     }
//     io.Directory? appDocDir = await getExternalStorageDirectory();
//     String dirPath = appDocDir!.path;
//     if (!io.File("${dirPath}/${filename}").existsSync()) {
//       openStream();
//       FlutterDownloader.registerCallback(downloadCallback);
//       final taskId = await FlutterDownloader.enqueue(
//         url: url,
//         savedDir: '${dirPath}',
//         fileName: filename,
//         showNotification:
//             true, // show download progress in status bar (for Android)
//         openFileFromNotification:
//             true, // click on notification to open downloaded file (for Android)
//       );
//     } else {
//    /*   OpenFile.open("${dirPath}/${filename}")
//           .then((value) => {print(value.message.toString())});*/
//     }
//   }

//   @pragma('vm:entry-point')
//   static void downloadCallback(id, status, progress) {
//     final SendPort? send =
//         IsolateNameServer.lookupPortByName('downloader_send_port');
//     send!.send([id, status, progress]);
//   }
// }
