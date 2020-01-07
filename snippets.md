<!-- A HTML comment, appears in the rendered page's HTML source -->

<!-- A RST field list, http://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html#rst-field-lists -->
<!-- A field list preceding the document's visible content is treated as hidden metadata by Sphinx,  -->
<!-- http://www.sphinx-doc.org/en/master/usage/restructuredtext/field-lists.html#metadata  -->
<!-- An empty field named orphan prevents warnings if this page is not linked in the site TOC. -->
``` eval_rst
:orphan:
```

# Site snippets

<!-- A field list after the document's title is treated as docinfo (visible document metadata) by docutils: -->
``` eval_rst
:name:   Site snippets
:description:
  Miscellaneous examples of how to do things on this site.
  Follow the edit link to see the page source.
:author: The Author
:date:   2019-09-10
:another field:
    indented

    paragraphs

another field:
    without leading colon, does not have the field-even/field-odd class
```

## Commonmark

This site's native markup is [Commonmark](https://commonmark.org/) markdown,
via Sphinx's [recommonmark](https://recommonmark.readthedocs.io/en/latest/index.html) extension.
Here's Commonmark's syntax: <https://spec.commonmark.org/0.29/>

Forced line breaks:
write `<br>`<br>
or `\` (backslash)\
at line end.

## Restructured Text

Sphinx's native markup is Restructured Text.
Here's Sphinx's guide: <http://www.sphinx-doc.org/en/master/usage/restructuredtext/index.html>.

On this site, Restructured Text can be used inside a markdown literal block of type `eval_rst`
(due to recommonmark's [AutoStructify](https://recommonmark.readthedocs.io/en/latest/auto_structify.html#embed-restructuredtext)):

    ```eval_rst
    .. centered:: Centered text.
    ```

There's also a short form: write the RST directive (dots not necessary) at the start of an empty literal block (works for simple directives):

    ```centered:: Centered text.
    ```

E.g.,

```centered:: Centered text.
```

Here's a [Restructured Text (reST) and Sphinx CheatSheet](https://thomas-cokelaer.info/tutorials/sphinx/rest_syntax.html).

RST has more featureful literal blocks:
``` eval_rst
.. code-block:: shell
     :linenos:
     :emphasize-lines: 3,5
     :caption: A fancy highlighted code block.
     :name: Full code-block example

     # Comment line
     import System
     System.run_emphasis_line
     # Long lines in code blocks create a auto horizontal scrollbar
     System.exit!
```

Floating sidebars:
``` eval_rst
.. sidebar:: Sidebar Title
    :subtitle: Optional Sidebar Subtitle

    Subsequent indented lines comprise
    the body of the sidebar, and are
    interpreted as body elements.
```

``` sidebar:: Another Sidebar
    :subtitle: With a Subtitle

    Subsequent indented lines comprise
    the body of the sidebar, and are
    interpreted as body elements.
```

<br clear=all> `<br clear=all>` gets clear of floating things.

``` eval_rst
.. sidebar:: A sidebar containing a description list

     emphasis-lines:
       highlights the lines.
     linenos:
       shows the line numbers as well.
     caption:
       shown at the top of the code block.
     name:
       may be referenced with `:ref:` later.
```

A description list. Same as a field list ? If field names have no leading colon, values must be indented:
```eval_rst
emphasis-lines:
  highlights the lines.
linenos:
  shows the line numbers as well.
caption:
  shown at the top of the code block.
name:
  may be referenced with `:ref:` later.
```

<br clear=all>

```eval_rst
.. |renderdate| date::

Defining a text substitution, and the date directive.
This document was rendered on: |renderdate|.
```

