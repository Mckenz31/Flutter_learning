import 'questions.dart';

class QuestionLists {

  int _questionNumber = 0;

  List<Questions> _question = [
    Questions('You are an amazing person',true),
    Questions('A cat has 3 legs', false),
    Questions('Brazil is the 2nd largest country in the world', false),
    Questions('SriLanka is located in South Asia', true),
    Questions('The five rings on the Olympic flag are interlocking', true),
    Questions('Mount Kilimanjaro is the highest mountain in the worlds', false),
    Questions('Sydney is the capital of Australia', false),
    Questions('The Penny Black is an old-fashioned coin', false),
    Questions('The star sign Capricorn is represented by a goat',true),
    Questions('Fish cannot blink', true),
    Questions('Seahorses have no teeth or stomach', true),
    Questions('Switzerland shares land borders with 4 other countries', false),
    Questions('The knight is the only piece in chess which can move diagonally', false),
    Questions('Angular is a framework used for web development', true),
    Questions('Nepal is the only country in the world which does not have a rectangular flag', true)
  ];

  void updateQueNumber(){
    if(_questionNumber < _question.length - 1){
      _questionNumber++;
    }
  }

  getQuestion(){
    return _question[_questionNumber].question;
  }

  getAnswer(){
    return _question[_questionNumber].answer;
  }

  isFinished(){
    if(_questionNumber == _question.length - 1){
      return true;
    }
  }

  void reset(){
    _questionNumber = 0;
  }

}