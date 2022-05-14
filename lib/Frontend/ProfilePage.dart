import 'package:flutter/material.dart';
import 'package:next_game/Backend/myEnums.dart';
import 'package:next_game/Frontend/widgets/ButtonWidget.dart';
import 'package:next_game/Frontend/widgets/ProfileWidget.dart';
import 'package:next_game/Frontend/widgets/numWidgets.dart';

import '../Backend/models/gamer.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  Gamer _gamer = Gamer(id: "id", gamerName: "Alberto Fecchi", age: 28, categories: [CategoryEnum.sport, CategoryEnum.strategy], platforms: [PlatformEnum.Android, PlatformEnum.Windows]);

  List<String> games = ["RESIDENT EVIL-assets/images/r_v.jpg", "FIFA 22-assets/images/fifa22.jpg", "Assassin's Creed Valhalla-assets/images/téléchargement.jpg"];
  List<String> subsPlans = ["Xbox Game Pass", "Steam"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.videogame_asset, color: Colors.blue,),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue,),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            onClicked: () async {},
          ),
          const SizedBox(height: 24),
          buildName(_gamer),
          const SizedBox(height: 24),
          Center(child: buildUpgradeButton()),
          const SizedBox(height: 24),
          NumbersWidget(),
          const SizedBox(height: 48),
          buildGamesSection(_gamer),
        ],
      ),
    );
  }

  Widget buildName(Gamer gamer) => Column(
    children: [
      Text(
        gamer.gamerName,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      const SizedBox(height: 4),
      Text(
        "next Game? by TERRA",
        style: TextStyle(color: Colors.grey),
      )
    ],
  );

  Widget buildUpgradeButton() => ButtonWidget(
    text: 'What is TERRA?',
    onClicked: () {},
  );

  List<String> _tabs = ['My Games', 'Subscription Plans'];
  TextStyle titleStyle = const TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: Colors.black87
  );
  
  Widget buildGamesSection(Gamer gamer) => Container(
    padding: EdgeInsets.symmetric(horizontal: 48),
    child: Column(
      children: [
        Text(
          "My Games",
          style: titleStyle ,
        ),
        SizedBox(height: 12,),
        Column(
          children: games.map((e) {
            return GameTile(e);
          }).toList(),
        ),
        SizedBox(height: 18,),
        Text(
          "My Subscription Plans",
          style: titleStyle ,
        ),
        SizedBox(height: 12,),
        Column(
          children: subsPlans.map((e) {
            return ListTile(
              onTap: (){

              },
              trailing: Icon(Icons.remove_circle_outline, color: Colors.red,),
              title: Text(e),
            );
          }).toList(),
        )
      ],
    ),
  );
  Widget GameTile(String game){
    String name = game.split("-")[0];
    String img = game.split("-")[1];
    return Column(
      children: [
        ListTile(
          onTap: (){

          },
          title: Text(
            name,
          ),
          // trailing: CircleAvatar(
          //   radius: 50,
          //   backgroundImage: AssetImage(img),
          // ),
          trailing: Container(
            height: 50,

            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(8)),
              child: Image.asset(img),
            ),
          ),
        ),
        Divider()
      ],
    );
  }
}