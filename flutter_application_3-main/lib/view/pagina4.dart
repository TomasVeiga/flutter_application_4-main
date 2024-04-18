import 'package:flutter/material.dart';

class Tela4 extends StatelessWidget {
  
    @override
        Widget build(BuildContext context){
            return Scaffold(
              //
              // BOTÃO DE VOLTAR
              //
              appBar:AppBar(leading:IconButton(icon:const Icon(Icons.arrow_back),
              color:Colors.black38,onPressed: () => Navigator.pop(context,false),
              ),
              ),
              body: Center(
  child: Padding(
    padding: const EdgeInsets.all(20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          'Informe seu e-mail para criar o cadastro',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'E-mail',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          decoration: const InputDecoration(
            labelText: 'Confirmar E-mail',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Senha',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20.0),
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
            labelText: 'Confirmar Senha',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20.0),
        ElevatedButton(
          onPressed: () {
            // Lógica para verificar se os campos estão preenchidos
            // (pode ser feito através de um estado no StatefulWidget)
            bool camposPreenchidos = true; // Lógica para verificar se os campos estão preenchidos

            if (camposPreenchidos) {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Cadastro Realizado'),
                    content: const Text('E-mail e senha cadastrados com sucesso!'),
                    actions: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Fechar'),
                        ),
                      ),
                    ],
                  );
                },
              );
            }
          },
          child: const Text('Recuperar Cadastro'),
        ),
      ],
    ),
  ),
),
            );
        }
  }