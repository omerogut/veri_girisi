import 'package:flutter/material.dart';


import 'graph/bar_graph.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<double> weeklySpend = [
    1,21,3,41,66,55,99,88,
  ];
  int? _secilen =null;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Bar Graph'),
        backgroundColor: Colors.indigoAccent,
      ),
      backgroundColor: Colors.brown[200],
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,

        children: [
          //Center(
          Container(
            margin: EdgeInsets.all(15),
            child: SizedBox(
              height: 300,
              child: MyBarGraph(
                weeklySpend: weeklySpend,
              ),
            ),
          ),

          Container(
            /*child: SizedBox(
              height: 80,
              child: TextFormField(),
            ),*/

            margin: EdgeInsets.all(10),
            width: 300,
            height: 40,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10), // Kenarları yuvarlak yapar
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Metin yazın...',
                    border: InputBorder.none, // Kenarlık olmadan görüntülenir
                  ),
                ),
              ],
            ),
          ),

          Container(
            //margin: EdgeInsets.all(15),
            color: Colors.blue,

            child: SizedBox(
              width: 240,
              height: 40,

              child: DropdownButtonFormField<int>(


                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(width: 2,color: Colors.blue),
                  ),
                ),
                hint: Text('Bar seç'),

                items: [
                  DropdownMenuItem(child: Text('0-32'), value: 1,),
                  DropdownMenuItem(child: Text('33-64'), value: 2,),
                  DropdownMenuItem(child: Text('65-96'), value: 3,),
                  DropdownMenuItem(child: Text('97-128'), value: 4,),
                  DropdownMenuItem(child: Text('129-160'), value: 5,),
                  DropdownMenuItem(child: Text('161-192'), value: 6,),
                  DropdownMenuItem(child: Text('193-224'), value: 7,),
                  DropdownMenuItem(child: Text('225-256'), value: 8,),
                ],
                value: _secilen,
                onChanged: (int? secilen ){
                  setState(() {
                    _secilen = secilen;
                  });
                }
                ,
              ),
            ),
          ),
          Container(
            child: ElevatedButton(
              onPressed: (){}, child: Text('Hesapla'),
            ),
          ),

          //),
        ],
      ),
    );
  }
}
