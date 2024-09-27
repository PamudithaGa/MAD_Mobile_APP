import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  static const String id = "Login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            bool isPortrait = constraints.maxWidth < constraints.maxHeight;

            return Container(
              color: Colors.black,
              child: isPortrait
                  ? Column(
                children: [
                  Expanded(child: Logo()), // Logo at the top
                  Expanded(
                    flex: 2,
                    child: Center(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: AuthForm(),
                      ),
                    ),
                  ),
                ],
              )
                  : Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Logo(), // Logo on the left
                  ),
                  Expanded(
                    flex: 2,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
                      child: AuthForm(), // Auth form on the right
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

// Logo widget
class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 80.0),
      child: Image.asset(
        'lib/assets/images/logowhite.png',
        height: 150,
      ),
    );
  }
}

// Widget for the AuthForm
class AuthForm extends StatefulWidget {
  @override
  _AuthFormState createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  bool _isSignup = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _toggleFormType() {
    setState(() {
      _isSignup = !_isSignup;
    });
  }

  void _submit() {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (email.isEmpty && password.isEmpty) {
      _showSnackBar('Please enter your email and password');
    } else if (email.isEmpty) {
      _showSnackBar('Please enter your email');
    } else if (password.isEmpty) {
      _showSnackBar('Please enter your password');
    } else {
      Navigator.pushReplacementNamed(context, Home.id);
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center, // Center horizontally
      children: [
        Text(
          _isSignup ? 'Create Account' : 'Login',
          style: const TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 30),
        CustomTextField(
          controller: _emailController,
          labelText: 'Email',
          prefixIcon: Icons.email,
        ),
        const SizedBox(height: 20),
        CustomTextField(
          controller: _passwordController,
          labelText: 'Password',
          prefixIcon: Icons.lock,
          obscureText: true,
        ),
        const SizedBox(height: 30),
        AuthButton(isSignup: _isSignup, onPressed: _submit),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _toggleFormType,
          child: Text(
            _isSignup ? 'Already have an account? Login' : 'Create a new account',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    );
  }
}

// Widget for Custom TextFields with Shadow
class CustomTextField extends StatelessWidget {
  final String labelText;
  final IconData prefixIcon;
  final bool obscureText;
  final TextEditingController controller;

  CustomTextField({
    required this.labelText,
    required this.prefixIcon,
    this.obscureText = false,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 10,
            spreadRadius: 2,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(color: Colors.black),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(prefixIcon, color: Colors.white),
          filled: true,
          fillColor: Colors.transparent,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white54, width: 1.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: Colors.white, width: 1.5),
          ),
        ),
      ),
    );
  }
}

// Widget for AuthButton (Login/Signup button)
class AuthButton extends StatelessWidget {
  final bool isSignup;
  final VoidCallback onPressed;

  AuthButton({required this.isSignup, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF4169E1),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        isSignup ? 'Signup' : 'Login',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }
}
