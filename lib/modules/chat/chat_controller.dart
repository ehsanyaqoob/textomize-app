import 'package:get/get.dart';
import 'chat_model.dart';
import 'package:textomize/core/exports.dart';


class ChatController extends GetxController {
  var messages = <ChatMessage>[].obs;

  void sendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add(ChatMessage(message: message, isSentByUser: true));
    }
  }
}
