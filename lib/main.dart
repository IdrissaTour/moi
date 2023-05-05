import 'package:flutter/material.dart';
import 'package:idrissa/main_title_text.dart';
import 'package:idrissa/section_title.dart';
import 'poste.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home:BasicPage() ,
    );
  }
}
class BasicPage extends StatelessWidget {
  List<Poste> poste= [
    Poste(name: "Lamine", time: "2 jours", imagePath: "images/mountain.jpg", desc: "joli Montagne"),
    Poste(name: "Hawa", time: "1 semaine", imagePath: "images/work.jpg", desc: "Retour au boulot aprés le confinement"),
    Poste(name: "Lima", time: "5 ans" , imagePath: "images/playa.jpg", desc: "le boulot en remote"),
  ];

  @override
  Widget build(BuildContext context) {
   double width= MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Facebook profile"),

      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset("images/cover.jpg", height: 200, fit: BoxFit.cover),
                Padding(padding: EdgeInsets.only(top: 130),
                  child: CircleAvatar(radius: 70, backgroundColor: Colors.white,
                    child: myProfile(65),
                  ),
                )
              ],
            ),
            Row(
              children: [
                Spacer(),
                    MainTetleText(data: "Idi Toure"),
                Spacer()
              ],
            ),

            Padding(padding: EdgeInsets.all(10),
              child: Text(
                "Un jour les chats domineront le monde mais aujourd'hui c'est l'heure de la sieste",
                style: TextStyle(
                  color: Colors.grey, fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                // Expended : permet d'occuper les places restants
                Expanded(child:  buttomContainer(text:"Modfier le profile"),),

                buttomContainer(icon: Icons.border_color)
              ],
            ),
            Divider(thickness: 2,),
            SectionTitle(text: "A propos de moi"),
            aboutRow(icon: Icons.house, text: "Bamako/ Lafiabougou"),
            aboutRow(icon: Icons.work, text: "Developpeur"),
            aboutRow(icon: Icons.favorite, text: "En couple avec DADO"),
            Divider(thickness: 2,),
            SectionTitle(text: "Mes amis"),
            allFriend(width/3.5),
            Divider(thickness: 2,),
           SectionTitle(text: "Mes Postes"),
            allPost()




          ],

        ),

      ),

    );
  }

  CircleAvatar myProfile(double radius) {
    return CircleAvatar(radius: radius,
      backgroundImage: AssetImage("images/profile.jpg"),
    );
  }

  Container buttomContainer({IconData? icon, String? text}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),

      child: (icon == null)
          ? Center(
          child: Text(text ?? "", style: TextStyle(color: Colors.white),))
          : Icon(icon, color: Colors.white,),
      height: 50,
    );
  }
   
    Widget aboutRow({required IconData icon, required String text }){
    return Row(
      children: [
        Icon(icon),
        Padding(padding: EdgeInsets.all(5),
       child: Text(text),
      )
      ],
    );
}

  Column friendImage(double width, String name, String imagePath){
    return Column(
      children: [
        Container(
          margin:EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(imagePath), fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey)],
            color: Colors.blue
          ),

        ),
        Text(name),
        Padding(padding: EdgeInsets.only(bottom: 5))
      ],

    );
}
Row allFriend(double width){
    Map<String, String> friends = {
      "Flo Mam's": "images/cat.jpg",
      "Byba": "images/sunflower.jpg",
      "Laou": "images/duck.jpg",
      
      
    };
    List<Widget> children=[];
      friends.forEach((name, imagePath) { 
      children.add(friendImage(width, name, imagePath))  ;
      });
      return Row(children: children,);
  
    
}
    Column allPost(){
      List<Widget> PostoAdd = [];
      poste.forEach((element) {
        PostoAdd.add(post(post: element));
      });
      return Column(children: PostoAdd,);
    }
        

        
Container post({ required Poste post }){
    return Container(
      margin: EdgeInsets.only(top: 8, left: 3, right: 3),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
       // color: Color.fromARGB(225, 225, 225, 1)
      ),
      child: Column(
        children: [
          Row(
            children:[
              myProfile(20),
              Padding(
                  padding: EdgeInsets.only(left:8)),
                    Text("Idrissa Toure"),
                  Spacer(),
                  textTime(post.setTime())
             // Specer(), permet de decaler l'ecriture vers  droite
             ,
            ]
          ),
          Padding(padding: EdgeInsets.only(top: 8, bottom: 8),
              child: Image.asset(post.imagePath, fit: BoxFit.cover,),
          ),

          Text(post.desc,style: TextStyle(color: Colors.blueAccent),
            textAlign: TextAlign.center,
          ),
          Padding(padding:EdgeInsets.all(8),
           child: Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  mainAxisSize: MainAxisSize.max ,
  children: [

  Icon(Icons.favorite),
  Text(post.setLike()),
  Icon(Icons.message),


  Text(post.setCommts()),
  Icon(Icons.send),
  Text(post.setPartage())

  ],
  )
          )


          
        ],
      ),
    );

}
  Text textTime(String time){
    return Text("il y'a $time", style: TextStyle(color: Colors.blue),);
  }
}
