import 'package:flutter/material.dart';
import 'package:saiful_kamil_mobile_developer_intern_2023/thirdPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class secondpage extends StatefulWidget {
  @override
  State<secondpage> createState() => _secondpageState();
}

class _secondpageState extends State<secondpage> {
  String? dataPref;

  @override
  void initState() {
    super.initState();
    lihatdata();
  }

  void lihatdata() async {
    final SharedPreferences dataget = await SharedPreferences.getInstance();

    dataPref = await dataget.getString('nama');
    print(dataPref);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          "Second Screen",
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
          ),
        )),
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
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Welcome"),
                  SizedBox(
                    height: 5,
                  ),
                  Text("${dataPref}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Expanded(
              child: Container(
                child: Center(
                    child: Text(
                  "Selected User ${dataPref}", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                )),
              ),
            ),
            Container(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SizedBox(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => thirdPage()));
                        },
                        style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            elevation: MaterialStateProperty.all(4),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.black)),
                        child: const Text(
                          "Choose a User",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: "poppins",
                              fontWeight: FontWeight.bold),
                        ),
                      ))),
            )
          ],
        ),
      ),
    );
  }
}
