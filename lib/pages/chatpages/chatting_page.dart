//
//
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:mbbschats/widgets/custom_textfield_decoration.dart';
// import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
//
// class ChattingPage extends StatefulWidget {
//   const ChattingPage({super.key});
//
//   @override
//   State<ChattingPage> createState() => _ChattingPageState();
// }
//
// class _ChattingPageState extends State<ChattingPage> {
//
//   FocusNode _focusNode = FocusNode();
//
//   final TextEditingController _messageController = TextEditingController();
//   final List<Map<String, dynamic>> _messages = [
//     {'text': 'Hello, how are you?', 'sender': 'other', 'time': DateTime.now(), 'seen': true},
//     {'text': 'I am good, thanks! How about you?', 'sender': 'user', 'time': DateTime.now(), 'seen': false},
//     {'text': 'I am good', 'sender': 'other', 'time': DateTime.now(), 'seen': true},
//   ];
//   final ScrollController _scrollController = ScrollController();
//   bool _showEmojiPicker = false;
//
//   void _sendMessage() {
//     String message = _messageController.text;
//     if (message.isNotEmpty) {
//       setState(() {
//         _messages.add({
//           'text': message,
//           'sender': 'user',
//           'time': DateTime.now(),
//           'seen': false,
//         });
//         _messageController.clear();
//         _showEmojiPicker = false; // Hide emoji picker after sending message
//         Future.delayed(Duration(milliseconds: 100), () {
//           if (_scrollController.position.maxScrollExtent !=
//               _scrollController.position.minScrollExtent) {
//             _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
//           }
//         });
//       });
//     }
//   }
//
//   Widget _buildMessage(String message, String sender, DateTime time, bool seen) {
//     bool isUser = sender == 'user';
//     return Align(
//       alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
//       child: Container(
//         margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
//         padding: EdgeInsets.all(10.0),
//         constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
//         decoration: BoxDecoration(
//           color: isUser ? Colors.white : Color.fromRGBO(192, 225, 247, 1),
//           borderRadius: BorderRadius.only(
//             topRight: isUser ? Radius.zero : Radius.circular(20),
//             topLeft: isUser ? Radius.circular(20) : Radius.circular(20),
//             bottomRight: isUser ? Radius.circular(20) : Radius.circular(20),
//             bottomLeft: isUser ? Radius.circular(20) : Radius.zero,
//           ),
//           boxShadow: [
//             BoxShadow(
//               color: Colors.black.withOpacity(0.2),
//               blurRadius: 4.0,
//               offset: Offset(0, 2),
//             ),
//           ],
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Text(
//               message,
//               style: TextStyle(
//                 fontSize: 16,
//                 color: Colors.grey.shade700,
//               ),
//             ),
//             SizedBox(height: 4.0),
//             if (isUser)
//               Icon(
//                 seen ? Icons.check_circle : Icons.check_circle_outline,
//                 size: 16,
//                 color: seen ? Colors.blue : Colors.grey,
//               ),
//             Text(
//               DateFormat('hh:mm a').format(time),
//               style: TextStyle(
//                 fontSize: 12,
//                 color: Colors.grey.shade500,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.blue,
//         title: Row(
//           children: [
//             Container(
//               width: 40,
//               height: 40,
//               child: Image.asset('assets/img.png'),
//             ),
//             SizedBox(width: 10),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   'Akshat Thakur',
//                   style: TextStyle(fontSize: 18, color: Colors.black),
//                 ),
//                 Text(
//                   'Akshatthakur@gmail.com',
//                   style: TextStyle(color: Colors.grey, fontSize: 14),
//                 ),
//               ],
//             ),
//           ],
//         ),
//         actions: [
//           Icon(Icons.menu),
//           SizedBox(width: 25),
//         ],
//       ),
//       backgroundColor: Colors.white,
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             colors: [
//               Color(0x77115C8E), Color(0x66F4829D)
//             ],
//             begin: Alignment.topLeft,
//             end: Alignment.bottomRight,
//           ),
//         ),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView.builder(
//                 controller: _scrollController,
//                 reverse: true,
//                 padding: EdgeInsets.all(8.0),
//                 itemCount: _messages.length,
//                 itemBuilder: (context, index) {
//                   var rev = _messages.reversed.toList();
//                   var messageData = rev[index];
//                   return _buildMessage(
//                     messageData['text']!,
//                     messageData['sender']!,
//                     messageData['time']!,
//                     messageData['seen']!,
//                   );
//                 },
//               ),
//             ),
//             if (_showEmojiPicker)
//               EmojiPicker(
//                 config: Config(
//                   swapCategoryAndBottomBar: true,
//                   categoryViewConfig: CategoryViewConfig(
//                     backgroundColor: Colors.white,
//                   ),
//                   bottomActionBarConfig: BottomActionBarConfig(
//                     buttonColor: Colors.white,
//                     enabled: true,
//                     buttonIconColor: Colors.grey,
//                     backgroundColor: Colors.white,
//                   ),
//                   searchViewConfig: SearchViewConfig(
//                     backgroundColor: Colors.white,
//                   ),
//                   emojiViewConfig: EmojiViewConfig(
//                     backgroundColor: Colors.white,
//                   ),
//                 ),
//                 onEmojiSelected: (category, emoji) {
//                   _messageController
//                     ..text += emoji.emoji
//                     ..selection = TextSelection.fromPosition(
//                       TextPosition(offset: _messageController.text.length),
//                     );
//                 },
//               ),
//             Row(
//               children: [
//                 Expanded(
//                   child: Container(
//                     padding: EdgeInsets.symmetric(horizontal: 15),
//                     width: double.infinity,
//                     color: Colors.white,
//                     child: Row(
//                       children: [
//                         Expanded(
//                           child: CustomTextFieldDecoration(
//                             controller: _messageController,
//                             onSendMessage: _sendMessage,
//                           ),
//                         ),
//                         IconButton(
//                           icon: Icon(
//                             _showEmojiPicker ? Icons.keyboard : Icons.emoji_emotions_outlined,
//                             color: Color.fromRGBO(17, 92, 142, 1),
//                           ),
//                           onPressed: () {
//                             setState(() {
//                               if (_showEmojiPicker) {
//                                 _focusNode.requestFocus();
//                                 _showEmojiPicker = false;
//                               } else {
//                                 _focusNode.unfocus();
//                                 _showEmojiPicker = true;
//                               }
//                             });
//                           },
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: Icon(
//                             Icons.add,
//                             color: Color.fromRGBO(17, 92, 142, 1),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mbbschats/widgets/custom_textfield_decoration.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:file_picker/file_picker.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({super.key});

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  final FocusNode _focusNode = FocusNode();
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [
    {'text': 'Hello, how are you?', 'sender': 'other', 'time': DateTime.now(), 'seen': true},
    {'text': 'I am good, thanks! How about you?', 'sender': 'user', 'time': DateTime.now(), 'seen': false},
    {'text': 'I am good', 'sender': 'other', 'time': DateTime.now(), 'seen': true},
  ];
  final ScrollController _scrollController = ScrollController();
  bool _showEmojiPicker = false;

  void _sendMessage() {
    String message = _messageController.text;
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          'text': message,
          'sender': 'user',
          'time': DateTime.now(),
          'seen': false,
        });
        _messageController.clear();
        _showEmojiPicker = false; // Hide emoji picker after sending message
        Future.delayed(Duration(milliseconds: 100), () {
          if (_scrollController.position.maxScrollExtent !=
              _scrollController.position.minScrollExtent) {
            _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
          }
        });
      });
    }
  }

  Future<void> _selectAndSendFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        String filePath = result.files.single.path!;
        setState(() {
          _messages.add({
            'text': '',
            'image': filePath,
            'sender': 'user',
            'time': DateTime.now(),
            'seen': false,
          });
        });
      }
    } catch (e) {
      print("Error picking file: $e");
    }
  }

  Widget _buildMessage(Map<String, dynamic> messageData) {
    String message = messageData['text'] ?? '';
    String imagePath = messageData['image'] ?? '';
    String sender = messageData['sender'];
    DateTime time = messageData['time'];
    bool seen = messageData['seen'];
    bool isUser = sender == 'user';

    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: EdgeInsets.all(10.0),
        constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
        decoration: BoxDecoration(
          color: isUser ? Colors.white : Color.fromRGBO(192, 225, 247, 1),
          borderRadius: BorderRadius.only(
            topRight: isUser ? Radius.zero : Radius.circular(20),
            topLeft: isUser ? Radius.circular(20) : Radius.circular(20),
            bottomRight: isUser ? Radius.circular(20) : Radius.circular(20),
            bottomLeft: isUser ? Radius.circular(20) : Radius.zero,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 4.0,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (message.isNotEmpty)
              Text(
                message,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            if (imagePath.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.file(

                    File(imagePath),

                    fit: BoxFit.cover,
                  ),
                ),
              ),
            SizedBox(height: 4.0),
            if (isUser)
              Icon(
                seen ? Icons.check_circle : Icons.check_circle_outline,
                size: 16,
                color: seen ? Colors.blue : Colors.grey,
              ),
            Text(
              DateFormat('hh:mm a').format(time),
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.blue,
        title: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              child: Image.asset('assets/img.png'),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Akshat Thakur',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
                Text(
                  'Akshatthakur@gmail.com',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.menu),
          SizedBox(width: 25),
        ],
      ),
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0x77115C8E), Color(0x66F4829D)
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController,
                reverse: true,
                padding: EdgeInsets.all(8.0),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  var rev = _messages.reversed.toList();
                  var messageData = rev[index];
                  return _buildMessage(messageData);
                },
              ),
            ),
            if (_showEmojiPicker)
              EmojiPicker(
                config: Config(
                  swapCategoryAndBottomBar: true,
                  categoryViewConfig: CategoryViewConfig(
                    backgroundColor: Colors.white,
                  ),
                  bottomActionBarConfig: BottomActionBarConfig(
                    buttonColor: Colors.white,
                    enabled: true,
                    buttonIconColor: Colors.grey,
                    backgroundColor: Colors.white,
                  ),
                  searchViewConfig: SearchViewConfig(
                    backgroundColor: Colors.white,
                  ),
                  emojiViewConfig: EmojiViewConfig(
                    backgroundColor: Colors.white,
                  ),
                ),
                onEmojiSelected: (category, emoji) {
                  _messageController
                    ..text += emoji.emoji
                    ..selection = TextSelection.fromPosition(
                      TextPosition(offset: _messageController.text.length),
                    );
                },
              ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: [
                        Expanded(
                          child: CustomTextFieldDecoration(
                            controller: _messageController,
                            onSendMessage: _sendMessage,
                          ),
                        ),
                        IconButton(
                          icon: Icon(
                            _showEmojiPicker ? Icons.keyboard : Icons.emoji_emotions_outlined,
                            color: Colors.grey,
                          ),
                          onPressed: () {
                            setState(() {
                              if (_showEmojiPicker) {
                                _focusNode.requestFocus();
                                _showEmojiPicker = false;
                              } else {
                                _focusNode.unfocus();
                                _showEmojiPicker = true;
                              }
                            });
                          },
                        ),
                        IconButton(
                          onPressed: _selectAndSendFile,
                          icon: Icon(
                            Icons.add,
                            color: Color.fromRGBO(17, 92, 142, 1),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
