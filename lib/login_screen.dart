import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String error = '';

  Future<void> signIn() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      if (userCredential.user != null && userCredential.user!.emailVerified) {
        setState(() => error = 'Uspešno ste se prijavili!');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        setState(() => error = 'Email nije verifikovan! Proverite email.');
      }
    } catch (e) {
      setState(() => error = e.toString());
    }
  }

  Future<void> checkEmailVerified() async {
    await FirebaseAuth.instance.currentUser?.reload();
    var user = FirebaseAuth.instance.currentUser;
    if (user != null && user.emailVerified) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    } else {
      setState(() => error = 'Email još uvek nije verifikovan.');
    }
  }

  Future<void> register() async {
  try {
    UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    await userCredential.user?.sendEmailVerification();
    setState(() => error = 'Uspešno ste se registrovali! Proverite email za verifikaciju.');
  } catch (e) {
    setState(() => error = e.toString());
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: signIn,
              child: const Text('Login'),
            ),
            if (error.isNotEmpty) Text(error, style: const TextStyle(color: Colors.red)),

            ElevatedButton(
              onPressed: register,
              child: const Text('Register'),
            ),
            ElevatedButton(
              onPressed: checkEmailVerified,
              child: const Text('Proveri verifikaciju emaila'),
            ),
          ],
        ),
      ),
    );
  }



  
}
