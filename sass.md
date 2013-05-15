Coding Standards
================

* [General Guiding Principles](/README.md)
* [HTML](/html.md)
* [CSS](/css.md)
* [Sass](/sass.md)
* [Progressive](/pe.md)
* [git](/git.md)

<hr>

# Sass Guidelines

* Use Compass CSS3 vendor prefixes, vertical rhythm, and sprites.
* Only use nesting when you intend for nested CSS selectors.
* Never mimick HTML structure of a module with SCSS nesting.
* Nested parent selectors should be listed directly under the class selector
  and then indent child selectors [[17]](README.md#works-cited).
  
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
* Leave your generated CSS file uncompressed until production and monitor it
  closely to ensure you aren't introducing bloated code or unintinsional
  nesting issues.
* Limit nesting to two or three levels deep. Reassess any nesting more than two
  levels deep. This prevents overly-specific CSS selectors.
* Avoid large numbers of nested rules. Break them up when readability starts to
  be affected.
* Always place `@extend` statements on the first lines of a declaration block.
* Group `@include` statements at the top of a declaration blockafter any
  `@extend` statements.
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

## Simplified Class Constructs

(re: muliti-class pattern aka OOCSS)

The simplification of class construct would be ideal and of course a developer centered goal. Sass does have `@extend` which can address this issue, but not without risk of heavy code bloat. Bloated CSS file size would of course violate a user centered goal, which is why the above OOCSS multi-class component construct is preferred. What we need is a native browser implimentation of `@extend`.

```scss
.btn-signup {
  @extend btn;
  @extend btn--full;
  @extend btn--large;
  @extend btn--primary;
}
```

**multi-class vs single-class [[3]](README.md#works-cited)**
.btn .btn--full .btn--large .btn--primary (multi)
.btn--full--large--primary


