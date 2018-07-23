part of 'main.dart';

class Calculator extends StatefulWidget{
  @override
  CalcState createState() => CalcState();
}

class CalcState extends State<Calculator>{
  TextEditingController totalController = new TextEditingController();
  TextEditingController tipController = new TextEditingController();

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      backgroundColor: Colors.white,
      body: new Container(
        padding: EdgeInsets.all(40.0),
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new TextField(
              decoration: new InputDecoration(
                labelText: "Enter bill total",
                hintText: "21.30",
                prefixIcon: Text(
                  "\$" + " ",
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.blueGrey[300],
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              controller: totalController,
            ),
            new TextField(
              decoration: new InputDecoration(
                labelText: "Enter tip amount in %",
                hintText: "15",
                prefixIcon: Text(
                  "%   ",
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.blueGrey[300],
                  ),
                ),
              ),
              keyboardType: TextInputType.number,
              controller: tipController,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                content: Text(
                  calculateTip(
                    totalController.text, 
                    tipController.text
                  )
                ),
              );
            },
          );
        },
        child: Icon(Icons.send),
      ),
    );
  }

  String calculateTip(String t, String p){
    try{
      double tot = double.parse(t);
      double perc = double.parse(p) / 100;
      tot = tot * (1 + perc);
      return tot.toStringAsFixed(2);
    }catch(e){
      return "Please enter a valid number";
    }
  }
}