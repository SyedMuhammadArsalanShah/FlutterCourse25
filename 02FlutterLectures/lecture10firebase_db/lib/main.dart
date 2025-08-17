import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lecture10firebase_db/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: SplashSCR(),
    );
  }
}

class SplashSCR extends StatefulWidget {
  const SplashSCR({super.key});

  @override
  State<SplashSCR> createState() => _SplashSCRState();
}

class _SplashSCRState extends State<SplashSCR> {
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void initState() {
    final user = auth.currentUser;

    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 4), () {
      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeSCR()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginSCR()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text("LRS")));
  }
}

class SignUpSCR extends StatefulWidget {
  const SignUpSCR({super.key});

  @override
  State<SignUpSCR> createState() => _SignUpSCRState();
}

class _SignUpSCRState extends State<SignUpSCR> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.indigo[900],
            height: 300,
            width: double.infinity,
            child: Center(
              child: Text(
                "Login Page",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: name,
              keyboardType: TextInputType.emailAddress,
              // enabled: false,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.info),
                prefix: Icon(Icons.email),
                hintText: "Abdullah",
                label: Text("Enter Your Name"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              // enabled: false,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.info),
                prefix: Icon(Icons.email),
                hintText: "someone@abc.com",
                label: Text("Enter Your Email"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),

          // SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: pass,
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "#",
              // enabled: false,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye_rounded),
                prefix: Icon(Icons.password),
                hintText: "alphaNumeric",
                label: Text("Enter Your Password"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // String emailaddress = email.text.toString();
              // String password = pass.text.toString();

              // print("My Email is " + emailaddress);
              // print("My Password is " + password);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Home(emailaddress)),
              // );

              try {
                final credential = await FirebaseAuth.instance
                    .createUserWithEmailAndPassword(
                      email: email.text.toString(),
                      password: pass.text.toString(),
                    );
              } on FirebaseAuthException catch (e) {
                if (e.code == 'weak-password') {
                  print('The password provided is too weak.');
                } else if (e.code == 'email-already-in-use') {
                  print('The account already exists for that email.');
                }
              } catch (e) {
                print(e);
              }
            },
            child: Text("Signup"),
          ),
        ],
      ),
    );
  }
}

class LoginSCR extends StatefulWidget {
  const LoginSCR({super.key});

  @override
  State<LoginSCR> createState() => _LoginSCRState();
}

class _LoginSCRState extends State<LoginSCR> {
  TextEditingController email = TextEditingController();
  TextEditingController pass = TextEditingController();
  // TextEditingController name = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.indigo[900],
            height: 300,
            width: double.infinity,
            child: Center(
              child: Text(
                "Login Page",
                style: TextStyle(fontSize: 30, color: Colors.white),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: email,
              keyboardType: TextInputType.emailAddress,
              // enabled: false,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.info),
                prefix: Icon(Icons.email),
                hintText: "someone@abc.com",
                label: Text("Enter Your Email"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),

          // SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: pass,
              keyboardType: TextInputType.text,
              obscureText: true,
              obscuringCharacter: "#",
              // enabled: false,
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.remove_red_eye_rounded),
                prefix: Icon(Icons.password),
                hintText: "alphaNumeric",
                label: Text("Enter Your Password"),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.indigo, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.teal, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(21),
                  borderSide: BorderSide(color: Colors.grey, width: 2),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              // String emailaddress = email.text.toString();
              // String password = pass.text.toString();

              // print("My Email is " + emailaddress);
              // print("My Password is " + password);
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Home(emailaddress)),
              // );

              try {
                final credential = await FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                      email: email.text.toString(),
                      password: pass.text.toString(),
                    )
                    .then((value) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeSCR()),
                      );
                    });
              } on FirebaseAuthException catch (e) {
                if (e.code == 'user-not-found') {
                  print('No user found for that email.');
                } else if (e.code == 'wrong-password') {
                  print('Wrong password provided for that user.');
                }
              }
            },
            child: Text("Signup"),
          ),
        ],
      ),
    );
  }
}

class HomeSCR extends StatefulWidget {
  const HomeSCR({super.key});

  @override
  State<HomeSCR> createState() => _HomeSCRState();
}

class _HomeSCRState extends State<HomeSCR> {
  TextEditingController searchController = TextEditingController();
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();


  final key = FirebaseAuth.instance.currentUser!.uid;

  int id = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Aptech GLS02"),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginSCR()),
              );
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                label: Text("Search BY Title"),
                hintText: "Search Here ......",
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          meraModal(null);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void meraModal(var postID) {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(
            32,
            32,
            32,
            MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(hintText: "Enter Your Title"),
              ),
              TextField(
                controller: descController,
                decoration: InputDecoration(hintText: "Enter Your Title"),
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () async {
                  String title = titleController.text.toString();
                  String desc = descController.text.toString();
                  DatabaseReference databaseReference = FirebaseDatabase.instance.ref("students");
                  if (postID == null) {
                    // createData(data);

                    id++;

                    await databaseReference
                        .child(key)
                        .child("$id")
                        .set({
                          "ID": id,
                          "Title": title,
                          "Description": desc,
                          "DateOfPost": DateTime.now().toString(),
                        })
                        .then((value) {
                          print("Successfully created ");
                        })
                        .onError((error, stackTrace) {
                          print("failed task ");
                        });
                  }
                },
                child: Text("ADD"),
              ),
            ],
          ),
        );
      },
    );
  }
}
