import asyncio
import websockets

async def connect_to_server():
    uri = "ws://localhost:3000"
    async with websockets.connect(uri) as websocket:
        while True:
            message = input("Enter a message: ")
            await websocket.send(message)
            print(f"Sent message: {message}")

            response = await websocket.recv()
            print(f"Received message: {response}")

asyncio.run(connect_to_server())