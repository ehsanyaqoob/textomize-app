
import 'package:textomize/core/exports.dart';

import 'chat_controller.dart';

class ChatView extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackgroundColor,
      appBar: CustomAppBar(
        title: "Chat",
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.scaffoldBackgroundColor,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_accessibility_rounded, color: AppColors.white),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Chat messages list
          Expanded(
            child: Obx(() {
              return ListView.builder(
                padding: const EdgeInsets.all(8.0),
                itemCount: chatController.messages.length,
                itemBuilder: (context, index) {
                  final message = chatController.messages[index];
                  final isSentByUser = message.isSentByUser;

                  return Align(
                    alignment: isSentByUser
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * 0.75,
                      ),
                      decoration: BoxDecoration(
                        color: isSentByUser
                            ?  AppColors.primaryColor
                            :AppColors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                          bottomLeft: Radius.circular(isSentByUser ? 12 : 0),
                          bottomRight: Radius.circular(isSentByUser ? 0 : 12),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color:AppColors.primaryColor.withOpacity(0.1),
                            blurRadius: 5,
                            offset: const Offset(2, 2),
                          ),
                        ],
                      ),
                      child: simplifyText(
                       text:  message.message,
                     
                          fontSize: 16,
                          color: isSentByUser ? AppColors.primaryColor :AppColors.primaryColor,
                        
                      ),
                    ),
                  );
                },
              );
            }),
          ),

          // Message input
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: AppColors.primaryColor,
            child: Row(
              children: [
                Expanded(
                  child: SimplifyTextFormField(
                    controller: _controller,
                   
                      hint: "Type a message...",
                    
                     
                      
                    ),
                  ),
      
                const SizedBox(width: 8),
                GestureDetector(
                  onTap: () {
                    chatController.sendMessage(_controller.text);
                    _controller.clear();
                  },
                  child: CircleAvatar(
                    backgroundColor: Colors.deepPurple,
                    radius: 25,
                    child: const Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
