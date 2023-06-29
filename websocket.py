import asyncio
import websockets

# List to store connected clients
connected_clients = []

# Function to handle incoming messages
async def handle_message(message, client):
    # Process the received message as needed
    # In this example, we'll simply broadcast the message to all connected clients
    for connected_client in connected_clients:
        await connected_client.send(message)

# WebSocket connection handler
async def handle_websocket(websocket, path):
    # Add the client to the list of connected clients
    connected_clients.append(websocket)

    try:
        # Listen for incoming messages from the client
        async for message in websocket:
            await handle_message(message, websocket)
    finally:
        # Remove the client from the list when the connection is closed
        connected_clients.remove(websocket)

# Start the WebSocket server
start_server = websockets.serve(handle_websocket, "0.0.0.0", 3000)

# Run the event loop
asyncio.get_event_loop().run_until_complete(start_server)
asyncio.get_event_loop().run_forever()