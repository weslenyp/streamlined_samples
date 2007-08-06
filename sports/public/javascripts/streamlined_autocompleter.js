Streamlined.Autocompleter = Class.create();
Streamlined.Autocompleter.prototype = {
  initialize: function(selectId) {
    this.selectId = selectId;
    var newHtml = "<input type='text' id='TEXTID'/><div id='DIVID'/>".replace("TEXTID", this.textId()).replace("DIVID", this.divId());
    Element.hide(selectId);
    new Insertion.After(selectId, newHtml);
    this.initializeOptionValues();
    this.ac = new Autocompleter.Local(this.textId(), this.divId(), this.optionStrings, 
                                      {afterUpdateElement: this.autocompleteChange.bind(this)});
    Event.observe(this.textId(), "change", this.manualChange.bind(this));
  },
  
  // this never fires if the autocomplete changes the text...
  manualChange: function() {
    console.log("manualChange ", $(this.textId()).value);
  },
  
  //...but we can catch the autocomplete like this
  autocompleteChange: function(el, selected) {
    console.log("autocompleteChange", $(this.textId()).value);
  },
  
  initializeOptionValues: function() {
    var optionTags = Selector.findChildElements($(this.selectId), $A(["option"]))
    this.optionStrings = optionTags.map(function(node) {
      return node.text;
    });
    this.optionHash = optionTags.inject({}, function(accum, node) {
      accum[node.text] = node.value;
      return accum;
    });
  },
  
  textId: function() {
    return this.selectId + "__text";
  },

  divId: function() {
    return this.selectId + "__div";
  },

};