import 'package:codeqr/webview_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:barcode_scan/barcode_scan.dart';
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}
class _HomeScreenState extends State<HomeScreen> { String kode = "";
  var getKode;
  Future scanBarcode() async {
  getKode = await BarcodeScanner.scan();
  setState(() {
  kode = getKode.rawContent;
  });
}
@override
Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
    title: Text("Yuda Muliawan Scan Code QR",
    style: TextStyle(
    color: Colors.red,),),
    centerTitle: true,
    backgroundColor: Colors.black,
    elevation: 0.0,
    ),
    body: Column(
    children: [
    Container(
    height: 10,
    decoration: BoxDecoration(
    color: Colors.blueGrey,
    ),
    ),
    Image.network(
    "https://gadgetren.com/wp-content/uploads/2018/08/Cara-Scan-Barcode-Google-Maps-Header-700x350.jpg"),
    SizedBox(
    height: 20.0,
    ),
    FlatButton(
    onPressed: () {
    scanBarcode();
    },
    child: Container(
    child: Padding(
    padding: const EdgeInsets.all(40.0),
    child: Center(
    child: Text(
    "Tekan Untuk Scan",
    style: TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 22,
    ),
    ),
    ),
    ),
decoration: BoxDecoration(
color: Colors.black,
borderRadius: BorderRadius.all(Radius.circular(5.0)), ),
),
),
FlatButton(
onPressed: kode == ""
? () {}
:(){
Navigator.push(
context,
MaterialPageRoute(
builder: (context) => WebScreen(kode),
),
);
},
child: Container(
width: double.infinity,
child: Padding(
padding: EdgeInsets.all(10.0),
child: Center(
child: kode == ""
? Text( "Open Website", style: TextStyle(
color: Colors.black26,
fontStyle: FontStyle.italic,
fontSize: 14, ),
)
: Text(
kode,
style: TextStyle( color: Colors.red, fontWeight: FontWeight.w300, fontSize: 16,
),
),
),
),
decoration: BoxDecoration(
color: Colors.black,
borderRadius: BorderRadius.all(Radius.circular(5.0)), ),
),
),
],
),
);
}
}