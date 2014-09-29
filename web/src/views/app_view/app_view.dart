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

  @observable String introBind = "Welcome, mofo.";
  @observable String nounBind = "Noun Declensions";
  @observable String verbBind = "Verb Conjugations";
  @observable String vocabBind = "Vocabulary";
  @observable String dicBind = "Dictionary";
  
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
}

