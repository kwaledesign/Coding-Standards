Coding Standards
================

* [General Guiding Principles](/README.md)
* [HTML](/html.md)
* [CSS](/css.md)
* [Sass](/sass.md)
* [Progressive](/pe.md)
* [git](/git.md)

<hr>

# JavaScript Guidelines

* Block names must be consistent across all programming languages necessary
  to implement its view and functionality (same block name for CSS and JS)
* JS - use data-attributes - blocks with similar behavior can be unequivically
  detected to apply the required dynamic behavior [[2]](README.md#works-cited).

* Classes used as JavaScript hooks are indicated with the 'js-' prefix.
  A 'js-' prefixed class should never be referenced in a stylesheet. They used
  exclusively from JS files [[3]](README.md#works-cited).

(or...use html5 custom data-attributes for js hooks!!??!!)
* Animate an interface using classes not inline styles Inline styles added by
  javascript are harder to update and maintain prefer to add classes using
  javascript.  CSS3 transitions can then handle any animations and if CSS3
  transitions are not supported the state will still be updated.  Source:
  [SMACSS on state](http://smacss.com/book/type-state)




