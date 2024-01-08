import 'package:flutter/material.dart';
import 'package:maskkn/appConfig.dart';
import 'package:maskkn/models/agent_model.dart';
import 'package:maskkn/models/chat.dart';
import 'package:maskkn/models/user.dart';
import 'package:maskkn/network-services/chatting.dart';
import 'package:maskkn/screens/chat-screen/components/conversation-item.dart';
import 'package:maskkn/screens/chat-screen/components/search-bar.dart';
import 'package:maskkn/screens/chat-screen/conversation-screen.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  var searchController = TextEditingController();
  ChatsApi api = ChatsApi();
  Map<User, Chat> chatsMap = {};
  List<UserChant> users = [];
  Widget ConversationList(List<UserChant> users, Map<User, Chat> chatsMap) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: users.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversationScreen(
                  userId: users[index].id!,
                  userName: users[index].name!,
                  userImage: users[index].avatar!,
                  // chat: chatsMap[users[index]],
                ),
              )),
          child: ConversationItem(
            photo: users[index].avatar,
            username: users[index].name,
            lastMessage: chatsMap[users[index]]!.data!.last.message,
            lastTime: chatsMap[users[index]]!.data!.last.created_at,
            onDeleted: (context) {
              debugPrint("deleted");
              // AuthenticationService.currentUser!.chats!
              //     .removeWhere((element) => element.id == users[index].id);
              // DataService.updateChats(AuthenticationService.currentUser!);
              // DataService.updateChats(chatsMap[index]!);
            },
          ),
        );
      },
    );
  }

  // void getUsersChat() async {
  //   var user = await api.getChats();
  //   setState(() {
  //     users.addAll(user);
  //   });
  // }

  @override
  void initState() {
    super.initState();
    //  getUsersChat();
    searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  Future<Map<User1, Chat>> initChats(List<User1>? users) async {
    Map<User1, Chat> chatsMap = {};
    if (users != null) {
      for (var user in users) {
        var name = user.name;
        // var chats = await api.getChatForUser(user.id!);
        if (name!.contains(searchController.text)) {
          // chatsMap.putIfAbsent(user, () => chats);
        }
      }
    }
    return chatsMap;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Res.whiteColor,
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Column(
            children: [
              SearchChatBar(
                controller: searchController,
              ),
              const SizedBox(
                height: 20,
              ),

              StreamBuilder<List<UserChant>>(
                stream: Stream.periodic(const Duration(seconds: 3))
                    .asyncMap((_) => api.getChats()), // ربط الدالة بالبث
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Res.kPrimaryColor,
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("Error: ${snapshot.error}"),
                    );
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return Center(
                      child: Text("No available Chats"),
                    );
                  } else {
                    users = snapshot.data ?? [];

                    // عرض البيانات بواسطة ConversationList
                    return SingleChildScrollView(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: snapshot.data?.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ConversationScreen(
                                    userId: snapshot.data![index].id!,
                                    userName: snapshot.data![index].name!,
                                    userImage: snapshot.data![index].avatar!,

                                    //  chat: chatsMap[users[index]],
                                  ),
                                )),
                            child: ConversationItem(
                              photo: snapshot.data?[index].avatar ?? '',
                              username: snapshot.data?[index].name ?? '',
                              lastMessage: '',
                              lastTime: snapshot.data?[index].createdAt ?? '',
                              onDeleted: (context) {
                                debugPrint("deleted");
                                // AuthenticationService.currentUser!.chats!
                                //     .removeWhere((element) => element.id == users[index].id);
                                // DataService.updateChats(AuthenticationService.currentUser!);
                                // DataService.updateChats(chatsMap[index]!);
                              },
                            ),
                          );
                        },
                      ),
                    );
                  }
                },
              )

              // StreamBuilder<List<User>>(
              //     stream: Stream.periodic(const Duration(seconds: 3))
              //         .asyncMap((_) => api.getChats()),
              //     builder: (context, snapshot) {
              //       return FutureBuilder<Map<User, Chat>>(
              //         future: initChats(
              //             snapshot.data != null ? snapshot.data! : []),
              //         builder: (context, snapshot1) {
              //           print('ssnapshot data : ${snapshot.data}');
              //           if (snapshot.connectionState !=
              //                   ConnectionState.waiting &&
              //               snapshot1.connectionState !=
              //                   ConnectionState.waiting) {
              //             chatsMap = snapshot1.data ?? {};
              //             users = snapshot.data ?? [];
              //           }
              //           return Expanded(
              //             child: ((snapshot.connectionState ==
              //                             ConnectionState.waiting ||
              //                         snapshot1.connectionState ==
              //                             ConnectionState.waiting) &&
              //                     chatsMap.isEmpty &&
              //                     users.isEmpty)
              //                 ? Center(
              //                     child: CircularProgressIndicator(
              //                       color: Res.kPrimaryColor,
              //                     ),
              //                   )
              //                 : chatsMap.isEmpty
              //                     ? const Center(
              //                         child: Text("No available Chats"),
              //                       )
              //                     : SingleChildScrollView(
              //                         physics: const BouncingScrollPhysics(),
              //                         scrollDirection: Axis.vertical,
              //                         child: ConversationList(users, chatsMap),
              //                       ),
              //           );
              //         },
              //       );
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}
