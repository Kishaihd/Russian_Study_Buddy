library app_view;

import 'dart:html';
import 'package:polymer/polymer.dart';
import 'package:polymer_expressions/filter.dart';
import '../../utils/filters.dart';


@CustomTag('app-view')
class AppView extends PolymerElement {

  static const CLASS_NAME = "AppView";
  static const String INTRO_VIEW = "INTRO_VIEW";
  static const String NOUN_VIEW = "NOUN_VIEW";
  static const String VERB_VIEW = "VERB_VIEW";
  static const String VOCAB_VIEW = "VOCAB_VIEW";
  static const String DIC_VIEW = "DIC_VIEW";
  
  static const String DECLENSIONS = "DECLENSIONS";
  static const String D_EXAMPLES  = "D_EXAMPLES";
  static const String CONJUGATIONS = "CONJUGATIONS";
  static const String C_EXAMPLES = "C_EXAMPLES";
  
  @observable String currentView = INTRO_VIEW;
  @observable int tabSelected = 0;
  
  void changeView(Event e, var detail, Element target) {
      currentView = target.attributes['data-view'];
  }

  String introBind = "Welcome, mofo.";
  String nounBind = "Noun Declensions";
  String verbBind = "Verb Conjugations";
  String vocabBind = "Vocabulary";
  String dicBind = "Dictionary";
  
  // filters and transformers can be referenced as class fields
  final Transformer asInteger = new StringToInt();

  // non-visual initialization can be done here
  AppView.created() : super.created();

  // life-cycle method called by the Polymer framework when the element is attached to the DOM
  @override void attached() {
    super.attached();
    print("$CLASS_NAME::attached()");
  }

  // a sample event handler function
  void eventHandler(Event event, var detail, Element target) {
    print("$CLASS_NAME::eventHandler()");
  }

  void submit(Event event, var detail, Element target) {
    // prevent app reload on <form> submission
    event.preventDefault();
  }  
  
  void addWord(Event event, var detail, Element target) {
    v.addWord(target.toString());
  }
  
  
  Declensions d = new Declensions();
  
  @observable Vocab v = new Vocab();
  
}

class Vocab {
  List<String> _vocabList = [];
  int listIterator = 0;
  
  void addWord(String word) {
    _vocabList.add(word.trim());
  }
  
  List get vocabularyList => _vocabList;
  
  String showNext() {
    String nextWord = _vocabList[listIterator];
    listIterator++;    
    return nextWord;
  }
  
  String showPrevious() {
    String previousWord = _vocabList[listIterator];
    listIterator--;
    return previousWord;
  }
  
}


class Declensions {
    
    Declensions(){}    
    // Singular Declensions.
    Map get fdts => fDecTabSi;
    Map get mdts => mDecTabSi;
    Map get ndts => nDecTabSi;
    // Plural Declensions.
    Map get fdtp => fDecTabPl;
    Map get mdtp => mDecTabPl;
    Map get ndtp => nDecTabPl;
    // Singular examples.
    Map get fdes => fDecExSi;
    Map get mdes => mDecExSi;        
    Map get ndes => nDecExSi;
    // Plural examples.
    Map get fdep => fDecExPl;
    Map get mdep => mDecExPl;
    Map get ndep => nDecExPl; 
    
    // Declension endings, singular.
    static Map<List,List> fDecTabSi = new Map.fromIterables(declensions, feminineDeclensionsSingular);  
    static Map<List,List> mDecTabSi = new Map.fromIterables(declensions, masculineDeclensionsSingular);
    static Map<List,List> nDecTabSi = new Map.fromIterables(declensions, neuterDeclensionsSingular);
    // Declension endings, plural.
    static Map<List, List> fDecTabPl = new Map.fromIterables(declensions, feminineDeclensionsPlural); 
    static Map<List, List> mDecTabPl = new Map.fromIterables(declensions, masculineDeclensionsPlural);
    static Map<List, List> nDecTabPl = new Map.fromIterables(declensions, neuterDeclensionsPlural);
    // Declension examples, singular.
    static Map<List,List> fDecExSi = new Map.fromIterables(declensions, femDecExamplesSingular);
    static Map<List,List> mDecExSi = new Map.fromIterables(declensions, mascDecExamplesSingular);
    static Map<List,List> nDecExSi = new Map.fromIterables(declensions, neutDecExamplesSingular);
    // Declension examples, singular.
    static Map<List,List> fDecExPl = new Map.fromIterables(declensions, femDecExamplesPlural);
    static Map<List,List> mDecExPl = new Map.fromIterables(declensions, mascDecExamplesPlural);
    static Map<List,List> nDecExPl = new Map.fromIterables(declensions, neutDecExamplesPlural);
    
    // Declensions.
    static final List<String> declensions =[
      "Nominative", 
      "Accusative",
      "Genetive",
      "Prepositional",                     
      "Dative",
      "Instrumental"
    ];
    
    // Masculine Declensions.
    static List<String> masculineDeclensionsSingular = [ 
      " -, o, e, ь",
      " *see below",
      " а, я",
      " е, и",
      " у, ю",
      " ом, ем"
    ];
    static List<String> masculineDeclensionsPlural = [
      " ы, и",
      " *see below",
      " ов, ев, ей",
      " ах, ях",
      " ам, ям",
      " ами,ями"
    ];
    
    static List<String> mascDecExamplesSingular = [
      " стол   музей  брат" ,
      " стол   музей  брата",
      " стола  музея  брата",
      " столе  музеи  брате",
      " столу  музею  брату",
      " столом музеем братом"
    ];
    static List<String> mascDecExamplesPlural = [
      " столы   музеи  братья" ,
      " столы   музеи  братьев",
      " столов  музеев  братьев",
      " столах  музеях  братьях",
      " столам  музеям  братьям",
      " столами музеями братьями"
    ];
    
    // Feminine Declensions, Singular.
    static List<String> feminineDeclensionsSingular = [
      " а, я",
      " у, ю",
      " ы, и",
      " е, и",
      " е, и",
      " ой, ей"
    ];
    static List<String> feminineDeclensionsPlural = [
      " ы, и",
      " *",
      " -, ей",
      " ах, ях",
      " ам, ям",
      " ами, ями"
    ];
        
    static List<String> femDecExamplesSingular = [
      " книга  земля",
      " книгу  землю",
      " книги  земли",
      " книге  земле",
      " книге  земле",
      " книгой землей"
    ];
    static List<String> femDecExamplesPlural = [
      " книги  земли",
      " книги  земли",
      " книг  земель",
      " книгах  землях",
      " книгам  землям",
      " книгами землями"
    ];

    // Neuter Declensions.
     static List<String> neuterDeclensionsSingular = [ 
       " o, e",
       " о, е",
       " а, я",
       " е, ё",
       " у, ю",
       " ом, ем"
     ];
     
     static List<String> neuterDeclensionsPlural = [
       " а, я",
       " а, я",
       " -, й",
       " ах, ях",
       " ам, ям",
       " ами, ями"
     ];
     
     static List<String> neutDecExamplesSingular = [
       " слово окно" ,
       " слова окна",
       " слово окно",
       " слове окне",
       " слову окну",
       " словом окном"
     ];
     static List<String> neutDecExamplesPlural = [
       " слова окна" ,
       " слов окон",
       " слова окна",
       " словах окнах",
       " словам окнам",
       " словами окнами"
     ];
    
  }

