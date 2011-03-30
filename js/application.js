var iTerm2 = {

  sammifyNavBarLinks: function() {
    $('#navbar a').each(function() {
      $(this).attr('href', $(this).attr('href').replace(/^#/, '#/section/'));
    });
  },

  app: $.sammy(function() {

    this.get('#/section/:section', function() {
      $('#navbar a[href="#/section/' + this.params.section + '"]')
        .siblings('a').removeClass('selected').end()
        .addClass('selected');

      $('#' + this.params.section)
        .siblings('article').hide().end()
        .show();
    });

    this.get('#/section/:section/:sub', function() {
      $('#navbar a[href="#/section/' + this.params.section + '"]')
        .siblings('a').removeClass('selected').end()
        .addClass('selected');
      $('#' + this.params.section)
        .siblings('article').hide().end()
        .show();
      if (this.params.section == "features") {
        showFeature(this.params.sub)
      }
    });
  })

};

$(function() {
  iTerm2.sammifyNavBarLinks();
  iTerm2.app.run('#/section/home');
});
