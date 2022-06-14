import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}
class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("KULLANICI ETKİLEŞİMİ")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
           ElevatedButton(onPressed: (){
             ScaffoldMessenger.of(context).showSnackBar(
               SnackBar(
                   content: Text("Silmek İstiyor Musunuz? "),
                 action: SnackBarAction(label: "Evet", onPressed: (){
               ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Silindi")));
                 }),
               ),
             );
           }, child: Text("SnackBar (Varsayılan)")),
            ElevatedButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("İnternet Bağlantısı yok", style: TextStyle(color: Colors.indigoAccent)),
                  backgroundColor: Colors.white30,
                  action: SnackBarAction(   //Sağ tarafta çıkan şey
                      label: "Tekrar Dene",
                      textColor: Colors.red,
                      onPressed: (){

                  }),
                ),
              );
            }, child: Text("SnackBar (Özel)")),
            ElevatedButton(onPressed: (){

              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("başlık"),
                      content:  Text("İçerik"),
                      actions: [
                        TextButton(onPressed: (){
                          print("İptal seçildi");
                          Navigator.pop(context);
                        }, child: Text("İptal")),
                        TextButton(onPressed: (){
                          print("Tamam seçildi");
                          Navigator.pop(context);
                        }, child: Text("Tamam")),
                      ],
                    );
                  });
            }, child: Text("Alert (Varsayılan)")),
            ElevatedButton(onPressed: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      backgroundColor: Colors.grey,
                      title: Text("Kayıt İşlemi",style: TextStyle(color: Colors.black)),
                      content:  TextField(
                        controller: tfController,
                        decoration: InputDecoration(
                          hintText: "Veri"
                        ),
                      ),
                      actions: [
                        TextButton(onPressed: (){
                          print("İptal seçildi");

                          Navigator.pop(context);
                        }, child: Text("İptal",style: TextStyle(color: Colors.black))),
                        TextButton(onPressed: (){
                          print("Alınan veri ${tfController.text}");
                          Navigator.pop(context);
                        }, child: Text("Kaydet",style: TextStyle(color: Colors.black))),
                      ],
                    );
                  });
            }, child: Text("Alert (Özel)")),
          ],
        ),

      ),
    );
  }
}
