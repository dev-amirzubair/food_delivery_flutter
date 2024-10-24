import 'package:flutter/material.dart';
import 'package:food_delivery/app/modules/chat/model/model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:logger/logger.dart';

class ChatScreen extends StatefulWidget {
  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  IO.Socket? socket;

  TextEditingController chatController = TextEditingController();
  List<Chat> chat = [];

  void connectToSocket() {
    // Configure the socket client
    socket = IO.io('https://echo.websocket.org/', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false, // Prevent auto-connection
    });

    // Connect to the socket server
    socket?.connect();

    // Listen for events
    socket?.on('connect', (_) {
      Logger().i('Connected to WebSocket server');
    });

    socket?.on('event', (data) {
      Logger().i('Received event: $data');
    });

    socket?.on('disconnect', (_) {
      Logger().i('Disconnected from WebSocket server');
    });

    // Emit an event to the server
    socket?.emit('custom-event', {'data': 'Hello, server!'});
  }

  @override
  void initState() {
    super.initState();
    Logger().i('initState');
    connectToSocket();
    // socket = IO.io(Uri.parse('uri'));
    // socket.onConnect((_) {
    //   print('connect');
    //   socket.emit('msg', 'test');
    // });
    // socket.on('event', (data) => print(data));
    // socket.onDisconnect((_) => print('disconnect'));
    // socket.on('fromServer', (_) => print(_));
    // // setupListeners();
  }

  @override
  void dispose() {
    Logger().d('Dispose');
    socket?.close();
    super.dispose();
  }

  void setupListeners() {
    try {
      Logger().i('setup Listener');
      socket?.on('connect', (_) => Logger().i('Connected'));
      socket?.on('disconnect', (_) => Logger().e('Disconnected'));
    } catch (error) {
      Logger().d("error: ${error.toString()}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Text('Hello Chat')),
    );
  }
}
