Coding Standards
================

* [General Guiding Principles](/README.md)
* [HTML](/html.md)
* [CSS](/css.md)
* [Sass](/sass.md)
* [Progressive Enhancement](/pe.md)
* [git](/git.md)

<hr>

# Sass Guidelines
The guidelines here should be taken in context with the [CSS Guidelines](css.md) as each of these are inter-related. This document will focus primarily on the usage of Sass to implement OOCSS/SMACSS principles. Without those underlying fundamentals, Sass will only complicate and compound the issues involved in a poorly constructed CSS architecture. Additionally, improper Sass implementation can easily lead to bloated output and lengthy selectors which not only inflates file size, but also causes JavaScript to work less efficiently causing performance issues for end users. The following guidelines are intended to help ensure user centered goals and performance always take precedence over developer convenience. 

## Comments
SCSS supports both invisible and visible comments. 

* Use `//` comment syntax to omit comments from output.
* Use the standard `/* */` CSS comments in your SCSS to keep comments in the CSS output unless output is set to compressed in which case all comments will be stripped out.
* Use the `/*! */` comment syntax, to ensure comments will remain regardless of output setting.

## General Principles

* SCSS syntax is preferred, but always omit file prefixes when including partials to allow for easy conversion between SCSS and Sass syntaxes. 
* Use an abstraction layer or library (i.e. Compass) to consistently apply CSS3 vendor prefixes and allow for easy updates.
* Leave your generated CSS file uncompressed until production and monitor it closely to ensure you aren't introducing bloated code or overly verbose selector strings.
* Prefix custom functions to avoid collisions with other frameworks or plugins.
* Compass image files extension helper and sprite generator is your friend.

## Nesting Selectors

* Limit nesting to two or three levels deep. Reassess any nesting more than two levels deep. This prevents overly-specific CSS selectors.
* Avoid large numbers of nested rules. Break them up when readability starts to be affected.
* When nesting, list your parent specific declarations directly under the class selector and then list the indented child selectors 
* Only use nesting when you intend for nested CSS selectors.
* Never emulate HTML structure of a module with SCSS nesting. Mapping Sass selectors directly to your DOM structure creates a brittle architecture that is tightly coupled to the current HTML markup.
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

## Variables

* Use a variable for all color values to allow for reuse and consistentcy.
* Consider using a variable for other common vaules.
* Prefix color variables rather than using the specific color name, i.e. `$brand-blue` opposed to `$blue`.
* When defining a color tone, the modifier should follow the initial variable name and use `--` (double dashes to represent the modifier), i.e. `$brand-blue--light` opposed to `$light-brand-blue`.
* Avoid explicitly assigning a property to a color variable name. Instead, create two levels of abstraction - the lower level abstraction defines the color name; and the higher level abstraction defines the component property

Example:
```scss
/**
 * Variables
 */
$brand-gray: #999999;
$brand-gray-light: #E5E5E5;

$nav-color-primary: $brand-gray;
$nav-color-secondary: $brand-gray-light;

```

### BEM Style Sass Variable Syntax

```scss
$object__element--property:                   css-value;
$nav__pager__item--color-bg:                  pink;
$btn--negative--color1:                       pink;
$btn--positive--color1:                       pink;

$btn--large--border-radius:                   6px;
$btn--danger--color1:                         red;
$btn--disabled--danger--color1:               lighten(red, 15%);


.btn--danger {
  &.is-disabled { 
    background: lighten($btn--danger--color1, 15%);
  }  
}

```

## @mixin

* Use a `@mixin` when you wish to apply arguments to its code block, 
* When writing mixins, limit arguments to 4
* Mixins with multiple arguments can be placed on their own line for greater readability. 
* use caution with @mixins. Use with a small number of property value pairs because they will be output everywhere the mixing is called and quickly bloat your code base.
* Use a `@mixin` when you don't want the class in the html
* use @mixin when you want that chunk of stylesuse @extend when you want to extend
* Use `@extend` when no arguments are necessary. 
* Use `%` (the silent selector) when defining a utility class that may not be used - this will keep its code block out of the output until it is extended.


## @extend
* Be cautious using `@extend`. Improper usage can easily cause bloated output and/or extremely lengthy selector strings. 
* Never nest an `@extend` within another `@extend`
* Avoid using `@extend` within a mixin - this can easily lead to nested `@extend`'s
* Never use `@extend` for the simplification of (OOCSS) multi-class constructs to build single-class objects. This is dangerous because it can easily produce very bloated output and complicated selector strings. This technique should be avoided until a native browser implementation of `@extend` is available [[29]](README.md#works-cited).

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

## Sass Packages and Modules

* Every Sass module must have a name-space consistently applied as a prefix to avoid collisions with other modules. Prefix should be short, yet descriptive. 
* Importing a module should not render any selectors
* A Sass module should be broken up by functionality so that components of the package can be imported separately, i.e. `@import "compass/css3";`
* Avoid global variables when possible and use name-spaces when they are necessary. 
* Use placeholders selectors whenever possible.

