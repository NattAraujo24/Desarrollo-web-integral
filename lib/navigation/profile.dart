import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundColor: Color.fromARGB(255, 193, 172, 88),
                    child: Text('NA'),
                  ),
                  SizedBox(
                    width: 8.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Natalia Araujo',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                      Text('Conectado hace 10 min',
                          style: TextStyle(fontSize: 12, color: Colors.black54))
                    ],
                  ),
                  Spacer(),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
            Image.asset(
              'assets/logo.png',
              width: double.infinity,
              height: 400,
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.message),
                  Icon(Icons.ios_share_outlined),
                  Spacer(),
                  Icon(Icons.save_alt),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Comentario 1'),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Comentario 2'),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text('Comentario 3'),
            ),
          ],
        ),
      ),
    );
  }
}
