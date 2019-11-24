//= require jquery
//= require_tree .

$(document).ready(function(){
  $('textarea').each(function() {
    t = this
    autosize(t)
    editor = new Behave({
      textarea: t,
      replaceTab: true,
      softTabs: true,
      tabSize: 2,
      autoOpen: true,
      overwrite: true,
      autoStrip: true,
      autoIndent: true,
      fence: false
    });
  })
});
