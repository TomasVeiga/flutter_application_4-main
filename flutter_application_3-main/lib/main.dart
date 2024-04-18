// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace


import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'view/pagina2.dart';
import 'view/pagina3.dart';
import 'view/pagina4.dart';

void main() {
  runApp(
    DevicePreview(
      enabled: true,
      builder: (context) => MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu App',
      initialRoute: 'pagina1',
      routes: {
        'pagina1':(context) => PrincipalView(),
        'pagina2':(context) => Tela2(),
        'pagina3':(context) => Tela3(),
        'pagina4':(context) => Tela4(),
        
        
      }
    );
  }
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  //
  // Atributos
  //

  //Chave identificadora do Form
  var formKey = GlobalKey<FormState>();

  //Controladores dos Campos de Texto
  var email = TextEditingController();
  var senha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset('lib/imagens/perfil.jpg',
              width: 200,
              height: 200,),
              SizedBox(height:20),
              
              //
              // CAMPO DE TEXTO
              //
              TextFormField(
                controller: email,

                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
                //
                // VALIDAÇÃO
                //
                validator: (value){
                  if (value ==null){
                    return 'Informe um email';
                  }else if (value.isEmpty){
                    return 'Informe um email';  
                  }
                  //Retornar null significa sucesso na validação
                  return null;
                },

              ),
              SizedBox(height: 30),
              TextFormField(
                controller: senha,
                style: TextStyle(fontSize: 32),
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
                //
                // VALIDAÇÃO 2 (vermelho se não tiver escrito nada)
                //
                validator: (value){
                  if (value ==null){
                    return 'Informe uma senha';
                  }else if (value.isEmpty){
                    return 'Informe uma senha';  
                  }
                  //Retornar null significa sucesso na validação
                  return null;
                },
               ),


               SizedBox(height:20),
               TextButton(onPressed: (){
                //
                // ABRIR PAGINA 3
                //
                Navigator.pushNamed(
                      context,
                      'pagina3',

                    );

               }, child: Text('Recuperar senha'),),

              SizedBox(height: 30),
              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade900,
                  minimumSize: Size(200,50),
                  shadowColor: Colors.red,
                ),
                onPressed: () {

                  if(formKey.currentState!.validate()) {
                    setState(() {
                      ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Entrando...'),
                      duration: Duration(seconds:1),
                      ),
                    );
                  
                    });
                     Navigator.pushNamed(
                      context,
                      'pagina2',
                    );
                  }

                  

                   
                },
                child: Text('Entrar'),
              ),

              // BOTÃO PARA PÁGINA 4
              SizedBox(height:30),
               TextButton(onPressed: (){
                //
                // ABRIR PAGINA 3
                //
                Navigator.pushNamed(
                      context,
                      'pagina4',

                    );

               }, child: Text('CRIAR CADASTRO',),),

            ],
          ),
        ),
      ),
    );
  }
}
