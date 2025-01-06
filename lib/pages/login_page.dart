import 'package:chat/pages/pages.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(103, 0, 151, 1),
      body: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .3,
            decoration: const BoxDecoration(
              color: Color.fromRGBO(103, 0, 151, 1),
              image: DecorationImage(
                image: AssetImage('assets/images/fundo_roxo_1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: const Center(
              child: Image(
                image: AssetImage('assets/images/logodois.png'),
                width: 100,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 40,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64),
                ),
              ),
              child: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 48),
                      ),
                      const SizedBox(height: 60),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          MyInputField(
                            label: 'Email',
                            placeholder: 'Digite seu email aqui',
                            onChange: (value) {
                              emailController.text = value;
                            },
                          ),
                          const SizedBox(height: 40),
                          MyInputField(
                            label: 'Senha',
                            placeholder: 'Digite sua senha aqui',
                            onChange: (value) {
                              passwordController.text = value;
                            },
                            isPasswordField: true,
                          ),
                          const SizedBox(height: 40),
                          MyTextButton(
                            label: 'Acessar',
                            onTap: () {},
                          ),
                        ],
                      ),
                      const SizedBox(height: 60),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'Ainda não tem uma conta? ',
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SignUpPage(),
                                ),
                              );
                            },
                            child: const Text(
                              'Cadastre-se',
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
