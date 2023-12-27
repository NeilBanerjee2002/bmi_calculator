import 'package:bmi_calculator/calcuator_brain.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'results.dart';
import 'constants.dart';

enum Gender { male, female, neither }

Color malecardcolour = kinactiveCardColour;
Color femalecardcolour = kinactiveCardColour;

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedgender = Gender.neither;
  int height = 180;
  int weight = 60;
  int age = 35;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI CALCULATOR')),
        backgroundColor: Color(0xFF0A0E21),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedgender = Gender.male;
                    });
                  },
                  colour: selectedgender == Gender.male
                      ? kactiveCardColour
                      : kinactiveCardColour,
                  cardchild: IconContent(
                    FontAwesomeIcons.mars,
                    'MALE',
                  ),
                )),
                Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedgender = Gender.female;
                          });
                        },
                        colour: selectedgender == Gender.female
                            ? kactiveCardColour
                            : kinactiveCardColour,
                        cardchild: IconContent(
                          FontAwesomeIcons.venus,
                          'FEMALE',
                        ))),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: kactiveCardColour,
              cardchild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: knumberstyle,
                      ),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Colors.grey,
                        overlayColor: Color(0x29EB1555),
                        thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 10.0,
                        ),
                        overlayShape: RoundSliderOverlayShape(
                          overlayRadius: 30.0,
                        )),
                    child: Slider(
                        value: height.toDouble(),
                        thumbColor: Colors.pink,
                        min: 50,
                        max: 250,
                        activeColor: Colors.white,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        }),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              weight.toString(),
                              style: knumberstyle,
                            ),
                            Text(
                              'kgs',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white70,
                              ),
                              OnPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white70,
                              ),
                              OnPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCardColour,
                    cardchild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: klabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              age.toString(),
                              style: knumberstyle,
                            ),
                            Text(
                              'yrs',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.minus,
                                color: Colors.white70,
                              ),
                              OnPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: Icon(
                                FontAwesomeIcons.plus,
                                color: Colors.white70,
                              ),
                              OnPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain c1 =
                  CalculatorBrain(height: height, weight: weight);
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ResultsPage(
                          bmiResult: c1.calculateBMI(),
                          resultText: c1.getResult(),
                          interpretation: c1.getInterpretation())));
            },
            child: Container(
              child: Center(
                child: Text(
                  'CALCULATE',
                  style: knumberstyle.copyWith(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              color: kbottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kbottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({super.key, this.icon, this.OnPress});
  final icon;
  final OnPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: icon,
      elevation: 0,
      onPressed: OnPress,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: kWeightButtonColour,
    );
  }
}
