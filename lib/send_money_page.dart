import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart' as bouncing_widget;
import 'package:pattern_formatter/pattern_formatter.dart';

class TransferMoney extends StatefulWidget {
  final String name;
  final String avatar;
  const TransferMoney({Key? key, required this.name, required this.avatar})
      : super(key: key);

  @override
  _TransferMoneyState createState() => _TransferMoneyState();
}

class _TransferMoneyState extends State<TransferMoney> {
  var amount = TextEditingController(text: "0.00");

  final FocusNode _focusNode =  FocusNode();
  final TextEditingController _editingController = TextEditingController();
  bool isFocused = false;

  final List<String> _feedbacks = [
    'Awsome 🙌',
    'Nice 🔥',
    "Cool 🤩",
    'Amazing work 👍🏼',
  ];

  @override
  void initState() {
    super.initState();

    _focusNode.addListener(onFocusChanged);
  }

  void onFocusChanged() {
    setState(() {
      isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(0, 255, 255, 255),
          elevation: 0,
          title: const Text(
            'Send Money',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
          ),
          leading: const BackButton(
            color: Color.fromARGB(255, 0, 0, 0),
          ),
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 50,
                ),
                FadeInDown(
                  from: 100,
                  duration: const Duration(milliseconds: 1000),
                  child: Container(
                    width: 130,
                    height: 130,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.pink.shade50,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.asset(widget.avatar)),
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                FadeInUp(
                    from: 60,
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 1000),
                    child: const Text(
                      "Send Money To",
                      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                    )),
                const SizedBox(
                  height: 10,
                ),
                FadeInUp(
                    from: 30,
                    delay: const Duration(milliseconds: 800),
                    duration: const Duration(milliseconds: 1000),
                    child: Text(
                      "Preet Mayani",
                      style:
                          const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color:Color.fromARGB(255, 0, 0, 0)),
                    )),
                const SizedBox(
                  height: 20,
                ),
                FadeInUp(
                  from: 40,
                  delay: const Duration(milliseconds: 800),
                  duration: const Duration(milliseconds: 1000),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: TextField(
                      controller: amount,
                      textAlign: TextAlign.center,
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      cursorColor: Colors.black,
                      style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                      onSubmitted: (value) {
                        setState(() {
                          amount.text = "\$" + value + ".00";
                        });
                      },
                      onTap: () {
                        setState(() {
                          if (amount.text == "0.00") {
                            amount.text = "";
                          } else {
                            amount.text =
                                amount.text.replaceAll(RegExp(r'.00'), '');
                          }
                        });
                      },
                      inputFormatters: [ThousandsFormatter()],
                      decoration: InputDecoration(
                          hintText: "Enter Amount",
                          hintStyle:
                              TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          )),
                    ),
                  ),
                ),
                const  SizedBox(
                  height: 10,
                ),
                // note textfield
               
                const SizedBox(
                  height: 50,
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1000),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50.0),
                    child: Material(
                      elevation: 5,
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 36, 69, 254).withOpacity(0.7),
                      child: MaterialButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/');
                        },
                        minWidth: double.infinity,
                        height: 50,
                        child: const Text(
                          "Send",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}