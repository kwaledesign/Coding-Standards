Coding Standards
================

* [General Guiding Principles](/README.md)
* [HTML](/html.md)
* [CSS](/css.md)
* [Sass](/sass.md)
* [Progressive](/pe.md)
* [git](/git.md)

<hr>

# CSS Guidelines

The purpose of this document is to outline a collection of opinionated
best-practices and methodologies for building object-oriented CSS archetectures
for Drupal builds that are highly scalable and easily maintained. 

## Table of Contents
1. [General principles](#general-principles)
  * [Whitespace](#whitespace-and-comments)
  * [Formating](#formating)
  * [Exceptions](#exceptions)
2. [Preprocessors](#preprocessors)
3. [Archetecture](#archetecture)
  * [Object Oriented CSS (OOCSS)](#object-oriented-css)
  * [Naming Conventions and Structure](#naming-conventions-and-structure)
  * [Selector Construct and Specificity](#selector-construct-and-specificity)
4. [Practical example](#practical-example)
5. [Works Cited](README.md#works-cited)
6. [License](#license)

# General Principles

## Whitespace and Comments
The key to portable code is in carefully documenting each components purpose,
  how it works, and if necessary its intended markup pattern. 

Example:

```css
/* ==========================================================================
   Section comment block
   ==========================================================================
*/

/* Sub-section comment block
   ========================================================================== */

/**
* Short description using Doxygen-style comment format
*
* The first sentence of the long description starts here and continues on this
* line for a while finally concluding here at the end of this paragraph.
*
* The long description is ideal for more detailed explanations and
* documentation. It can include example HTML, URLs, or any other information
* that is deemed necessary or useful.
*
* @tag This is a tag named 'tag'
*
* @todo This is a todo statement that describes an atomic task to be completed
*  at a later date. It wraps after 80 characters and following lines are
*  indented by 2 spaces.
*/

/* Basic comment */
`````

* Object-Extension Pointer - when extending a module within a separate
  stylesheet, leave a comment pointing to the original base object in order to
  establish a concrete link between the object and its extension [[13]](README.md#works-cited).

Example:
```
/**
 * Extension of the .foo object in _bar.scss
 */
 .foo__bar {...}
```

## Formating
* Use one seletor per line in multi-selector rulesets.
* Use one space before the opening brace of a ruleset.
* Include one declaration per line in a declaration block.
* Use one level of indentation for each delaration.
* Use one space after the colon of a declaration.
* Use lower-case, shorthand hex color codes (ex: #000), or rgba().
* Use double quotes for quoted attribute vaules in selectors; ex:
  'input[type="checkbox"]'
* _Where allowed_, avoid specifying units for zero-values ex: 'margin: 0;'.
* Follow every comma with a space for comma-seperated property or function
  values.
* Include a semi-colon at the end of the last declaration in a declaration
  block.
* Place the closing brace of a rulset in the same column as the first charater
  of the ruleset.
* Seperate each ruleset with a blank line.
* Declaration Order - CSS rulesets should be grouped by function - positioning
  rules, box-model rules, skin rules. 
* Units
  * Either `em's`, or `px's` may be used for `font-size`. Both allow the user
    to change the default font size within their browser, which is what we
    want. Also effective is to use a Sass mixin to define `font-size` in `rems`
    with a fall-back to `px's` for browsers lacking support.
  * Use unit-less 'line-height' because it does not inherit a percentage value
    of its parent element - it's based on a mulitiplier of the 'font-size'.
  * For all other measures try to use 'em''s, to best create a responsive
    system that scales to it's screen size.
  * Avoid absolute measurements.  For example, by using `.dropdown-nav li:hover
    { top: 37px; }` you are coding a single point of failure into your
    interface. Instead, build with flexibility in mind by using `.dropdown-nav
    li:hover { top: 100%; }` [[13]](README.md#works-cited).
  * Use [Modular
    Scales](http://www.alistapart.com/articles/more-meaningful-typography/) to
    help define your proportional rhythms within your designs. The [Sassy
    Modular Scale](https://github.com/scottkellum/modular-scale) Ruby Gem makes
    working with Modular Scales easy. 
>"By using culturally relevant historically pleasing ratios to create modular
>scales and basing the measurements in our compositions on values from those
>scaleswe can achieve a visual harmony not found in layouts that use
>arbitraryconventionalor easily divisible numbers." - [Tim Brown](http://www.alistapart.com/articles/more-meaningful-typography/)

### Exceptions
Large blocks of single declarations can use a slightly different single-line
format. In this casea space should be included after the opening brace and
before the closing brace.

Example:
```css
.selector-1 { width: 10%; }
.selector-2 { width: 20%; }
.selector-3 { width: 30%; }
```
Long comma-separated property values - such as collections of gradients or
shadows - can be arranged across multiple lines in an effort to improve
readability and produce more useful diffs.

Example:
```css
.selector {
  background-image:
    linear-gradient(#fff#ccc),
    linear-gradient(#f3c#4ec);
  box-shadow:
    1px 1px 1px #000,
    2px 2px 1px 1px #ccc inset;
}
```

# Architecture

## Working with Partials
Partials in Sass begin with an underscore and are not compiled into final
output unless they are included within a Sass file. Using Sass `@import` includes
all partials after compiling and does not incure an additional http request as
they do in regular CSS. For this reason, partials should be used for all base,
component, and layout styles. These partials should then be included into
a single core Sass file which provides the opportunity to easily turn styles on
and off as needed. When including partials within your base stylesheet, leave
off the file extension to allow for easier conversion between Sass and SCSS
syntaxes if you ever need to do so [[17]](README.md#works-cited).

## Object Oriented CSS (OOCSS)
>"[A] CSS “object” is a repeating visual patternwhich can be abstracted into an
>independent snippet of HTML CSS and possibly JavaScript. Once created an object
>can then be reused throughout a site." - [Nichole
>Sullivan](https://github.com/stubbornella/oocss/wiki)

### Two Main Principles of OOCSS
1. Seperation of Structure from Skin - distinquish between structure styles
   (box-model) and skin styles (color, font, gradients) and abstract these
   styles inot class-based modules to allow re-use [[6]](README.md#works-cited).
2. Seperation of Container and Conent - avoid all explicit parent-child
   relationship within style declarations so that a module's style is not
   dependant upon its container which allows the module to be reused. 


## Naming Conventions and Structure
An effective naming convention explicitly communicates the context and function of the
entity being named. 

### Module

Module
: a discrete component of the page, i.e. navigation bar, carousel, dialog,
widget, etc. that sits inside of a layout component, or within another module.
each module should be designed to exist as a stand-alone compoenent, it should
not have any dependancies to its container, and it should be able to be
relocated on the page without breaking [[1]](README.md#works-cited).
* An independant entity that can be simple or compound (containing another
  block or multiple blocks)
* Must remain independant from siblings, children, and parents allowing for
  arbitrarily placement on the page. 
* Block name must be unique to project - only instances of same block can have
  same name.
* Re-using a block also means re-using its behavior. To use the same block with
  differing behavior requiers a modifier or a submodule.
* Never use HTML elements within css selectors or cascading selectors for
  multiple blocks - selectors must be context free.
* Block names must be consistient accross all programming languages necessary
  to impliment its view and functionality (same block name for CSS and JS)
* Avoid CSS ID seletors - blocks must remain-nonunique, able to appear multiple
  times on the page.
* JS - use data-attributes - blocks with similar behavior can be unequivically
  detected to apply the requiered dynamic behavior [[2]](README.md#works-cited).
* Module styles are indicated with the 'm-' prefix. Module styles should not
  declare any explicit size constraints, allowing the module to scale to it's
  parent container. When needed, explicit constraints may be applied to
  a module via layout style.

#### Element

Module Element
: a component of a module that performs a specific function

* Elements are context-dependant (only make sense within their parent block)
* Element name must be unique within the scope of its block
* Elements can be repeated within a block e.g. tabs or navigation elements
* Must have a unique name to be used within a css rule
* An element's class name includes its block-name and element-name to maintain
  the elements context, maintain control of the cascade, and avoid
  location-dependant selectors [[2]](README.md#works-cited).

#### Submodule

Submodule
: a variant of a module that inherits all the styles of its parent, but differs
in skin, layout, positioning, etc. By creating a subcomponent within an
existing module, modularity is maintained by avoiding location dependant
styles [[1]](README.md#works-cited).

* A module's submodules are child elements of the module and are prefixed
  with the full name of the module followed by `__` (double underscores). This
  clearly indicates a submodule's relationship to its module and also
  prevents the submodule's styles from applying outside of the module's
  scope.

Submodule Component
: an element of a submodule

#### Modifier

Modifier
: a trivial variant of a module or submodule applied as an additional class on
the root module, e.ge `&.modifier`. Useful for when the module or submodule
modification is insignificant enough not to warrant an entirely new module or
submodule.

* Distinguishes an alteration in style or application without creating an
  entier new block
* A property of a block or an element that alters its look or behavior.
* Multiple modifiers may be used at once.
* Most common example of a modifier is the Module state e.g. .is-active,
  .is-collapsed, .is-disabled.
* A modifier is an aditional css class for a block or element. This clearly
  indicates a modifiers relationship to its module or subcomponent and also
  prevents the modifiers styles from applying outside of its scope.
* Element and block modifiers are applied in the same way.
* Modifiers are chainable, but doing so is good indicator of re-evaluating the
  necessity for moving those styles into their own module or submodule.

#### State

State
: a state is a type of module modifier that is triggered by an action

* State based styles are indicated with the 'is-' prefix. These style
  declarations can be shared by CSS and JS files [[1]](README.md#works-cited).

#### Components

Module Component
: a general term that refers to a module's children - can be an element,
a submodule, a submodule's element, or another module. Module components make
up a module. 

Submodule Component
: a general term that refers to a submodule's children - can be an element,
another submodule or module. Submodule components makeup a module.

#### Component Modifiers
Use a multi-class pattern [[3]](README.md#works-cited) for compoenent modifiers in order to reduce the number of classes for a component when variations are scaled, to allow for easier
contectual based adjustments when necessary, and to help simplify class and
variable names. For example, state styles are extended via their own class,
rather than attaching a state-suffix to an existing module class.


### Layout
* All modules are fluid by their nature. They should never be given explicit
  width or height restraints.
* Heights should only be explicitly defined for elements which had dimensions
  before they entered the site; e.g. image, video. In all other cases use
  line-height instead which is far more flexible [[13]](README.md#works-cited).
* A module's width is determined by its parent container in the case of
  compound modules, or the grid system.
* The grid system should never have styles or box-model properties directly
  applied - grid items contain content, but are not content in themselves.
* Layout based styles are indicated with the 'l-' prefix in order to
  distinguish them from module or state styles [[1]](README.md#works-cited)
* Minor page components (modules) sit within majar components such as the
  header, or footer. Major page components are refered to as Layout styles

### Icons
* Icons do not belong in modules - By styling icons independently of the module
  where it was first used you are making an icon that can be used in future
  modules without the need for duplication of code.
* Split icon styles into ico-size & ico-img classes - Specifying icon size and
  image separately allows for maximum flexibility and minimal code
  repetition [[1]](README.md#works-cited).
* Use Compass to manage sprits easily.
* Sprited Icons should be added to empty elements, to elements that have their
  text hidden off canvus
  
## Selector Construct and Specificity
>"The problem with such a depth is that it enforces a much greater dependency
>on a particular HTML structure. Components on the page can’t be easily moved
>around" - [Jonathan Snook](http://smacss.com/book/applicability)

 Minimize "depth of applicability" in order to avoid over-reliance on
 a predefined HTML structure and hindering modularity and flexibility of
 modules. This also helps to prevent introducing potential specificity issues
 which are notoriously difficult to debug. When selectors are kept succinct, it
 also becomes easier to convert modules into templates for dynamic content [[1]](README.md#works-cited).

### Naming Pattern
* Classes used as JavaScript hooks are indicated with the 'js-' prefix.
  A 'js-' prefixed class should never be referenced in a stylesheet. They used
  exclusively from JS files [[3]](README.md#works-cited).

(or...use html5 custom data-attributes for js hooks!!??!!)
* Animate an interface using classes not inline styles Inline styles added by
  javascript are harder to update and maintainprefer to add classes using
  javascript.  CSS3 transitions can then handle any animations and if CSS3
  transitions are not supported the state will still be updated.  Source:
  [SMACSS on state](http://smacss.com/book/type-state)

**Pattern**
```
prefix-module-name
prefix-module-name.modifer-name
prefix-module-name--element-name
prefix-module-name--element-name.modifier-name
prefix-module-name__submodule-name
prefix-module-name__submodule-name.modifier-name
prefix-module-name__submodule-name--element-name

.is-state-name
.js-behavior-name

```
Example:
```
.m-current-events {...}
.m-current-events.is-collapsed {...}
.m-current-events--header {...}
.m-current-events--header.no-border {...}
.m-current-events__featured-story {...}
.m-current-events__featured-story--pull-quote {...}
.m-current-events__featured-story--pull-quote.no-border {...}
``` 
**Note:** _while this BEM [[2]](README.md#works-cited) like syntax is fairly complex, it explicitly communicates the function and conetext of the entity, as well as its
relationship to both child and parent components while avoiding deeply nested
selectors that tie content to container and make assumptions about markup.
This of course would make our code less modular. Here, we sacrifice simple
selectors in order to preserve our objected oriented principles. This is
a solid trade off when you take into account [IDE
Snippets](https://github.com/kwaledesign/SCSS-Snippets) and the fact that GZIP
handles repetition very well._

### CSS Class Semantics
Class names should remain content-independant[[3]](README.md#works-cited). By avoiding tightly coupled
class names and content semantics, code is more easily reused and modularized
to allow for increased scalability of your archetecture.  Because the most
reusable code components are those with content-independant class names, class
names should be derived from repeating structural or functional patterns. 

>"We shouldn't be afraid of making the connections between layers clear and
>explicit rather than having class names rigidly reflect specific content.
>Doing this doesn't make classes "unsemantic", it just means that their
>semantics are not derived from the content." - [Nicolas
>Gallager](http://nicolasgallagher.com/about-html-semantics-front-end-architecture/)

This notion is not necessarily in conflict with the goals of the SMACSS
goals of 
1. Increasing semantic value of a section of html and content, and 
2. Decrease the expectation of a specific HTML structure.

The distinction is that the HTML class attributes are semantic in the way they
convey meaning to the developer, rather than the content. Content receives it's
semantic value from its markup (HTML tags and ARIA attributes). Code receives
its semantic value from its classes.

The goal, of course is to maximize modularity of code, creating scalable CSS
archetyecture.

#### Specificity Guidelines

* Avoid using ID selectors within CSS selectors. [Sin and
  Syntax](http://www.kwaledesign.com/articles/sin-and-syntax)
* Do not use location based selectors. A location based selector is a selector
  that changes a modules appearance based on its location or region
  (main-content, side-bar, footer, etc).  Where a module has different
  appearances use a module subclass.  If the appearance and/or content is very
  different it would be better to use a different module [[17]](README.md#works-cited).
* Always namespace state class names e.g. `.disabled`, `.mousedown`, `.hover`,
  `.selected`, and `.collapsed`. ex: `.button.is-disabled`, never explicitly
  style `.is-disabled`.
* Minimise the use of element selectors - Selectors that contain elements
  tightly coupled the CSS to specific markup. It is not a safe assumption that
  the semantics of the content will never change so authors should prefer
  classes which exist independent of markup and create more flexible CSS [[1]](README.md#works-cited).
* !important should be avoided as much as possible. State classes are the only
  acceptable use of important [[1]](README.md#works-cited).
* Never qualify a selector with an element selector e.g. `ul.nav`, as this
  decreases selector performance, creates a context dependency, and increases
  the selector's specificity. These are all things to be avoided [[1]](README.md#works-cited) [12](README.md#works-cited).


## Practical example

An example of various conventions.

```css
/* ==========================================================================
   Grid layout
   ========================================================================== */

/**
* Column layout with horizontal scroll.
*
* This creates a single row of full-heightnon-wrapping columns that can
* be browsed horizontally within their parent.
*
* Example HTML:
*
* <div class="grid">
*   <div class="cell cell-3"></div>
*   <div class="cell cell-3"></div>
*   <div class="cell cell-3"></div>
* </div>
*/

/**
* Grid container
* Must only contain `.cell` children.
*/

.grid {
  height: 100%;
  /* Remove inter-cell whitespace */
  font-size: 0;
  /* Prevent inline-block cells wrapping */
  white-space: nowrap;
}

/**
* Grid cells
* No explicit width by default. Extend with `.cell-n` classes.
*/

.cell {
  position: relative;
  display: inline-block;
  overflow: hidden;
  box-sizing: border-box;
  height: 100%;
  /* Set the inter-cell spacing */
  padding: 0 10px;
  border: 2px solid #333; 
  vertical-align: top;
  /* Reset white-space */
  white-space: normal;
  /* Reset font-size */
  font-size: 16px;
}

/* Cell states */

.cell.is-animating {
  background-color: #fffdec;
}

/* Cell dimensions
   ==========================================================================
*/

.cell-1 { width: 10%; }
.cell-2 { width: 20%; }
.cell-3 { width: 30%; }
.cell-4 { width: 40%; }
.cell-5 { width: 50%; }

/* Cell modifiers
   ========================================================================== */

.cell--detail,
.cell--important {
  border-width: 4px;
}
```

