import 'package:flutter/material.dart';
import 'package:saiful_kamil_mobile_developer_intern_2023/secondPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'color.dart';

class firtPage extends StatefulWidget {
  @override
  State<firtPage> createState() => _firtPageState();
}

class _firtPageState extends State<firtPage> {
  final TextEditingController namaC = TextEditingController();

  String inputTextPolin = '';
  String result = '';
  bool validasiPolin(String text) {
    String cleanText =
        text.replaceAll(RegExp(r'[^a-zA-Z0-9]'), '').toLowerCase();
    String reversedText = cleanText.split('').reversed.join('');
    return cleanText == reversedText;
  }

  void cekpolin() {
    setState(() {
      result = validasiPolin(inputTextPolin) ? 'Palindrome' : 'Not Palindrome';
    });
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              content: Text(result),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12))),
                      elevation: MaterialStateProperty.all(4),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(ColorGreenMain)),
                  child: const Text(
                    "OK",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ));
  }

  Future<void> simpandata(data) async {
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
    return Container(
      constraints: const BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/Image/backgroud.png'),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20, bottom: 30),
          child: ListView(
            children: [
              SizedBox(
                height: 120,
              ),
              CircleAvatar(
                radius: 65,
                child: Icon(
                  Icons.person_add_alt_1,
                  size: 40,
                  color: Colors.white,
                ),
                backgroundColor: Color.fromARGB(132, 255, 255, 255),
              ),
              SizedBox(
                height: 70,
              ),
              TextFormField(
                controller: namaC,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Name",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    inputTextPolin = value;
                  });
                },
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: "Palindrome",
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20.0),
                    hintStyle: const TextStyle(
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(12)),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              SizedBox(
                height: 40,
              ),
              ElevatedButton(
                onPressed: () {
                  cekpolin();
                  print(result);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorGreenMain)),
                child: const Text(
                  "CHECK",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  simpandata(namaC.text);
                },
                style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12))),
                    elevation: MaterialStateProperty.all(4),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(ColorGreenMain)),
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
