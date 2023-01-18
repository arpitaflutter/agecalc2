import 'package:flutter/material.dart';

void main()
{
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    ),
  );
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController txttodaydate = TextEditingController();
  TextEditingController txtdateofbirth = TextEditingController();

  int calc=0;
  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Age Calculator"),
          backgroundColor: Colors.blue.shade900,
          centerTitle: true,
        ),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Today's Date",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  TextField(
                    controller: txttodaydate,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
                    ),
                  ),
                  SizedBox(height: 15,),
                  Text("Date Of Birth",style: TextStyle(fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        controller: txtdateofbirth,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue,),
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                txttodaydate.text = '';
                                txtdateofbirth.text = '';

                                setState(() {
                                  calc = 0;
                                });
                              },
                              child: Container(
                                height: 50,width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text("Clear",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold))),
                              ),
                            ),
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                            child: InkWell(
                              onTap: () {
                                String tyear = txttodaydate.text;
                                String dyear = txtdateofbirth.text;

                                int a = int.parse(dyear);
                                int b = int.parse(tyear);

                                setState(() {
                                  calc = b-a;
                                });
                                print("Age = $calc");
                              },
                              child: Container(
                                height: 50,width: 100,
                                decoration: BoxDecoration(
                                  color: Colors.blue.shade900,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(child: Text("Calculate",style: TextStyle(color: Colors.white))),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Text("Present age",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold)),
                      SizedBox(height: 10,),
                      Container(
                        height: 100,width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade700,Colors.blue.shade800,Colors.blue.shade900,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Text("$calc",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      ),
                      SizedBox(height: 10,),
                      Text("Next Birthday",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Container(
                        height: 100,width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade300,
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade200,Colors.blue.shade300,Colors.blue.shade400,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}