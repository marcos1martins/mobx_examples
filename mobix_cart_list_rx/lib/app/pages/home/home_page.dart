import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobix_cart_list_rx/app/item_widget.dart';
import 'package:mobix_cart_list_rx/app/models/item_model.dart';
import 'package:mobix_cart_list_rx/components/home_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  
    _dialog() {
      var model = ItemModel();
        
            showDialog(
                context: context,
                builder: (_) {
                  return AlertDialog(
                    title: Text("Adicionar item"),
                    content: TextField(
                      onChanged: model.setTitle,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'novo item',
                      ),
                    ),
                    actions: <Widget>[
                      FlatButton(
                        onPressed: () {
                          controller.addItem(model);
                          Navigator.pop(context);
                        },
                        child: Text('Salvar'),
                      ),
                      FlatButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancelar'),
                      )
                    ],
                  );
                });
          }
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
              appBar: AppBar(
                title: TextField(
                  onChanged: controller.setFilter,
                  decoration: InputDecoration(hintText: "pesquisa..."),
                ),
                actions: <Widget>[
                  Observer(builder: (_) {
                    return IconButton(
                      icon: Text(controller.totalChecked.toString()),
                      onPressed: () {},
                    );
                  }),
                ],
              ),
              body: Observer(
                builder: (_) {
                   if (controller.output.data == null) {
                      return Center(child: CircularProgressIndicator(),);
                    }
                  return ListView.builder(
                    itemCount: controller.output.data.length,
                    itemBuilder: (_, index) {
                      var item = controller.output.data[index];
                      return ItemWidget(
                        item: item,
                        removeClicked: () {
                          controller.removeItem(item);
                        },
                      );
                    },
                  );
                },
              ),
              floatingActionButton: FloatingActionButton(
                child: Icon(Icons.add),
                onPressed: () {
                  _dialog();
                },
              ),
            );
          }
        }