# Racing Car GUI

This repository contains two projects: a server and a client for Racing GUI Simulation.

## How the Project Works

### Description of the Server

The server represents a car dashboard with a GUI that receives and displays data from the client via the TCP protocol. When the server application is started, the server is created and started automatically, and the GUI is displayed. The server then waits for the client's connection and data.

#### Description of the GUI

The GUI displays seven parameters of car data:
- Car's speed
- Car's gear
- RPM
- Water temperature
- Fuel level
- Oil temperature
- Oil pressure

Each parameter is implemented as a custom component in Qt Creator using the QML framework. Every progress bar is constructed using two rectangles: one acting as the background and the second changing its width to represent the progress bar. When the server receives a new connection and data from the client, a message is displayed in the console.

### Description of the Client

When the client application is started, a gray window appears with "Connect" and "Send Data" buttons. The data values that the client sends to the server are designed to go from minimum to maximum predefined values, simulating the functionality and appearance of the server's GUI. When the client connects and sends data, a message is displayed in the console.

## How to Run

1. **Enter the local IP address**:
   Before launching both applications, enter the local IP address in the client's `main.qml`.

2. **Launch the server and client applications**:
   Start both the server and the client applications.

3. **Connect and send data**:
   On the client's window, press "Connect" and then "Send Data".


