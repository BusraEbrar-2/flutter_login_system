import 'package:flutter/material.dart';

void main() => runApp(MyApp());
// container nedne  kullalnılır boyutlandırma yerleşim dekrasyon 
/// scaffold ana düzen 
class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
   initialRoute : "/",
   routes :{
    "/" : ( context ) => GirisEkrani(),
 "/ProfilSayfasiRotasi" : ( context ) => ProfilSayfasi(),
   },
     
  
    );
  }
}


class GirisEkrani extends StatefulWidget {


  @override
  State<GirisEkrani> createState() => _GirisEkraniState();
}

class _GirisEkraniState extends State<GirisEkrani> {
  
TextEditingController t1 = TextEditingController() ;
TextEditingController t2 = TextEditingController() ;


  girisYap(){
    if ( t1.text == "admin" && t2.text =="1234") {
    Navigator.pushNamed(context, "/ProfilSayfasiRotasi",arguments: VeriModeli(ad: t1.text, sifre: t2.text ),);
    } else {
 showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title:  Text("Yanlış kullanıcı adı veya şifre "),
          content: Text("Giriş bilgilerinizi gözden geçirin "),
          actions: <Widget>[
            TextButton(
              child:  Text("kapat"),
              onPressed: () {
                Navigator.of(context).pop(); // Dialogu kapat
              },
            ),
 
            
          ],
        );
      },
    );
  
    }}

// map yapısı  arg rotaya veri iletmek için 
  
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold (
            appBar: AppBar(title: Text ("Giriş Ekrani ")),
    body : Center(
      child : Container ( 
        // dikey column 
        margin : EdgeInsets.all(100) ,
        child : Column ( 
      children: <Widget>[ // widget türünde şeyer yazcz 
        TextFormField(
          decoration: InputDecoration(hintText: "Kullanıcı Adı ") ,
          controller : t1, ) , // metin girişi almak için 
       TextFormField(
          decoration: InputDecoration(hintText: "Şifre  ") ,
        controller : t2, ) ,
        ElevatedButton(onPressed: girisYap, child: Text("giriş yap "), ),
      ],

      ),
      ),
    ) ,
    );
  } }


class ProfilSayfasi extends StatefulWidget {


  @override
  State<ProfilSayfasi> createState() => _ProfilSayfasiState(); 
}




class _ProfilSayfasiState extends State<ProfilSayfasi> {
  
  cikisYap (){
    Navigator.pop(context) ; // navigator sayfaları arası geçiş  kontrol etmk için 
  } //7 push yeni sayf aaçar 
  // pop şuanki sayfay  kladırp bir öbnceki sayfaya döner 
  
  
  
  @override
  Widget build(BuildContext context) {

 final VeriModeli? iletilenargs = ModalRoute.of(context)?.settings.arguments as VeriModeli? ;
                          // aktif olan sayfanın bilgilerine erişmek  ? nul muu 
// settings ile, geçerli sayfa rotasının ayarlamalarına erişiriz. arguments ise, bu rotaya gönderilen veriyi temsil eder.
   
     // Null kontrolü yapıyoruz, eğer veri null ise, default bir mesaj gösteriyoruz.
    if (iletilenargs == null) {
      return Scaffold(
        appBar: AppBar(title: Text("Profil Sayfası")),
        body: Center(child: Text("Veri alınamadı")),
      );
    }
   
   
   
   
    return Scaffold(
      appBar: AppBar(title: Text ("Profil sayfasi ")),
    body : Container(
      child : Column ( // dikey 
      children: <Widget>[ // widget türünde şeyer yazcz 
        ElevatedButton(onPressed: cikisYap, child: Text("çıkış yap ")),
     Text(iletilenargs.ad),
     Text(iletilenargs.sifre),
     
     
     
      ],

    
    ),
    ),); 
  }
} 

class VeriModeli {
  String ad, sifre ;
    // 'required' kullanarak ad ve sifre parametrelerini zorunlu hale getiriyoruz.
  VeriModeli({required this.ad, required this.sifre});

}