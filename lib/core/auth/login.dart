
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding:  EdgeInsets.all(20),
        child:ListView(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(

                    child:

                    CircleAvatar(
                      maxRadius: double.infinity,
                      minRadius: 30,
                      backgroundColor: Colors.lightBlueAccent,
                      backgroundImage: AssetImage('assets/person.jpg'),
                    ),
                  ),
                  const Text("Login",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 10,),
                  const Text("login to contiun using app",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                  const SizedBox(height: 10,),
                  const Text("Email",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                    ),
                  ),
                  const Text("Password",style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),),
                  TextField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                    ),
                  ),
                  const SizedBox(height: 5,),
                  const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forget Password",
                          textAlign:TextAlign.end ,
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal
                          ),),]),
                  const SizedBox(height: 10,),


                ],
              ),
              ElevatedButton(
                style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(20)),shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                onPressed: (){},
                child: const Text("Login"),
              ),
              const SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                  ),),
                  TextButton(onPressed: (){}, child: const Text("Register ",style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal
                  ),))],

              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.facebook,color: Colors.blue,),
                  Icon(Icons.email,color: Colors.blue,),
                  Icon(Icons.apple,color: Colors.blue,),
                ],
              )
            ]),
      ),);
  }
}
