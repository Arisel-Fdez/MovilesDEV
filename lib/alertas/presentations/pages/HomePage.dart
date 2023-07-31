import 'package:flutter/material.dart';
import 'package:flutter_application_1/chat/presentations/block/chat.bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../users/presentations/block/login_bloc.dart';
import '../../../chat/presentations/pages/chat.dart';
import '../../../users/presentations/pages/ListaUsuarioScreen.dart';
import 'package:provider/provider.dart';
import '../block/alarm_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mi aplicación')),
      body: Column(
        children: [
          Container(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.security,
                          color: Colors.blue,
                          size: 30,
                        ),
                        SizedBox(width: 5),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Colonia',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Seguro',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Tuxtla chiapas',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              'Gutierrez',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: 5),
                        const Icon(
                          Icons.location_on,
                          color: Colors.red,
                          size: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => ListaUsuarioScreen(),
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 120.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.person_pin,
                          color: Colors.blue,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'vecinos',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 120.0,
                  height: 150.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.local_hospital,
                        color: Colors.blue,
                        size: 30,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        'Emergencia',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(10.0),
                  width: 370.0,
                  height: 320.0,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        child: GestureDetector(
                          onTap: () async {
                            var headersList = {
                              'Accept': '*/*',
                              'User-Agent': 'Thunder Client (https://www.thunderclient.com)',
                              'Content-Type': 'application/json' 
                            };
                            var url = Uri.parse('http://10.11.1.100:8000/alarma');

                            var body = {
                              "email": "yeremi583@gmail.com",
                              "password": "teamopython"
                            };

                            var response = await http.post(url, headers: headersList, body: json.encode(body));

                            if (response.statusCode >= 200 && response.statusCode < 300) {
                              print(response.body);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Alarma Activada'),
                                  content: Text('La alarma ha sido activada.'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              print(response.reasonPhrase);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text('Error'),
                                  content: Text('Hubo un error: ${response.reasonPhrase}'),
                                  actions: <Widget>[
                                    TextButton(
                                      child: Text('Ok'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                ),
                              );
                            }
                          },
                          child: Container(
                            width: 160.0,
                            height: 160.0,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 0, 34),
                              borderRadius: BorderRadius.circular(40),
                            ),
                            child: const Icon(
                              Icons.notifications,
                              color: Colors.white,
                              size: 100,
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        top: 20,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, top: 30),
                          child: Text(
                            'Send Emergency',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Align(
                          alignment: Alignment.center,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => Provider<ChatBloc>(
                                    create: (context) => ChatBloc(),
                                    child: ChatScreen(),
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              padding: const EdgeInsets.symmetric(
                                vertical: 12,
                                horizontal: 20,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: const Text(
                              'Chat',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
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
