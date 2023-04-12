import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // nampilin login page
    );
  }
}

//login page dengan tombol untuk nampilin data di page selanjutanya
class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Username',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
                onSaved: (value) {
                  _username = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    //fungsi push untuk berpindah page dan juga mengirim data berupa username inputan
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WelcomePage(username: _username),
                      ),
                    );
                  }
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// page untuk menerima data dari login page yaitu berupa username
class WelcomePage extends StatelessWidget {
  final String username;

  WelcomePage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome Page'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //text untuk menerima atau menampilkan data yang sudah dikirimkan dari page login diawal
          Text('Welcome, $username!'),
          //tombol untuk navigator tanpa mengembalikan data dan berpindah page
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecondPage()),
              );
            },
            child: Text('Go to Second Page'),
          ),
        ],
      )),
    );
  }
}

//page dimana tujuan darii tombol pindah page tanpa pengembalian data
class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Center(
        child: Text('This is the second page'),
      ),
    );
  }
}
