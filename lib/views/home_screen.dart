import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:real_spent_app/components/OperacaoButton.dart';
import 'package:real_spent_app/constants.dart';
import 'package:real_spent_app/model/Operacao.dart';
import 'package:real_spent_app/model/Usuario.dart';
import 'package:real_spent_app/util/datas.dart';
import 'package:real_spent_app/views/operacao_screen.dart';

class Home_screen extends StatefulWidget {
  static const String id = '/home';
  @override
  _Home_screenState createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  var operacoes = operacao.listaOperacoes(auth.currentUser.email);

//
//  @override
//  void dispose() {
//
//    super.dispose();
//  }

  //int i = 0;
  @override
  Widget build(BuildContext context) {
    //TODO: Programar tela inicial do app.
    // double heightScreen = MediaQuery.of(context).size.height;
    // double widthScreen = MediaQuery.of(context).size.width;

    var var1 = ["R\$ 10,00", "R\$ 90,00", "- R\$ 80,00"];
    var style = [kIncomeTextStyle, kOutcomeTextStyle, kHeaderTextStyle];
    var operacao = Operacao("descricao", "tipo", "Saúde", "120.0",
        "2021.03.05.23.03", "email@user");
    var mesAtual = mesAno();

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondColor,
        title: Text(
          mesAtual,
          style: kTextStyle,
        ),
      ),
      endDrawer: Drawer(
          //TODO: Relatórios, histórico, Categogias, Logout
          ),
      backgroundColor: kBackgroundColor,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(context, OperacaoScreen.id);
          //Categoria().addCategoria("Alimentação");
        },
        label: Text('Adicionar'),
        icon: Icon(Icons.add_circle),
        backgroundColor: kSecondColor,
      ),
      body: SafeArea(
        child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
          double heightScreen = MediaQuery.of(context).size.height;
          double widthScreen = MediaQuery.of(context).size.width;
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(
                width: double.maxFinite,
                height: 170,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 170.0,
                    autoPlay: true,
                  ),
                  items: [0, 1, 2].map((i) {
                    return Builder(builder: (BuildContext context) {
                      return Container(
                        width: double.maxFinite,
                        margin: EdgeInsets.symmetric(horizontal: 1),
                        decoration: BoxDecoration(
                          color: kBackgroundColor,
                          //borderRadius: BorderRadius.all(Radius.circular(10)),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 7,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Container(
                          child: Center(
                            child: Text(
                              var1[i],
                              style: style[i],
                            ),
                          ), //TODO: Alterar para valores do mes
                        ),
                      );
                    });
                  }).toList(),
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: heightScreen - 170 - 94,
                child: ListView(
                  children: [
                    operacaoButton("Almoço", "Alimentação", "25,00", "Saída"),
                    // operacaoButton(),
                    // operacaoButton(),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
