// hs.graphicsDir = '../js/highslide/graphics/';
// hs.outlineType = 'outer-glow';

/* show version links on user manual pages */
// TODO render server side in handlebars template, or at least render sooner to avoid render flash
// TODO drop jquery
// TODO old journal/csv/timeclock/timedot manuals should link to hledger.html for 1.21+
// hledger <1.0, which we no longer show docs for, had a single manual.html for all;
// the code to handle that has not been removed yet.
// hledger >=1.21 has a single hledger.html for hledger/journal/csv/timeclock/timedot.

$(document).ready( function() {
  addDocVersions();
  highlightCurrentDocVersion();
});

function addDocVersions() {
  var parts = window.location.pathname.split('/');
  var page = parts.length > 0 ? parts[parts.length-1].slice(0,-5) : '';
  var hash = window.location.hash.slice(1);
  var topic = (page=='manual' && hash) ? hash : page;
  var newhash = (page=='manual' && topic!='manual') ? ('#'+topic) : '';
  var newpage = page=='manual' ? page : topic;
  // var relpath1 = parts.includes("doc") ? "../../" : "";
  var relpath  = "/";  //parts.includes("doc") ? "../" : "doc/";
  // <a href="'+relpath1+newpage+'.html'+(page=='manual' ? newhash : '')+'">dev</a> \
  $('.docversions').html('\
<a href="'+relpath+'dev/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">dev</a> · \
<a href="'+relpath+'1.23/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.23</a> · \
<a href="'+relpath+'1.22/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.22</a> · \
<a href="'+relpath+'1.21/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.21</a> · \
<a href="'+relpath+'1.20/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.20</a> · \
<a href="'+relpath+'1.19/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.19</a> · \
<a href="'+relpath+'1.18/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.18</a> · \
<a href="'+relpath+'1.17/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.17</a> · \
<a href="'+relpath+'1.16/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.16</a> · \
<a href="'+relpath+'1.15/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.15</a> · \
<a href="'+relpath+'1.14/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.14</a> · \
<a href="'+relpath+'1.13/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.13</a> · \
<a href="'+relpath+'1.12/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.12</a> · \
<a href="'+relpath+'1.11/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.11</a> · \
<a href="'+relpath+'1.10/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.10</a> · \
<a href="'+relpath+'1.9/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.9</a>   · \
<a href="'+relpath+'1.5/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.5</a>   · \
<a href="'+relpath+'1.2/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.2</a>   · \
<a href="'+relpath+'1.0/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.0</a>     \
');
// <a href="'+relpath+'1.4/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.4</a>   · \
// <a href="'+relpath+'1.3/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.3</a>   · \
// <a href="'+relpath+'1.1/'+newpage+'.html'+(page=='manual' ? newhash : '')+'">1.1</a>   · \
// | <a href="'+relpath+'0.27/manual.html'+(topic=='manual' ? '' : ('#'+topic))+'">0.27</a> \
}

var currentrelease = '1.23';
function highlightCurrentDocVersion() {
  $('.docversions').each( function() {
    var parts = window.location.pathname.split('/');
    var dir = parts.length > 1 ? parts[parts.length-2] : '';
    var ver = $.isNumeric(dir) ? dir : (dir ? "dev" : currentrelease);
    $(this).find('a').each( function() {
      if ($(this).html() == ver)
        $(this).addClass('displayed');
    });
  });
}
