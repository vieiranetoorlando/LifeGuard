import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:geolocator/geolocator.dart';

class pag2 extends StatefulWidget {
  const pag2({super.key});

  @override
  State<pag2> createState() => _pag2State();
}

//List<String> coordenadas = ["0", "0"];

class _pag2State extends State<pag2> {
  bool liga = false;
  String mensagem = "";

  static final String oneSignalAppId = "3202f18f-80c2-4503-8eea-b305ab0ff10c";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Container(
                height: 500,
                width: double.infinity,
                child: GoogleMap(
                  //onMapCreated: _onMapCreated,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(-23.4245425, -47.363852), zoom: 14.0),
                  markers: {
                    Marker(
                      markerId: const MarkerId("Fit"),
                      position: LatLng(-23.5466700, -47.4377800),
                      // position: LatLng(double.parse(coordenadas[0]), double.parse(coordenadas[1])),
                      draggable: true,
                      onDragEnd: (value) {
                        // value is the new position
                      },
                    ),
                  },
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Status:",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
          Switch(
            value: liga,
            onChanged: ((value) {
              liga = value;
              setState(() {
                conectmqtt();
                //conectmqtt2();
              });
            }),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 239, 150, 34).withOpacity(0.3)),
            height: 50,
            width: 150,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  mensagem,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color.fromARGB(255, 239, 150, 34).withOpacity(0.3)),
            height: 50,
            width: 150,
            child: Center(
              child: Text(
                'Carregando...',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          //Text(msg_coordenadas),
        ],
      ),
    );
  }

  final client = MqttServerClient('test.mosquitto.org', '');

  var pongCount = 0; // Pong counter

  Future<int> conectmqtt() async {
    client.logging(on: true);
    client.setProtocolV311();
    client.keepAlivePeriod = 20;
    client.connectTimeoutPeriod = 2000; // milliseconds
    client.onDisconnected = onDisconnected;
    client.onConnected = onConnected;
    client.onSubscribed = onSubscribed;
    client.pongCallback = pong;

    final connMess = MqttConnectMessage()
        .withClientIdentifier('Mqtt_MyClientUniqueId')
        .withWillTopic(
            'willtopic') // If you set this you must set a will message
        .withWillMessage('My Will message')
        .startClean() // Non persistent session for testing
        .withWillQos(MqttQos.atLeastOnce);
    print('Conectando...');
    client.connectionMessage = connMess;

    try {
      await client.connect();
    } on NoConnectionException catch (e) {
      // Raised by the client when connection fails.
      print('EXAMPLE::client exception - $e');
      client.disconnect();
    } on SocketException catch (e) {
      // Raised by the socket layer
      print('EXAMPLE::socket exception - $e');
      client.disconnect();
    }

    /// Check we are connected
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print('EXAMPLE::Mosquitto client connected');
    } else {
      /// Use status here rather than state if you also want the broker return code.
      print(
          'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client.connectionStatus}');
      client.disconnect();
      exit(-1);
    }

    /// Ok, lets try a subscription
    print('EXAMPLE::Subscribing to the test/lol topic');
    const topic = 'LifeGuard'; // Not a wildcard topic
    client.subscribe(topic, MqttQos.atMostOnce);

    /// The client has a change notifier object(see the Observable class) which we then listen to to get
    /// notifications of published updates to each subscribed topic.
    client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
          MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      mensagem = pt;

      setState(() {});

      print(
          'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pt -->');
      print('');
    });

    client.published!.listen((MqttPublishMessage message) {
      print(
          'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
    });

    const pubTopic = 'Dart/Mqtt_client/testtopic';
    final builder = MqttClientPayloadBuilder();
    builder.addString('Olá!');

    /// Subscribe to it
    print('EXAMPLE::Subscribing to the Dart/Mqtt_client/testtopic topic');
    client.subscribe(pubTopic, MqttQos.exactlyOnce);

    /// Publish it
    print('EXAMPLE::Publishing our topic');
    client.publishMessage(pubTopic, MqttQos.exactlyOnce, builder.payload!);

    print('EXAMPLE::Sleeping....');
    await MqttUtilities.asyncSleep(60);

    /// Finally, unsubscribe and exit gracefully
    print('EXAMPLE::Unsubscribing');
    client.unsubscribe(topic);

    /// Wait for the unsubscribe message from the broker if you wish.
    await MqttUtilities.asyncSleep(2);
    print('EXAMPLE::Disconnecting');
    client.disconnect();
    print('EXAMPLE::Exiting normally');
    return 0;
  }

  /// The subscribed callback
  void onSubscribed(String topic) {
    print('EXAMPLE::Subscription confirmed for topic $topic');
  }

  /// The unsolicited disconnect callback
  void onDisconnected() {
    print('EXAMPLE::OnDisconnected client callback - Client disconnection');
    if (client.connectionStatus!.disconnectionOrigin ==
        MqttDisconnectionOrigin.solicited) {
      print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
    } else {
      print(
          'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
      exit(-1);
    }
    if (pongCount == 3) {
      print('EXAMPLE:: Pong count is correct');
    } else {
      print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount');
    }
  }

  /// The successful connect callback
  void onConnected() {
    print(
        'EXAMPLE::OnConnected client callback - Client connection was successful');
  }

  /// Pong callback
  void pong() {
    print('EXAMPLE::Ping response client callback invoked');
    pongCount++;
  }
}

