import 'package:app_login/welcome.dart';
import 'package:flutter/material.dart';
import '../widgets/input_form.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final correoController = TextEditingController();
  final contraseniaController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool a = false, b = false;
    return Scaffold(
        body: Center(
            child: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Image(
            image: NetworkImage(
                'https://i.pinimg.com/originals/e2/7c/87/e27c8735da98ec6ccdcf12e258b26475.png'),
            height: 140,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text('Inicio de sesión',
              style: TextStyle(fontSize: 30, color: Colors.grey)),
          const SizedBox(
            height: 40,
          ),
          Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InputForm(
                  label: 'Ingrese su correo',
                  icon: Icons.email,
                  type: TextInputType.emailAddress,
                  controller: correoController,
                  validator: (value) {
                    if (value != 'aa') {
                      //volver a cambiar a solo si esta vacio
                      return 'Ingrese un correo valido';
                    }
                    a = true;
                    return null;
                  },
                ),
                InputForm(
                  label: 'Ingrese una contraseña',
                  icon: Icons.password,
                  type: TextInputType.number,
                  obscureText: true,
                  mostrarBoton: true,
                  controller: contraseniaController,
                  validator: (value) {
                    if (value != '22') {
                      //volver a cambiar a un largo minimo
                      return 'Ingrese una contraseña valida';
                    }
                    b = true;
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FilledButton.icon(
              onPressed: () {
                getInputValue();
                if (a && b == true) {
                  // print('a casaaaaa');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                         builder: (context) => const Welcome(),
                      ));
                } else {
                  const snackBar = SnackBar(
                    content:  Text('Datos Invalidos!'),
                    
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              icon: const Icon(Icons.key),
              label: const Text('Iniciar sesion')),
        ],
      ),
    )));
  }

  getInputValue() {
    if (formKey.currentState!.validate()) {
      final data = {
        'correo': correoController.text,
        'contrasenia': contraseniaController.text,
      };

      //mandar a guardar al servidor
      print(data);
    }
  }
}
