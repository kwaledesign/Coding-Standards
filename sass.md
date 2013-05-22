Coding Standards
================

* [General Guiding Principles](/README.md)
* [HTML](/html.md)
* [CSS](/css.md)
* [Sass](/sass.md)
* [Progressive Enhancement](/pe.md)
* [git](/git.md)

<hr>

## Comments
SCSS supports both invisible and visible comments. Using `//` comment syntax will not be output in the processed CSS. Using the standard `/* */` CSS comments in your SCSS when processed this will be output in your CSS, unless you set your output to compressed in which case all comments will be stripped out. If you use the `/*! */` comment syntax, those comments will remain regardless of output setting.


# Sass Guidelines
* SCSS syntax is preferred, but always omit file prefixes when including partials to allow for easy conversion between SCSS and Sass syntaxes. 
* Use an abstraction layer or library (i.e. Compass) to consistently apply CSS3 vendor prefixes, vertical rhythm, and sprites and allow for easy updates.
* Only use nesting when you intend for nested CSS selectors.
* Never emulate HTML structure of a module with SCSS nesting.
* Nested parent selectors should be listed directly under the class selector and then indent child selectors [[17]](README.md#works-cited).
  
```
.fieldset {
    margin-bottom: 2em;
    p {
        margin-bottom: 0;
        line-height: 1.5em;     
    }
    legend {
        float: left;
        width: 100%;
    }
}
```
* Leave your generated CSS file uncompressed until production and monitor it closely to ensure you aren't introducing bloated code or overly verbose selector strings.
* Limit nesting to two or three levels deep. Reassess any nesting more than two levels deep. This prevents overly-specific CSS selectors.
* Avoid large numbers of nested rules. Break them up when readability starts to be affected.
* When nesting, list your parent specific declarations directly under the class selector and then list the indented child selectors 
* Always place `@extend` statements on the first lines of a declaration block.
* Group `@include` statements at the top of a declaration blockafter any `@extend` statements.
* Prefix custom functions to avoid collisions with Sass or Compass.
* Use a variable for all color values to allow for reuse and consistentcy.
* Consider using a variable for other common vaules.

Example:
```scss
.selector-1 {
  @extend .other-rule;
  @include clearfix();
  @include box-sizing(border-box);
  width: x-grid-unit(1);
  // other declarations
}
```
* Use a `@mixin` when you wish to apply arguments to its code block, use `@extend` when no arguments are necessary. Use `%` (the silent selector) when defining a utility class that may not be used - this will keep its code block out of the output until it is extended.
* When writing mixins, limit arguments to 4
* Mixins with multiple arguments can be placed on their own line for greater readability. 


## Simplified Class Constructs

(re: muliti-class pattern aka OOCSS)

The simplification of class construct would be ideal and of course a developer centered goal. Sass does have `@extend` which can address this issue, but not without risk of heavy code bloat. Bloated CSS file size would of course violate a user centered goal, which is why the above OOCSS multi-class component construct is preferred. What we need is a native browser implimentation of `@extend`.


* Be cautious using `@extend`. Improper usage can easily cause bloated output and/or extremely lengthy selector strings. 
*
* Never nest an `@extend` within another `@extend`
* Avoid using `@extend` within a mixin - this can easily lead to nested `@extend`'s
*

* Do not use `@extend` to build single class objects by extending multiple sub-classes because in doing so you will exponentially bloat your CSS output. In order to accomplish this we need a native implementation of `@extend` within CSS. Until then, it is best to sacrifice developer convenience for front-end performance [[29]](README.md#works-cited).

Example misuse of `@extend`:
```scss
.btn-signup {
  @extend btn;
  @extend btn--full;
  @extend btn--large;
  @extend btn--primary;
}
```

## Ordering
Consistent ordering of `@`-rules and properties leads to increased readability and more meaningful diffs.

* `$variable` should always appear at the top
* `@extend` should always appear before properties.
* `@include` should appear third.
* Properties should appear fourth allow them to override the mixin if necessary.
* State styles appear fifth, i.e. `&.is-active`.
* `Object__element` selectors appear last.


## Packages

* Every module must have a namespace
* Private functions and mixins should be prefixed with a dash: @mixin -rg-gridUnit
* Importing a module should not render any selectors
* Mixins/placholders/functions should be able to be imported separately @import "rg-Grid/mixins"
* Avoid relying on global variables.
* Use placeholder selectors whenever possible.
* All global variables must be namespaced.


## Namespacing

* Every selectorplaceholdermixin and function that is imported should be namespaced
* Namespaces should be short (2-5 characters) and suffixed with a dash: rg-Grid


