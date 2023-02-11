import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scholar_chat/constants.dart';
import 'package:scholar_chat/widgets/chat_buble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/message.dart';
import 'cubits/chat_cubit/chat_cubit.dart';

class ChatPage extends StatelessWidget {
  final _controller = ScrollController();
  ChatPage({Key? key, required this.email}) : super(key: key);
  final email;
  List<Message> messagesList = [];
  CollectionReference messages =
      FirebaseFirestore.instance.collection(kMessegeCollection);
  TextEditingController messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: kPrimaryColor,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  kLogo,
                  height: 55,
                ),
                Text('chat')
              ],
            )),
        body: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listener: (context, state) {
                  if (state is ChatSuccess) {
                    messagesList = state.messagesList;
                  }
                },
                builder: (context, state) {
                  return ListView.builder(
                      reverse: true,
                      controller: _controller,
                      itemCount: messagesList.length,
                      itemBuilder: (context, index) {
                        if (messagesList[index].email == email) {
                          return ChatBuble(
                            message: messagesList[index],
                          );
                        } else {
                          return ChatBubleForFriend(
                            message: messagesList[index],
                          );
                        }
                      });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: messageController,
                onSubmitted: (value) {
                  BlocProvider.of<ChatCubit>(context)
                      .sendMessage(message: value, email: email);
                  messageController.clear();
                  _controller.animateTo(0,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn);
                },
                decoration: InputDecoration(
                  hintText: 'Message',
                  suffixIcon: const Icon(
                    Icons.send,
                    color: kPrimaryColor,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> sendMessage(String data) {
    // Call the message's CollectionReference to add a new message
    return messages.add({
      kMessage: data,
      kCreatedAt: DateTime.now(),
      'id': email,
    });
  }
}
