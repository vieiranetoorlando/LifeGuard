import 'package:flutter/material.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
// definindo Widget para campo de preenchimento do email:
  Widget _loginEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
          child: Text(
            'E-mail:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: TextField(
            onChanged: (value) {
              email = value;
            },
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 30,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5),
              prefixIcon: Icon(
                Icons.email_rounded,
                color: Colors.white,
              ),
              hintText: 'Digite seu e-mail',
              hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }

// definindo Widget para campo de preenchimento da senha:
  Widget _loginSenha() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
          child: Text(
            'Senha:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w300,
              color: Colors.white,
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          alignment: Alignment.centerLeft,
          height: 50,
          child: TextField(
            onChanged: (value) {
              senha = value;
            },
            obscureText: true,
            keyboardType: TextInputType.visiblePassword,
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 30,
            ),
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.only(top: 5),
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Colors.white,
              ),
              hintText: 'Digite sua senha',
              hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.w300),
            ),
          ),
        ),
      ],
    );
  }

  String email = "";
  String senha = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 55, 89, 83),
                  Color.fromARGB(255, 160, 182, 138),
                  Color.fromARGB(255, 80, 97, 79),
                  Color.fromARGB(255, 143, 142, 142),
                ],
                stops: [0.1, 2, 3, 4],
              ),
            ),
          ),
          Container(
            height: double.infinity,
            child: SingleChildScrollView(
              physics: AlwaysScrollableScrollPhysics(),
              padding: EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.all(90),
                  ),
                  Container(
                    height: 100,
                    width: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/LogoLifeguard.png'),
                          fit: BoxFit.contain),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                  ),
                  _loginEmail(),
                  SizedBox(
                    height: 10,
                  ),
                  _loginSenha(),
                  SizedBox(height: 50),
                  Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color.fromARGB(255, 5, 5, 5).withOpacity(0.1),
                          spreadRadius: 3,
                          blurRadius: 9,
                        ),
                      ],
                    ),
                    height: 50,
                    width: 200,
                    child: TextButton(
                      onPressed: () {
                        if (email == "teste" && senha == "123") {
                          print("Login Autorizado");
                          Navigator.popAndPushNamed(context, "homepage");
                        } else {
                          print("Usuário ou senha incorreto");
                        }
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        foregroundColor: Color.fromARGB(255, 255, 255, 255),
                        backgroundColor: Color.fromARGB(204, 133, 124, 116),
                        disabledForegroundColor: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
