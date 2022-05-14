// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../Frontend/HomePage.dart';

class SignInUpPage extends StatefulWidget {
  const SignInUpPage({Key? key}) : super(key: key);

  @override
  _SignInUpPageState createState() => _SignInUpPageState();
}

class _SignInUpPageState extends State<SignInUpPage> {

  bool signInSection = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset("assets/images/back1.jpg"),
        Scaffold(
          // backgroundColor: Colors.transparent,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Image.asset("assets/logo/logo_full_white_trans.png"),
                height: MediaQuery.of(context).size.height/3,
              ),
              (signInSection)
                  ? SignInForm()
                  : SignUpForm(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                      (signInSection) ? "Don't have an account?" : "Alredy registred?", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  ),
                  TextButton(
                      onPressed: (){
                        setState(() {
                          emailController.clear();
                          passwordController.clear();
                          confirmPasswordController.clear();
                          signInSection = !signInSection;
                        });
                      },
                      child: Text((signInSection) ? "Sign Up" : "Sign In", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold))
                  ),

                ],
              ),
              Expanded(child: Container()),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      child: Image.asset("assets/logo/logo_trans.png"),
                    height: 40,
                  ),
                  const SizedBox(width: 4,),
                  const Text("Next Game?", style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),),
                  const SizedBox(width: 4,),
                  const Text("By TERRA", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final signInFormKey = GlobalKey<FormState>();
  Widget SignInForm(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: signInFormKey,
        child: Column(
          children: [
            const Text("Welcome back!", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            const SizedBox(height: 16,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Email"),
            ),
            const SizedBox(height: 8,),
            EmailTextField(),
            const SizedBox(height: 8,),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Password",),
            ),
            const SizedBox(height: 8,),
            PasswordTextField(),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: (){
                  signIn();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: const Text("Sign In", style: TextStyle(fontSize: 18),)),
                )
            ),
          ],
        ),
      ),
    );
  }

  final signUpFormKey = GlobalKey<FormState>();
  Widget SignUpForm(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: signUpFormKey,
        child: Column(
          children: [
            const Text("Register", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
            const SizedBox(height: 24,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Email"),
            ),
            const SizedBox(height: 8,),
            EmailTextField(),
            const SizedBox(height: 8,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Password"),
            ),
            const SizedBox(height: 8,),
            PasswordTextField(),
            const SizedBox(height: 8,),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Confirm password"),
            ),
            const SizedBox(height: 8,),
            ConfirmPasswordTextField(),
            const SizedBox(height: 24,),
            ElevatedButton(
                onPressed: (){
                  signUp();
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(child: const Text("Sign Up", style: TextStyle(fontSize: 18),)),
                )
            ),
          ],
        ),
      ),
    );
  }

  Widget EmailTextField(){
    return TextFormField(
      controller: emailController,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          hintText: "Email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))
        )
      ),
      obscureText: false,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (email){
        email != null // && !EmailValidator.validate(email)
            ? "Enter a valid email"
            : null;
      },
    );
  }
  Widget PasswordTextField(){
    return TextFormField(
      controller: passwordController,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          hintText: "Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
          )
      ),
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value){
        value != null && value.length < 6
            ? "Enter min 6 characters"
            : null;
      },
    );
  }
  Widget ConfirmPasswordTextField(){
    return TextFormField(
      controller: confirmPasswordController,
      textInputAction: TextInputAction.next,
      decoration: const InputDecoration(
          hintText: "Confirm Password",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8))
          )
      ),
      obscureText: true,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value){
        value != null && value.length < 6 && value == passwordController.text
            ? "Your 2 passwords are not the same"
            : null;
      },
    );
  }

  Future signIn() async {
    // final isValid = signInFormKey.currentState!.validate();
    // if (!isValid) return;

    // bool inProgress = true;
    //
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context){
    //       if (inProgress) return Center(child: CircularProgressIndicator());
    //     });
    //

    try{
      // await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      Get.off(HomePage()) ;
    } catch(e){
      print(e);
    }

  }
  Future signUp() async {
    // final isValid = signUpFormKey.currentState!.validate();
    // if (!isValid) return;

    // bool inProgress = true;
    //
    // showDialog(
    //     context: context,
    //     barrierDismissible: false,
    //     builder: (context){
    //       if (inProgress) return Center(child: CircularProgressIndicator());
    //     });
    //

    try{
      // await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim());
      Get.off(HomePage()) ;
    }catch(e){
      print(e);
    }

  }

}
