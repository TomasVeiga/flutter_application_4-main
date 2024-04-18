// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_3/view/ListadeCompras.dart';


class Tela2 extends StatelessWidget {
  
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShoppingListsScreen ()),
                );
              },
              child: Text('Lista de Compras'),
            ),
            SizedBox(height: 30), // espaçamento entre botões

            ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Suporte 24hrs'),
          content: Text('Contatar Tomás CEO e fundador do APP Lista de Compras - cel: 16981374449'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  },
  child: Text('Suporte 24hrs'),
),

            SizedBox(height: 30), // espaçamento entre botões
            ElevatedButton(
              onPressed: () {
                // Adicione aqui a navegação para a tela de configurações
              },
              child: Text('configurações'),
            ),
          ],
        ),
      ),
    );
            
        }
  }
