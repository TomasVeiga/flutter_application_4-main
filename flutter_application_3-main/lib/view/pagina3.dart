
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Tela3 extends StatelessWidget {
  
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
              ElevatedButton(
                onPressed: () { 

                  showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Recuperação de Senha'),
                  content: const Text('Email enviado com sucesso'),
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
                  // Lógica para enviar e-mail de recuperação aqui
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




