import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
      theme: ThemeData(
        // brightness: Brightness.dark,
        primarySwatch: Colors.green,
        fontFamily: 'Gerogia',
      ),
    );
  }
}
class MainPage extends StatefulWidget {
  MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final controller0 = TextEditingController();
  String fact = "";
  
  void getInfo() async {  
    int num = int.parse(controller0.text);
    String url = "http://numbersapi.com/$num";
    final response = await http.get(Uri.parse(url));
    setState(() {
      fact = response.body;
    });
  }

  void random() async {  
    String url = "http://numbersapi.com/random/trivia";
    final response = await http.get(Uri.parse(url));
    setState(() {
      fact = response.body;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
          'Number Trivia',
          style: GoogleFonts.vollkorn(
            fontSize: 30,
            textStyle: const TextStyle(color: Colors.black),
          ), 
          ),
          ),
        
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    'Enter a Number: ',
                    style: GoogleFonts.oswald(
                      fontSize: 20.0,
                    ), 
                  ), //Chang font style and characteristics
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: controller0,
                    cursorColor: Colors.black,
                    cursorHeight: 30.0,
                    style: GoogleFonts.oswald(
                      fontSize: 20.0
                    ),
                  ),
                  const SizedBox(height: 20.0,),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      OutlinedButton(
                        onPressed: (){
                          getInfo();
                        }, 
                        child: Text(
                        "Submit",
                        style: GoogleFonts.luxuriousScript(
                          fontSize: 35,
                          color: Colors.indigo.shade700,
                        ),
                        ),
                      ),
                      const SizedBox(width: 20.0,),
                      OutlinedButton(
                        onPressed: (){
                          random();
                        }, 
                        child: Text(
                          "Random",
                          style: GoogleFonts.luxuriousScript(
                          fontSize: 35,
                          color: Colors.indigo.shade700,
                          )
                        )
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0,),
                  Text(
                    fact,
                    style: GoogleFonts.cinzel(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                    ),
                  )
                ],
              ),
            ),
      ),
    );
  }
}