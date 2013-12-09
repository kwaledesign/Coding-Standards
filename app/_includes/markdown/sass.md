# Sass Guidelines

The guidelines here should be taken in context with the [CSS Guidelines](css.md) as each of these are inter-related. This document will focus primarily on the usage of Sass to implement OOCSS/SMACSS principles. Without those underlying fundamentals, Sass will only complicate and compound the issues involved in a poorly constructed CSS architecture. Additionally, improper Sass implementation can easily lead to bloated output and lengthy selectors which not only inflates file size, but also causes JavaScript to work less efficiently causing performance issues for end users. The following guidelines are intended to help ensure user centered goals and performance always take precedence over developer convenience when building with Sass. 

## Comments
SCSS supports both invisible and visible comments. 

* Use `//` comment syntax to omit comments from output.
* Use the standard `/* */` CSS comments in your SCSS to keep comments in the CSS output unless output is set to compressed in which case all comments will be stripped out.
* Use the `/*! */` comment syntax, to ensure comments will remain regardless of output setting.

## General Principles

* SCSS syntax is preferred, but always omit file prefixes when including partials to allow for easy conversion between SCSS and Sass syntaxes. 
* Use an abstraction layer or library (i.e. Compass) to consistently apply CSS3 vendor prefixes and allow for easy updates.
* Leave your generated CSS file uncompressed until production and monitor it closely to ensure you aren't introducing bloated code or overly verbose selector strings.
* Prefix custom functions and mixins to avoid collisions with other frameworks or plugins.
* Compass image files extension helper and sprite generator is your friend.

## Nesting Selectors

* Limit nesting to two or three levels deep. Reassess any nesting more than two levels deep. This prevents overly-specific CSS selectors.
* Avoid large numbers of nested rules. Break them up when readability starts to be affected.
* When nesting, list your parent specific declarations directly under the class selector and then list the indented child selectors 
* Only use nesting when you intend for nested CSS selectors.
* Never emulate HTML structure of a module with SCSS nesting. Mapping Sass selectors directly to your DOM structure creates a brittle architecture that is tightly coupled to the current HTML markup.
* Nested parent selectors should be listed directly under the class selector and then indent child selectors [[17]](/#works-cited).


{% highlight sass %}
  .module {
      background: $module--color-bg; 
      p {
          margin-bottom: 0;
          line-height: 1.5em;     
      }
  }
{% endhighlight %}

## Variables

* Use a variable for any repeated CSS value and look for patterns to abstract in order to reinforce maintainability, as well as consistency. 
* Prefix color variables rather than using the specific color name, i.e. `$brand-blue` opposed to `$blue`.
* When defining a color tone, tint, or shade of a previously defined color variable the modifier should follow the initial variable name and use `--` (double dashes) to represent the modifier, i.e. `$brand-blue--light` opposed to `$light-brand-blue`.
* Avoid explicitly assigning a property to a color variable name. Create two levels of abstraction - the lower level abstraction defines the color name; and the higher level abstraction defines the component property.

Example:

{% highlight sass %}
  /**
   * Variables
   */

  $brand-gray: #999999;
  $brand-gray-light: #E5E5E5;

  $nav-color-primary: $brand-gray;
  $nav-color-secondary: $brand-gray-light;
{% endhighlight %}

* When defining variables, they should appear first at the top of their component's partial file and be grouped by skin and structure.
* 'Global' variables, those used by many components within multiple different partial files, should be given their own partial file inside the `base/` directory [for example](https://github.com/kwaledesign/Archetype/tree/master/sass/base): `_color-pallet.scss`, `_typography-pallet.scss`.


### Variable Syntax
Use the [same BEM-style](/css/#selector-construct) syntax used for CSS selectors, i.e. `$object__element--property: css-value;`. Variable names should list there common properties first followed by unique properties.

Example:

{% highlight sass %}
  /**
   * Button Skin Variables
   */
  $btn--color-bg:                               pink;
  $btn--color-txt:                              pink;
  /* State Variables */
  $btn--color-bg-hover:                         darken($btn--color-bg, 10%);
  $btn--color-bg-disabled:                      lighten($btn--color-bg, 25%);
{% endhighlight %}

## @mixin
* Use a `@mixin` when you wish to apply arguments to its code block, when you want that chunk of styles to apply to the selector, or when you don't want an additional class in the HTML.
* When writing mixins, limit arguments to 4 unless you have a good reason for additional complexity.
* Use a small number of property-value pairs because they will be output everywhere the mixin is called and potentially bloat your code base.
* Mixins with multiple arguments can be placed on their own line for greater readability. 
* As always, monitor the CSS output to ensure it matches the intention of your Sass code.

Example:

{% highlight sass %}
  @mixin mixin-name(
  $mixin-arg1,
  $mixin-arg2,
  $mixin-arg3,
  $mixin-arg4) {
    property: $mixin-arg1;
    property: $mixin-arg2;
    property: $mixin-arg3;
    property: $mixin-arg4;
  }
{% endhighlight %}

## @extend
* @extend when you want to extend
* Use `@extend` when no arguments are necessary. 

* Be cautious using `@extend`. Improper usage can easily cause bloated output and/or extremely lengthy selector strings. 
* Never nest an `@extend` within another `@extend`
* Avoid using `@extend` within a mixin - this can easily lead to nested `@extend`'s
* Never use `@extend` for the simplification of (OOCSS) multi-class constructs to build single-class objects. This is dangerous because it can easily produce very bloated output and complicated selector strings. This technique should be avoided until a native browser implementation of `@extend` is available [[29]](/#works-cited).

Example misuse of `@extend`:


{% highlight sass %}
  .btn-signup {
    @extend btn;
    @extend btn--full;
    @extend btn--large;
    @extend btn--primary;
  }
{% endhighlight %}

## %Place-holder Selectors
* Use `%` (the silent selector) when defining a utility class that may not be used - this will keep its code block out of the output until it is extended.

## Ordering
Consistent ordering of `@`-rules and properties leads to increased readability and more meaningful diffs.

  1. Variables
  2. `@`-Rules (extends first followed by mixin includes)
  3. Properties
  4. State Styles, i.e. `&.is-active`
  5. Object Elements, i.e. `nav__item`

Example:


{% highlight sass %}
  .selector {
    @extend %utility-class;
    @include mixin-name(mixin-arguments);
    property: value; 
    &.is-disabled {
      @include disabled-mixin(mixin-arguments);
      property: value;   
    }
    & > object__element {
      @extend %utility-class;
      property: value;
    }
  }
{% endhighlight %}

## Sass Packages and Modules

* Every Sass module must have a name-space consistently applied as a prefix to avoid collisions with other modules. Prefix should be short, yet descriptive. 
* Importing a module should not render any selectors
* A Sass module should be broken up by functionality so that components of the package can be imported separately, i.e. `@import "compass/css3";`
* Avoid global variables when possible and use name-spaces when they are necessary. 
* Use placeholders selectors whenever possible.