//variavel 2 :

final client2 = MqttServerClient('test.mosquitto.org', '');

var pongCount2 = 0; // Pong counter
String msg_coordenadas = "";

Future<int> conectmqtt2() async {
  client2.logging(on: true);
  client2.setProtocolV311();
  client2.keepAlivePeriod = 20;
  client2.connectTimeoutPeriod = 2000;
  client2.onDisconnected = onDisconnected;
  client2.onConnected = onConnected;
  // client2.onSubscribed = onSubscribed;
  //client2.pongCallback = pong;

  final connMess2 = MqttConnectMessage()
      .withClientIdentifier('Mqtt_MyClientUniqueId')
      .withWillTopic('willtopic') // If you set this you must set a will message
      .withWillMessage('My Will message')
      .startClean() // Non persistent session for testing
      .withWillQos(MqttQos.atLeastOnce);
  print('EXAMPLE::Mosquitto client connecting....');
  client2.connectionMessage = connMess2;

  try {
    await client2.connect();
  } on NoConnectionException catch (e) {
    // Raised by the client when connection fails.
    print('EXAMPLE::client exception - $e');
    client2.disconnect();
  } on SocketException catch (e) {
    // Raised by the socket layer
    print('EXAMPLE::socket exception - $e');
    client2.disconnect();
  }

  if (client2.connectionStatus!.state == MqttConnectionState.connected) {
    print('EXAMPLE::Mosquitto client connected');
  } else {
    /// Use status here rather than state if you also want the broker return code.
    print(
        'EXAMPLE::ERROR Mosquitto client connection failed - disconnecting, status is ${client2.connectionStatus}');
    client2.disconnect();
    exit(-1);
  }

  print('EXAMPLE::Subscribing to the test/lol topic');
  const topic2 = 'Coordenadas_Life'; // Not a wildcard topic
  client2.subscribe(topic2, MqttQos.atMostOnce);

  client2.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
    final recMess2 = c![0].payload as MqttPublishMessage;
    final pq =
        MqttPublishPayload.bytesToStringAsString(recMess2.payload.message);
    msg_coordenadas = pq;

    print(
        'EXAMPLE::Change notification:: topic is <${c[0].topic}>, payload is <-- $pq -->');
    print('');
  });

  client2.published!.listen((MqttPublishMessage message) {
    print(
        'EXAMPLE::Published notification:: topic is ${message.variableHeader!.topicName}, with Qos ${message.header!.qos}');
  });

  const pubTopic2 = 'Dart/Mqtt_client/testtopic';
  final builder2 = MqttClientPayloadBuilder();
  builder2.addString('Carregando informações...');

  /// Subscribe to it
  print('EXAMPLE::Subscribing to the Dart/Mqtt_client2/testtopic topic');
  client2.subscribe(pubTopic2, MqttQos.exactlyOnce);

  /// Publish it
  print('EXAMPLE::Publishing our topic');
  client2.publishMessage(pubTopic2, MqttQos.exactlyOnce, builder2.payload!);

  await MqttUtilities.asyncSleep(2);
  print('EXAMPLE::Disconnecting');
  client2.disconnect();
  print('EXAMPLE::Exiting normally');
  return 0;
}

/// The subscribed callback
void onSubscribed(String topic2) {
  print('EXAMPLE::Subscription confirmed for topic $topic2');
}

/// The unsolicited disconnect callback
void onDisconnected() {
  print('EXAMPLE::OnDisconnected client callback - Client disconnection');
  if (client2.connectionStatus!.disconnectionOrigin ==
      MqttDisconnectionOrigin.solicited) {
    print('EXAMPLE::OnDisconnected callback is solicited, this is correct');
  } else {
    print(
        'EXAMPLE::OnDisconnected callback is unsolicited or none, this is incorrect - exiting');
    exit(-1);
  }
  if (pongCount2 == 3) {
    print('EXAMPLE:: Pong count is correct');
  } else {
    print('EXAMPLE:: Pong count is incorrect, expected 3. actual $pongCount2');
  }
}

void onConnected() {
  print(
      'EXAMPLE::OnConnected client callback - Client connection was successful');
}

void pong() {
  print('EXAMPLE::Ping response client callback invoked');
  pongCount2++;
}
