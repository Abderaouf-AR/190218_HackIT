import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:next_game/Utils/theme_data.dart';

class RecomPage extends StatelessWidget {
  const RecomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: Container(
            child: Image.asset("assets/logo/ng.png"), width: 250,),
          centerTitle: true,
        ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "We recommand for you:",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                ),
              ),
              SizedBox(height: 18,),
              ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                child: Image.asset("assets/images/r_v.jpg"),
              ),
              SizedBox(height: 12,),
              Text(
                "RESIDENT EVIL",
                style: TextStyle(
                    fontSize: 25,
                    color: mainColor,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: (){
          Get.back();
        },
        child: Text("Done !", style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold
        ),),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
