Mastering Markdown
==================

It's very easy to make some words **bold** and other words *italic* with Markdown. You can even [link to Google!](http://google.com)

Headers
-------

# This is an <h1> tag
## This is an <h2> tag
###### This is an <h6> tag

Emphasis
--------

*This text* will be italic
_This_ will also be italic

**This text** will be bold
__This__ will also be bold

***This text*** will be italic and bold
_You **can** combine them_

Any word wrapped with ~~two tildes~~ will appear crossed out.

Lists
-----

* Item 1
* Item 2
  * Item 2a
  * Item 2b

1. Item 1
1. Item 2
1. Item 3
   1. Item 3a
   1. Item 3b

Images & Links
--------------

![GitHub Logo](/images/logo.png)
Format: ![Alt Text](url)

http://github.com - automatic!
[GitHub](http://github.com)

Blockquotes
-----------

As Kanye West said:

> We're living the future so
> the present is our past.

Inline Codes
------------

I think you should use an
`<addr>` element here instead.

GitHub Specials: Syntax Highlighting
------------------------------------

```javascript
function fancyAlert(arg) {
  if(arg) {
    $.facebox({div:'#foo'})
  }
}
```

    function fancyAlert(arg) {
      if(arg) {
        $.facebox({div:'#foo'})
      }
    }

Task Lists
----------

- [x] @mentions, #refs, [links](), **formatting**, and <del>tags</del> supported
- [x] list syntax required (any unordered or ordered list supported)
- [x] this is a complete item
- [ ] this is an incomplete item

Tables
------

First Header | Second Header
------------ | -------------
Content from cell 1 | Content from cell 2
Content in the first column | Content in the second column