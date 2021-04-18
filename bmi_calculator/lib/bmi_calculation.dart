import 'dart:math';

class BmiCalculator {

  BmiCalculator({this.height, this.weight}){
    this.bmiResult();
  }

  final int height;
  final int weight;
  double _bmi;

  String bmiResult(){
    _bmi = weight/ pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String bmiStatus(){
    if(_bmi >= 25){
      return 'OVERWEIGHT';
    }
    else if(_bmi > 18){
      return 'NORMAL';
    }
    else{
      return 'UNDERWEIGHT';
    }
  }

  String bmiComment(){
    if(_bmi >= 25){
      return 'You body weight is more than normal. Exercise regularly';
    }
    else if(_bmi > 18){
      return 'Your body weight is normal. Good job!';
    }
    else{
      return 'Your body weight is less than normal. Eat more healthy food';
    }
  }

}