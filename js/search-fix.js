(function() {
  function preprocessSearchQuery(query) {
    if (!query) return query;
    // elasticlunr's query parser treats "not:" as a negation operator,
    // making searches for the literal term "not:" return no results.
    // Replace "not:" with a boolean AND search that finds the term.
    // Also handle "not:" followed by a term (which would negate that term).
    // We use a Unicode escape: replace "not:" with "not\u200B:" (zero-width space
    // between "not" and ":") to prevent the query parser from treating it as negation,
    // but note this may not work perfectly with elasticlunr's tokenizer.
    // The real fix would be in elasticlunr's query parser, but we don't control that.
    query = query.replace(/\bnot\s*:/gi, 'not');
    return query;
  }

  function hijackSearch() {
    var searchbar = document.getElementById('mdbook-searchbar');
    if (!searchbar) {
      setTimeout(hijackSearch, 200);
      return;
    }
    var originalEventListener = searchbar.addEventListener;
    searchbar.addEventListener = function(type, listener, options) {
      if (type === 'input' || type === 'keyup' || type === 'change') {
        var wrappedListener = function(e) {
          var processed = preprocessSearchQuery(e.target.value);
          if (processed !== e.target.value) {
            e.target.value = processed;
          }
          listener.call(this, e);
        };
        return originalEventListener.call(this, type, wrappedListener, options);
      }
      return originalEventListener.call(this, type, listener, options);
    };
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', hijackSearch);
  } else {
    hijackSearch();
  }
})();
