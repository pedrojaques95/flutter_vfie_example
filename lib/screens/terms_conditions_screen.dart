import 'package:flutter/material.dart';
import 'package:flutter_app/dto/mcare_terms_privacy.dart';

class TermsConditionsScreen extends StatefulWidget {
  @override
  _TermsConditionsScreenState createState() => _TermsConditionsScreenState();
}

class _TermsConditionsScreenState extends State<TermsConditionsScreen> {
  //vars & const
  McareTermsPrivacy data;
  Map routeArgs;
  bool isCheckboxSelected;

  @override
  void initState() {
    super.initState();
    isCheckboxSelected = false;
  }

  @override
  Widget build(BuildContext context) {
    //get data from previous route
    routeArgs = ModalRoute.of(context).settings.arguments;
    data = routeArgs['McareTermsPrivacy'];

    var _onPressed;
    if (isCheckboxSelected)
      _onPressed = () {
        Navigator.pushReplacementNamed(context, '/');
      };

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/redBG.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: SafeArea(
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 18.0),
                      child: Image.asset('assets/vf_white_icon.png'),
                    ),
                  ),
                  Expanded(
                      flex: 6,
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 50.0),
                          child: Text('My Vodafone',
                              style: TextStyle(
                                  fontFamily: 'fonts/Vodafone-Lt',
                                  color: Colors.white,
                                  //fontWeight: FontWeight.w300,
                                  fontSize: 22.0)),
                        ),
                      ))
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15.0),
                    topRight: Radius.circular(15.0)),
              ),
              color: Colors.white,
              margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.fromLTRB(30, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text('Terms & Conditions',
                              style: TextStyle(
                                  fontFamily: 'fonts/Vodafone-Lt',
                                  fontWeight: FontWeight.w300,
                                  fontSize: 20.0)),
                        ),
                      )),
                  Expanded(
                    flex: 6,
                    child: Card(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        side: BorderSide(color: Colors.grey, width: 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      color: Colors.white,
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                        child: ListView.builder(
                            shrinkWrap: true,
                            padding: const EdgeInsets.all(5.0),
                            itemBuilder: (context, index) {
                              return Text(
                                '${data.terms.content[index].content}\n\n',
                                style: TextStyle(
                                    fontFamily: 'Fonts/Vodafone-Lt',
                                    fontWeight: FontWeight.w300,
                                    fontSize: 16.0),
                              );
                            },
                            itemCount: data.terms.content.length),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,0,0),
                          child: Expanded(
                            flex: 1,
                            child: Checkbox(
                              value: isCheckboxSelected,
                              onChanged: (newValue) {
                                setState(() {
                                  isCheckboxSelected = newValue;
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 5,
                          child: Text(
                            'I have read and accepted the Terms & Conditions',
                            style: TextStyle(
                                fontFamily: 'Fonts/Vodafone-Lt',
                                fontWeight: FontWeight.w300,
                                fontSize: 12.0),
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(50, 0, 50, 20),
                      child: FlatButton(
                        color: Colors.redAccent[700],
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        onPressed: _onPressed,
                        child: Text(
                          "Continue",
                          style: TextStyle(
                              fontFamily: 'Fonts/Vodafone-Lt',
                              fontWeight: FontWeight.w300,
                              fontSize: 16.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
