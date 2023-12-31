import 'package:flutter/material.dart';
import 'package:app_login/pelis.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: const Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Card(
              margin: EdgeInsets.all(8),
              color: Color.fromARGB(255, 10, 96, 243),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Bienvenido Usuario',
                        style: TextStyle(fontSize: 30, color: Colors.white)),
                    SizedBox(
                      width: 20,
                    ),
                    Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 40,
                    )
                  ],
                ),
              ))
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) =>  Pelis(),
              ));
        },
      ),
    );
  }
}
