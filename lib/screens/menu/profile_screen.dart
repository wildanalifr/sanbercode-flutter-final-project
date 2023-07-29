import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
        centerTitle: true,
      ),
      body: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 75,
                backgroundImage: NetworkImage(
                    "https://scontent.fsub8-2.fna.fbcdn.net/v/t1.6435-9/118373897_1148553032207986_8216723991069473424_n.jpg?_nc_cat=104&cb=99be929b-59f725be&ccb=1-7&_nc_sid=09cbfe&_nc_eui2=AeEUKbEAM4MqSPOSl3XAV7X79bRiKBvYGkH1tGIoG9gaQVZ21Hx5Fh30lyKM2Kmi3f5q6WyVj7UPNPzxpfzL5RHm&_nc_ohc=89Pcrv0h54UAX8Y41dJ&_nc_ht=scontent.fsub8-2.fna&oh=00_AfBsiGyXVeNY_7-7XcB5JvekfinL7m3_TcIe-fsJnCveSg&oe=64EC004C"), // Replace with your image URL
              ),
              SizedBox(height: 16),
              Text(
                'Wildan Alif R', // Replace with the user's name
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Software Engineer', // Replace with the user's occupation/title
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              Text(
                'About Me', // Replace with a bio or description
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Hello! I am a software engineer with a passion for mobile app development.', // Replace with the user's bio
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 16),
              ListTile(
                leading: Icon(Icons.email),
                title: Text(
                    'wildanalifrio@gmail.com'), // Replace with the user's email
              ),
              ListTile(
                leading: Icon(Icons.web),
                title: Text(
                    'https://github.com/wildanalifr'), // Replace with the user's website
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
