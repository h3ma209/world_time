import "package:flutter/material.dart";

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};

  @override
  Widget build(BuildContext context) {
    // data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map?;
    data = (data?.isNotEmpty ?? false)
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map?;

    // set background
    String bgImage = data!["isDayTime"]
        ? "https://images.pexels.com/photos/70365/forest-sunbeams-trees-sunlight-70365.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        : "https://images.pexels.com/photos/775201/pexels-photo-775201.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1";

    print(data);

    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("Home"),
      // ),

      body: SafeArea(
          child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(bgImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, "/location");
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result["flag"]
                    };
                  });
                },
                icon: const Icon(Icons.edit_location),
                label: const Text("Edit Location"),
              ),
              // ignore: prefer_const_constructors
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(data!["location"],
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      )),
                ],
              ),
              SizedBox(height: 20),
              Text(data!["time"],
                  // ignore: prefer_const_constructors
                  style: TextStyle(
                    fontSize: 66.0,
                  )),
            ],
          ),
        ),
      )),
    );
  }
}
