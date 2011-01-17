var iTerm2 = {};

iTerm2.app = $.sammy(function() {

  this.get('#:section', function() {
    console.log('Showing section ' + this.params.section);

    $('#navbar a[href="#' + this.params.section + '"]')
      .siblings('a').removeClass('selected').end()
      .addClass('selected');

    $('#' + this.params.section)
      .siblings('article').hide().end()
      .show();
  });

  this.get('', function() {
    this.redirect('#home');
  });

});

$(function() {
  iTerm2.app.run();
});
