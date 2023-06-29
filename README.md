# Chatting App with WebSocket in Flutter
A simple group chat application without a history of old chats. Sends all users in wifi the messages. Works like a broadcast of messages on a port which can also be used to send the messages. It uses streams to display the messages to every one joined in the group.

<table>
<tr>
<td>
<img src="https://raw.githubusercontent.com/wrteam-aayush/chat_app_websocket/main/screenshots/login_screen.jpg" alt="Screenshot 1"/>
</td>
<td>
<img src="https://raw.githubusercontent.com/wrteam-aayush/chat_app_websocket/main/screenshots/chat_screen.jpg" alt="Screenshot 2"/>
</td>
</tr>
</table>

# Usage
1. Run the Python code using `python websocket.py` command
2. Add your computer's IP address in the Flutter Code (my_socket_app/lib/screens/GroupChat.dart) line ~25 *_channel = IOWebSocketChannel.connect('ws://{your_ip_here}:3000');*
3. Run the application on one or more devices (Android/IOS) connected with the same network
4. Enjoy chatting with full privacy without the Internet
