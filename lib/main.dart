import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_tts/flutter_tts.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Matching Game",
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  List<ItemModel>items1;
  List<ItemModel>items3;
  List<ItemModel>items2;
  FlutterTts flutterTts=FlutterTts();
  int score;
  bool gameOver;
  String language="en-US";
  double pitch = 1.0;
  String Voice;
  @override
  void initState() {
    super.initState();
    initGame(language);
  }

  initGame(String s1){
    String s2=s1;
    gameOver = false;
    score=0;
    flutterTts.setLanguage(s1);
    if(s2=="en-US"||s2=="en-IN") {
      items1 = [
        ItemModel(icon: FontAwesomeIcons.calender, name: "Atom", value: "Atom"),
        ItemModel(icon: FontAwesomeIcons.dog, name: "dog", value: "dog"),
        ItemModel(icon: FontAwesomeIcons.cat, name: "Cat", value: "Cat"),
        ItemModel(icon: FontAwesomeIcons.birthdayCake, name: "Cake", value: "Cake"),
        ItemModel(icon: FontAwesomeIcons.bus, name: "bus", value: "bus"),
      ];
    }
    else if(s2=="hi-IN")
      {
        items1=[
          ItemModel(icon: FontAwesomeIcons.atom, name: "परमाणु", value: "Atom"),
          ItemModel(icon: FontAwesomeIcons.dog, name: "कुत्ता", value: "dog"),
          ItemModel(icon: FontAwesomeIcons.cat, name: "बिल्ली", value: "Cat"),
          ItemModel(icon: FontAwesomeIcons.birthdayCake, name: "केक", value: "Cake"),
          ItemModel(icon: FontAwesomeIcons.bus, name: "बस", value: "bus"),
        ];
      }
    else if(s2=="ta-IN")
      {
        items1=[
          ItemModel(icon: FontAwesomeIcons.atom, name: "அணு", value: "Atom"),
          ItemModel(icon: FontAwesomeIcons.dog, name: "நாய்", value: "dog"),
          ItemModel(icon: FontAwesomeIcons.cat, name: "பூனை", value: "Cat"),
          ItemModel(icon: FontAwesomeIcons.birthdayCake, name: "கேக்", value: "Cake"),
          ItemModel(icon: FontAwesomeIcons.bus, name: "பேருந்து", value: "bus"),
        ];
      }
    else if(s2=="ml-IN")
      {
        items1=[
          ItemModel(icon: FontAwesomeIcons.atom, name: "ആറ്റം", value: "Atom"),
          ItemModel(icon: FontAwesomeIcons.dog, name: "നായ", value: "dog"),
          ItemModel(icon: FontAwesomeIcons.cat, name: "പൂച്ച", value: "Cat"),
          ItemModel(icon: FontAwesomeIcons.birthdayCake, name: "കേക്ക്", value: "Cake"),
          ItemModel(icon: FontAwesomeIcons.bus, name: "ബസ്", value: "bus"),
        ];
      }
    else if(s2=="kn-IN")
      {
        items1=[
          ItemModel(icon: FontAwesomeIcons.atom, name: "ಪರಮಾಣು", value: "Atom"),
          ItemModel(icon: FontAwesomeIcons.dog, name: "ನಾಯಿ", value: "dog"),
          ItemModel(icon: FontAwesomeIcons.cat, name: "ಬೆಕ್ಕು", value: "Cat"),
          ItemModel(icon: FontAwesomeIcons.birthdayCake, name: "ಕೇಕ್", value: "Cake"),
          ItemModel(icon: FontAwesomeIcons.bus, name: "ಬಸ್", value: "bus"),
        ];
      }
    else
      {
        items1 = [
          ItemModel(icon: FontAwesomeIcons.atom, name: "అణువు", value: "Atom"),
          ItemModel(icon: FontAwesomeIcons.dog, name: "కుక్క", value: "dog"),
          ItemModel(icon: FontAwesomeIcons.cat, name: "పిల్లి", value: "Cat"),
          ItemModel(icon: FontAwesomeIcons.birthdayCake, name: "కేక్", value: "Cake"),
          ItemModel(icon: FontAwesomeIcons.bus, name: "బస్సు", value: "bus"),
        ];
      }
    items2 = List<ItemModel>.from(items1);
    items1.shuffle();
    items2.shuffle();
  }
  _speak(String s)async  {
    await flutterTts.setLanguage(language);
    print(await flutterTts.getLanguages);
    await flutterTts.setPitch(pitch);
    await flutterTts.setVolume(1.0);
    await flutterTts.speak(s);
  }
  @override
  Widget build(BuildContext context) {
    if(items1.length == 0)
      gameOver = true;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Matching Game'),
      ),
      backgroundColor:Colors.yellow,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width * 0.7,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.5,
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('images/t2.png'),
                fit: BoxFit.cover)
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Row(
              children:<Widget>[
                Column(
                    children:<Widget>[
                      Text.rich(TextSpan(
                        children: [
                  TextSpan(text: "Score: ",style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 30.0,)),
                  TextSpan(text: "$score", style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                  ))
                ],
            ),
            ),
            ]
            ),
                Spacer(

                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children:<Widget>[
                    Container(
                      padding: EdgeInsets.all(20.0),
                      child:DropdownButton(
                          value: language,
                          items: [
                            DropdownMenuItem(
                              child: Text("English-US"),
                              value: "en-US",
                            ),
                            DropdownMenuItem(
                              child: Text("English-IND"),
                              value: "en-IN",
                            ),
                            DropdownMenuItem(
                              child: Text("Tamil"),
                              value: "ta-IN",
                            ),
                            DropdownMenuItem(
                              child: Text("Hindi"),
                              value: "hi-IN",
                            ),
                            DropdownMenuItem(
                              child: Text("Malayalam"),
                              value: "ml-IN",
                            ),
                            DropdownMenuItem(
                              child: Text("Telugu"),
                              value: "te-IN",
                            ),
                            DropdownMenuItem(
                              child: Text("Kannada"),
                              value: "kn-IN",
                            ),
                          ],
                          onChanged: (value) {
                            setState(() {
                              language=value;
                              initGame(language);
                            });

                          },
                      ),
                    ),
                  ],
                ),
            ]
            ),
            if(!gameOver)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                      children:<Widget> [
                        Text("Pitch",style: TextStyle(fontWeight: FontWeight.bold,fontSize:25,fontStyle:FontStyle.italic,color: Colors.white),),
                      ]
                  ),
                  Column(
                    children: <Widget>[
                      Slider(
                        value: pitch,
                        onChanged: (newPitch) {
                          setState(() => pitch = newPitch);
                        },
                        min: 0.5,
                        max: 2.0,
                        divisions: 15,
                        label: "Pitch: $pitch",
                        activeColor: Colors.purple,
                        inactiveColor: Colors.white,
                      ),
                    ],
                  )
                ],
              ),
            if(!gameOver)
              Row(
                 children: <Widget>[
                  Column(
                      children: items1.map((item) {
                        return Container(
                          margin: const EdgeInsets.all(4.0),
                          child: Draggable<ItemModel>(
                            data: item,
                            childWhenDragging: Icon(
                              item.icon, color: Colors.grey,size: 60.0,),
                            feedback: Icon(item.icon,color: Colors.red,size: 60,),
                            child: Icon(item.icon, color: Colors.purpleAccent, size:60,),
                          ),
                        );
                      }).toList()
                  ),
                 Spacer(

                 ),
                  Column(
                      children: items2.map((item){
                        //flutterTts.speak(item.name);
                        return DragTarget<ItemModel>(
                          onAccept: (receivedItem){
                            if(item.value== receivedItem.value){
                              setState(() {
                                flutterTts.speak(item.name);
                                items1.remove(receivedItem);
                                items2.remove(item);
                                score+=10;
                                item.accepting =false;
                              });

                            }else{
                              setState(() {
                                score-=5;
                                item.accepting =false;
                              });
                            }
                          },
                          onLeave: (receivedItem){
                            setState(() {
                              item.accepting=false;
                            });
                          },
                          onWillAccept: (receivedItem){
                            setState(() {
                              item.accepting=true;
                            });
                            return true;
                          },
                          builder: (context, acceptedItems,rejectedItem) => Container(
                            color: item.accepting? Colors.yellowAccent:Colors.red,
                            height: 60,
                          alignment: Alignment.center,
                            width: 150,
                           margin: const EdgeInsets.all(4.0),
                            padding: EdgeInsets.all(0.9),
                            /*decoration: BoxDecoration(
                               border: Border.all(
                                 color: Colors.red,
                                 width: 1,
                               )
                            ),*/
                            child: FlatButton(
                              minWidth:148,
                              height: 60,
                              textColor: Colors.white,
                              color:Colors.blue,
                              child:Text(item.name),
                              onPressed:() => _speak(item.name),
                            ),


                          ),);

                      }).toList()

                  ),
                ],
              ),
            if(gameOver)
              Text("GameOver", style: TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),),
            if(gameOver)
              Center(
                child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.pink,
                  child: Text("New Game"),
                  onPressed: ()
                  {
                    initGame(language);
                    setState(() {

                    });
                  },
                ),
              )

          ],
        ),

      ),

    );
  }
}

class ItemModel {
  final String name;
  final String value;
  final IconData icon;
  bool accepting;
  ItemModel({this.name, this.value, this.icon, this.accepting= false});}