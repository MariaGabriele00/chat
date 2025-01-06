import 'package:chat/pages/pages.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  late TextEditingController firstNameController;
  late TextEditingController lastNameController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
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
            decoration: const BoxDecoration(
              color: Color.fromRGBO(103, 0, 151, 1),
              image: DecorationImage(
                image: AssetImage('assets/images/fundo_roxo_1.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            child: SafeArea(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.keyboard_arrow_left,
                        size: 48,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      'Crie uma conta',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(64),
                ),
              ),
              clipBehavior: Clip.antiAlias,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 80,
                  ),
                  child: SafeArea(
                    top: false,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        MyInputField(
                          label: 'Primeiro nome',
                          placeholder: 'Digite seu primeiro nome aqui',
                          onChange: (value) {
                            firstNameController.text = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        MyInputField(
                          label: 'Segundo nome',
                          placeholder: 'Digite seu segundo nome aqui',
                          onChange: (value) {
                            lastNameController.text = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        MyInputField(
                          label: 'Email',
                          placeholder: 'Digite seu email aqui',
                          onChange: (value) {
                            emailController.text = value;
                          },
                        ),
                        const SizedBox(height: 20),
                        MyInputField(
                          label: 'Senha',
                          placeholder: 'Digite sua senha aqui',
                          onChange: (value) {
                            passwordController.text = value;
                          },
                          isPasswordField: true,
                        ),
                        const SizedBox(height: 20),
                        MyInputField(
                          label: 'Confirme a senha',
                          placeholder: 'Confirme sua senha aqui',
                          onChange: (value) {
                            confirmPasswordController.text = value;
                          },
                          isPasswordField: true,
                        ),
                        const SizedBox(height: 20),
                        MyTextButton(
                          label: 'Cadastre-se',
                          onTap: () {},
                        ),
                        const SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text(
                              'Você já é nosso usuário? ',
                              style: TextStyle(fontSize: 16),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const LoginPage(),
                                  ),
                                  (route) => false,
                                );
                              },
                              child: const Text(
                                'Acesse',
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
          ),
        ],
      ),
    );
  }
}
