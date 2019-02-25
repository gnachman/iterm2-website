console.log("iterm2 starting");
(function(document, history, location) {
    console.log("function called");
  var HISTORY_SUPPORT = !!(history && history.pushState);

  var anchorScrolls = {
    ANCHOR_REGEX: /^#[^ ]+$/,
    OFFSET_HEIGHT_PX: 80,

    /**
     * Establish events, and fix initial scroll position if a hash is provided.
     */
    init: function() {
        console.log("init called");
      this.scrollToCurrent();
      window.addEventListener('hashchange', this.scrollToCurrent.bind(this));
      document.body.addEventListener('click', this.delegateAnchors.bind(this));
        var x = this
        window.onload = function() {
            console.log("window.onload running -----------");
            x.scrollToCurrent();
        }
    },

    /**
     * Return the offset amount to deduct from the normal scroll position.
     * Modify as appropriate to allow for dynamic calculations
     */
    getFixedOffset: function() {
      return this.OFFSET_HEIGHT_PX;
    },

    /**
     * If the provided href is an anchor which resolves to an element on the
     * page, scroll to it.
     * @param  {String} href
     * @return {Boolean} - Was the href an anchor.
     */
    scrollIfAnchor: function(href, pushToHistory) {
        console.log("scrollIfAnchor");
      var match, rect, anchorOffset;

      if(!this.ANCHOR_REGEX.test(href)) {
          console.log("anchor regex failed");
        return false;
      }

      match = document.getElementById(href.slice(1));

        console.log("Checking for a match");
      if(match) {
          console.log("got a match");
        rect = match.getBoundingClientRect();
        anchorOffset = window.pageYOffset + rect.top - this.getFixedOffset();
          console.log("scroll from " + (window.pageYOffset) + " to " + (anchorOffset));
        window.scrollTo(window.pageXOffset, anchorOffset);
          console.log("pageY Offset is now " + window.pageYOffset);

        // Add the state to history as-per normal anchor links
        if(HISTORY_SUPPORT && pushToHistory) {
            console.log("push to history");
          history.pushState({}, document.title, location.pathname + href);
        }
      }

      return !!match;
    },

    /**
     * Attempt to scroll to the current location's hash.
     */
    scrollToCurrent: function() {
        console.log("scrollToCurrent");
      this.scrollIfAnchor(window.location.hash);
    },

    /**
     * If the click event's target was an anchor, fix the scroll position.
     */
    delegateAnchors: function(e) {
        console.log("delegateAnchors");
      var elem = e.target;

      if(
        elem.nodeName === 'A' &&
        this.scrollIfAnchor(elem.getAttribute('href'), true)
      ) {
        e.preventDefault();
      }
    }
  };

  window.addEventListener(
    'DOMContentLoaded', anchorScrolls.init.bind(anchorScrolls)
  );
})(window.document, window.history, window.location);

