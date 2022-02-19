import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    home: FirstHome(),
    routes: {
      '/first': (context) => FirstHome(),
      '/second': (context) => SecondHome(),
    },
  ));
}

class FirstHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("First home"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            User user = User(name: "Mike", age: 23);
            // Route route = MaterialPageRoute(builder: (context) => SecondHome(user: user));
            // Navigator.push(context, route);
            Navigator.pushNamed(context, '/second', arguments: user);
            // Route route = MaterialPageRoute(builder: (context) => Page2());
            // Navigator.pushNamed(context, '/page2');
          },
          child: Text("Second home"),
        ),
      ),
    );
  }
}

class SecondHome extends StatelessWidget {
  User user;

  @override
  Widget build(BuildContext context) {
    RouteSettings? settings = ModalRoute.of(context)?.settings;
    if (settings) {
      user = settings.arguments;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text("Good day, ${user.name} ${user.age}"),
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Route route = MaterialPageRoute(builder: (context) => Page2());
            // Navigator.pushNamed(context, '/page2');
          },
          child: Text("back home"),
        ),
      ),
    );
  }
}

class User {
  final String name;
  final int age;

  User({required this.name, required this.age});
}
