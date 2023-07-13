import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:saiful_kamil_mobile_developer_intern_2023/secondPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class thirdPage extends StatefulWidget {
  @override
  State<thirdPage> createState() => _thirdPageState();
}

class _thirdPageState extends State<thirdPage> {
  List<dynamic> Listuser = [];
  var nama;

  Future<void> getUser() async {
    Uri url = Uri.parse("https://reqres.in/api/users?page=1&per_page=10");

    try {
      final response = await http.get(url);
      var data = json.decode(response.body) as Map<String, dynamic>;

      Listuser = data["data"] as List<dynamic>;
    } catch (err) {
      print(" Kenapa ${err}");
      // return List<Project>.empty();
    }
  }

  Future<void> refreh() async {
    print("dijalankan");
    Uri url = Uri.parse("https://reqres.in/api/users?page=1&per_page=10");

    try {
      final response = await http.get(url);
      var data = json.decode(response.body) as Map<String, dynamic>;

      Listuser = data["data"] as List<dynamic>;
    } catch (err) {
      print(" Kenapa ${err}");
      // return List<Project>.empty();
    }
  }

  Future<void> simpandata(data) async {
    print("dijalankan");
    final SharedPreferences datasave = await SharedPreferences.getInstance();

    try {
      await datasave.setString('nama', data);
      print(data);

      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => secondpage()));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Center(
            child: Text(
              "Third Screen",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              )),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0),
          child: RefreshIndicator(
            onRefresh: refreh,
            child: FutureBuilder(
                future: getUser(),
                builder: (context, snaphot) {
                  if (snaphot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snaphot.hasError) {
                    return Center(
                      child: Text("Error occurred while fetching data"),
                    );
                  } else if (Listuser.isEmpty) {
                    return Center(
                      child: Text("Data is empty",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                             )),
                    );
                  } else {
                    return ListView.builder(
                      itemCount: Listuser.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 25.0, right: 25, bottom: 20),
                          child: Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                simpandata(Listuser[index]["first_name"] +
                                    " " +
                                    Listuser[index]["last_name"]);
                              },
                              child: Container(
                                child: Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                          "${Listuser[index]["avatar"]}"),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 15.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Listuser[index]["first_name"] == null
                                              ? Text("data is empty")
                                              : Text(
                                                  "${Listuser[index]["first_name"]} ${Listuser[index]["last_name"]}"),
                                          SizedBox(
                                            height: 5,
                                          ),
                                          Text("${Listuser[index]["email"]} "),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          ),
        ));
  }
}
