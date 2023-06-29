# Chatting App with WebSocket in Flutter

A simple group chat application without a history of old chats. Sends all users in local network the messages. Works like a broadcast of messages on a port which broadcasts each sent messages to every receiver. It uses streams to display the messages to everyone joined in the group.

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

2. Add your computer's IP address in the Flutter Code in the file *my_socket_app/lib/utils/constants.dart*
`static const String serverComputerIpAddress = "your_ip_here";`

3. Run the application on one or more devices (Android/IOS) connected with the same network

4. Enjoy chatting with full privacy without the need of internet connection
