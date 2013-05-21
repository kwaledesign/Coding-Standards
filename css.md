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

The purpose of this document is to outline a collection of opinionated best-practices and methodologies for building object-oriented CSS architectures that are both highly scalable and easily maintained. Encapsulation is the key to achieving these objectives of modularity which is why all entities within a design system are defined as components, even ones that are non-visual.

# General Principles

## Whitespace and Comments
The key to portable code is in carefully documenting each components purpose,
  how it works, and if necessary its intended markup pattern. Comment sections and subsections are optional, but often not needed when code is segregating into dedication Sass partials. In that case, it is perfectly acceptable to exclusively use the major and minor comment blocks.

Example:

```css
/* ==========================================================================
   Section comment block
   ==========================================================================
*/

/* Sub-section comment block
   ========================================================================== */
```


```css
/**
* Major Comment Block
*
* The first sentence of the long description starts here and continues on this
* line for a while finally concluding here at the end of this paragraph.
*
* The long description is ideal for more detailed explanations and
* documentation. It can include example HTML, URLs, or any other information
* that is deemed necessary or useful.
*
*/


/**
 * Minor Section Header
 */


/* Basic comment */

````

### Object-Extension Pointer
When extending a module within a separate partial, leave a comment pointing to the original base object in order to establish a concrete link between the object and its extension [[13]](README.md#works-cited).

Example:
```scss
/**
 * Foo-Bar
 *
 * Extends the .foo object within _foo-object.scss
 */
 .foo--bar {...}
```

## Formating
* Use one selector per line in multi-selector rulesets and separate each ruleset with a blank line.
* Use one space before the opening brace of a ruleset and place the closing brace of a ruleset in the same column as the first character of the ruleset and use one space after the colon of a declaration.
* Include one declaration per line and one level of indentation for each declaration.
* Use upper-case, hex color codes, i.e. `#FFFFFF`.
* Use double quotes for quoted attribute values in selectors; ex:
  `input[type="checkbox"]`
* _Where allowed_, avoid specifying units for zero-values ex: `margin: 0;`.
* Follow every comma with a space for comma-separated property values and include a semi-colon at the end of the last declaration in a declaration block.
* Declarations should be grouped by their function - positioning rules, box-model rules, etc.

### Exceptions
Large blocks of single declarations can use a slightly different single-line
format. In this case space should be included after the opening brace and
before the closing brace.

Example:
```css
.selector-1 { width: 10%; }
.selector-2 { width: 20%; }
.selector-3 { width: 30%; }
```
Long comma-separated property values - such as collections of gradients or
shadows - can be arranged across multiple lines in an effort to improve
readability and produce more useful diffs [[3]](README.md#works-cited).

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

### Units
* When building a responsive design system always try to use relative units to allow your system to scale to the user's screen size.
* Either `em's`, or `px's` may be used for `font-size`. Both allow the user
  to change the default font size within their browser, which is what we
  want. [rems](http://www.w3.org/TR/css3-values/#rem-unit), which have wide [browser support](http://caniuse.com/#search=rem), can be used within a Sass mixin to provide an em based falback for IE8 and Opera Mini.
* Use unit-less 'line-height' because it does not inherit a percentage value
  of its parent element - it's based on a multiplier of the 'font-size'. 
* Avoid absolute measurements.  For example, by using `.dropdown-nav li:hover
  { top: 37px; }` you are coding a single point of failure into your
  interface. Instead, build with flexibility in mind by using `.dropdown-nav
  li:hover { top: 100%; }` [[13]](README.md#works-cited).
* Consider using [Modular
  Scales](http://www.alistapart.com/articles/more-meaningful-typography/) to
  help define your proportional rhythms within your designs. The [Sassy
  Modular Scale](https://github.com/scottkellum/modular-scale) Ruby Gem makes
  working with Modular Scales easy. 

>"By using culturally relevant historically pleasing ratios to create modular
>scales and basing the measurements in our compositions on values from those
>scaleswe can achieve a visual harmony not found in layouts that use
>arbitraryconventionalor easily divisible numbers." - [Tim Brown](http://www.alistapart.com/articles/more-meaningful-typography/)

# Architecture

## Working with Partials
Partials in Sass begin with an underscore and are not compiled into final
output unless they are explicitly included within a Sass file. Using Sass `@import` includes
all partials after compiling and does not incur an additional http request as
they do in regular CSS. For this reason, partials should be used for all base,
component, and layout styles. These partials should then be included into
a single core Sass file which provides the opportunity to easily turn styles on
and off as needed. When including partials within your base stylesheet, leave
off the file extension to allow for easier conversion between Sass and SCSS
syntaxes if you ever need to do so [[17]](README.md#works-cited).

## Directory Structure

By categorizing CSS rules we begin to see patterns and can define better practices around each of these patterns [[1]](README.md#works-cited).

### Base
The base directory contains styles and settings that apply to the entire project. These include the `_color-pallet.scss` and `_typography-pallet.scss` partials as well as settings for compass and compass plugins. [Example Base Styles](https://github.com/kwaledesign/Archetype/tree/master/sass/base).


### Component
Components are the equivalent to Modules within the [SMACSS](smacss.com) methodology renamed here to avoid confusion with Drupal's terminology. Components are modular and reusable entities of a design system. Example components include buttons, call to actions, navigation elements, etc. Each component is defined within its own partial inside the component directory. [Example Component Styles](https://github.com/kwaledesign/Archetype/tree/master/sass/components). 


### Layout
Layout styles provide structure to (mobile-first) linear content. These styles are used to progressively enhance the basic layout when device capability, viewport and/or connection speed allow. Because layout is treated as an enhancement, these styles are kept separate from the components they enhance and are applied with their own class. Each component's layout is defined in its own partial inside the layout directory. Layout stylesheets are named by prefixing the component's name with `l-` in order to explicitly define the relationship between layout and component. [Example Layout Styles](https://github.com/kwaledesign/Archetype/tree/master/sass/layout).

### Object
Object styles are generic abstractions that can be extended to build a component. The classic OOCSS example is the media-object. Each object is defined within its own partial inside the object directory. [Example Object Styles](https://github.com/kwaledesign/Archetype/tree/master/sass/objects).

### Utilities
Utilities are code snippets abstracted into classes, functions, and mixins that provide specific functionality. Utilities include normalize, clearfix, css-triangles, etc. Utilities can be given their own directory within the project's root, or they can be abstracted into a Compass plugin or Bower component. Example: [Archetype-Utilities](https://github.com/kwaledesign/Archetype-Utilities).

### Temp
The temporary directory contains any styles that haven't yet been properly defined and organized within the project's architecture. This where any hacks or quick fixes belong.  Each 'fix' placed within this directory should be given its own partial and should be accompanied by a corresponding issue properly tagged and filed in the project's repository so that it can be properly incorporated into the code base at a later date. Preventing sub-standard code from being committed into the code base helps to prevent un-necessary depreciation as well as unintentionally introducing bugs by keeping these 'fixes' quarantined within the temp directory. [[25]](README.md#works-cited)

## Object Oriented CSS (OOCSS)
>"[A] CSS “object” is a repeating visual pattern which can be abstracted into an
>independent snippet of HTML CSS and possibly JavaScript. Once created an object
>can then be reused throughout a site." - [Nichole
>Sullivan](https://github.com/stubbornella/oocss/wiki)

### Two Main Principles of OOCSS
1. Separation of Structure from Skin - distinguish between structure styles
   (box-model) and skin styles (color, font, gradients) and abstract these
   styles in class-based modules to allow re-use [[6]](README.md#works-cited).
2. Separation of Container and Content - avoid all explicit parent-child
   relationship within style declarations so that a component's style is not
   dependant upon its container which allows the module to be reused [[6]](README.md#works-cited). 


#### Object Oriented Classes
Building complex components with smaller, more discrete code blocks leads to more reusable code, easier debugging, and a DRYer code base by cutting down on repetition. A component is comprised of object, structure, and skin. Class naming and [selector construct](#selector-construct) is very important. This syntax and naming convention illustrates the intention of a class and its relationship to others. 

Components use a multi-class pattern in order to allow for easier contextual based adjustments when necessary, and to help simplify class and variable names [[3]](README.md#works-cited). For example, structure, skin, and state styles are extended via their own class, rather than attaching a suffix to an existing component class.

In this way a component can be thought of as a specific combination of classes. Changing even one of these classes constitutes an entierly different component. For example, the same button component with two different skin classes is two different components. Additionally, an object could be represented as a single class or even a Sass `@extend` such as a clearfix. A component does not have to be a visual entity.

### Object Styles
Styles which remain consistent and unchanged within a component regardless of skin or structure.  These styles are abstracted and may be used as a foundation for building additional components. [Example Objects](https://github.com/kwaledesign/Archetype/tree/master/sass/objects). This is the base class that can be modified or extended with a structure and skin.

### Structure Styles
Styles which control a component's physical structure. Structure styles include any properties involving spacing which could potentially effect surrounding elements on the page, i.e. box-model properties. Structure classes extend an object class. There must be no dependencies between structure and skin.

### Skin Styles
Styles which control a component's visual appearance.  Skin styles include any properties involving color, typography, gradients, shadows, etc. Skin classes extend an object class. There must be no dependencies between skin and structure.

_Note: Sometimes the distinction between structure and skin is none-trivial. For example, the arrival of border-box has greatly simplified the box-model, but makes the border property a bit more difficult to define in this context because it no longer contributes to an element's width (structure). The best way to handle this is to split up border property defining border width and style as structure and border-color as skin. An example that makes this more clear is when building a tab component where the structure of the tab requires a transparent bottom border for the active tab and the skin of the tab requires a light gray border._

### Layout Styles
Styles that define how a component sits on the page. A component's layout class uses the `.l-` prefix followed by the component's name. Layout styles include width and grid layout.


## Naming Conventions and Structure
An effective naming convention explicitly communicates the context and function of the
entity being named. 

### Component
A discrete, independent entity designed to exist as a stand alone module without any depenedencies to its container. A component can be simple or compound (contain one or more components) and it should be able to be relocated on the page without breaking [[1]](README.md#works-cited). Example components include buttons, navigation bars, carousels, etc. An example of a compound component would be a search block composed of an input and a submit button [[2]](README.md#works-cited).

In order to maintain modularity a component must adhere to the following:

* Component styles must not declare any explicit size constraints, allowing the module to scale to it's parent container. A component can be placed inside a layout component, i.e. a grid; or extended with a layout class, but it must never be given an explicit width.
* A component must remain independent from siblings, children, and parents allowing for
  arbitrarily placement within a design system. This means that CSS ID Selectors must be avoided to allow components to remain non-unique (able to appear on the same page more than once). 
* A component's name must be unique to the project to ensure that only instances of the same component can have the same  name. Re-using a component also means re-using its behavior. To use the same component with differing behavior requires a new component.
* Selectors must remain context free and un-coupled to HTML by avoiding the use of elements within CSS selectors. HTML element styles are scoped by placing a class on either the element itself or on a parent container. This means all HTML element styles are opt-in (opposed to opt-out) making the only "default" HTML element styles are those applied by normalize, thus avoiding redundant overrides. This is explained in greater detail in [Opt-In-Typography](http://css-tricks.com/opt-in-typography/) and [Global Typographic Styles Suck](http://anthonyshort.me/2012/05/global-typographic-styles-suck). 


#### Element
An element is a context-dependant descendent of an object that performs a certain function and is represented by an additional class for a component or a descendent css selector. Elements are denoted by the use of `__` (double underscores) i.e. `.component-name__element-name` in order to maintain the elements context, maintain control of the cascade, and avoid location-dependant selectors [[2]](README.md#works-cited).

* Elements are context-dependant - they are only used within the context of their parent object.
* Element name must be unique within the scope of its object and must have a unique name to be used within a css rule
* Elements can be repeated within a component, i.e. tabs or navigation elements

Example:
```scss
.object__element {...}                          /* element class */

.object {
  & > li {...}                                  /* descendent selector */
  }

```

```html
<ul class="object">
  <li class="object__element">home</li>
</ul>

```

#### Sub-Object
A sub-object is a context-dependant sibling of an object that performs a certain function and is represented by an additional class for a component. Sub-objects are similar to elements in syntax and in relation to an object, but they differ significantly in the way that a sub-object extends or provides minor overrides to the object and is applied to the same HTML element. Sub-objects are denoted by the use of `__` (double underscores) i.e. `.component-name__sub-component-name`. 

* A variant of a component that inherits all the styles of its object, but differs by adding additional object styles, or providing minor overrides of its object.  When object overrides become significant, the creation of an additional object should be considered.
* A component's sub-component are siblings of the component and are prefixed
  with the full name of the parent component followed by `__` (double underscores). This
  clearly indicates a sub-object's relationship to its object and also
  prevents the sub-object's styles from applying outside of the object's
  scope.

Example:
```scss
.nav__pager {...}         /* Sub-Component */

```

```html
<ul class="nav nav__pager">
  ...
</ul>

```

### Object Extension
A significant variant of a component applied as an additional class on the component. Object extensions extend an object by applying additional styles related to either structure or skin. Extension classes are prefixed with the object's name followed by `--` (double dashes) and the extension name i.e. `.object--skin` or `.object--structure`.

Example:
```scss
.btn--primary {...}
.btn--large {..}

```

#### State
A state is a variant of a component that is triggered by an action or behavior.  State styles are applied dynamically as an additional class on the component's root or child HTML element.

* State based styles are indicated with the 'is-' prefix, i.e. `.is-active`, `.is-disabled`. These style declarations are be shared by CSS and JS files [[1]](README.md#works-cited).
* A component's state styles should be grouped with the component in the same partial.
* Multiple modifiers may be used at once.

Example:
```html
<button type="submit" class="btn btn--large btn--primary is-disabled">Submit</button>

```

Example:
```
<ul class="nav nav__vertical nav--large nav--primary">
  <li class="nav__element is-active">...</li>
</ul>

```

### Layout
* All components are fluid by nature and should never be given explicit width or height restraints. A component's width is determined by its parent container or grid system.
* Heights should only be explicitly defined for elements which had dimensions
  before they entered the site; e.g. image, video. In all other cases use
  line-height instead which is far more flexible [[13]](README.md#works-cited).
* The grid system should never have styles or box-model properties directly
  applied - grid items contain content, but are not content in themselves.
* Layout based styles are indicated with the `l-` prefix in order to
  distinguish them from module or state styles [[1]](README.md#works-cited)

### Icons
* Icons should be styled as independent entities to allow their use in _any_ component without the need for duplication of code.
* Icon styles should be split into structure and skin (`.ico-small` & `.ico-profile classes`) in order to allow for maximum flexibility and minimal code repetition [[1]](README.md#works-cited).
* Use Compass to manage sprits easily.
* Sprited Icons should be added to empty elements that have their text hidden off canvas.
* Use Compass to manage image directories easily


## Selector Construct
Selector construct must explicitly communicate the context and function of the entity being named. 

### Naming Pattern

BEM Syntax:
[[2]](README.md#works-cited)
[[3]](README.md#works-cited)
[[26]](README.md#works-cited)

```scss
// component name
.object {}                        /* represents the higher-level abstraction of a component */
.object__element {}               /* represents a descendent of .object */
.object__modifier {}              /* represents a modification of an object */
.object--extension {}             /* extends an object with a skin or structure */
&.is-active {}                    /* represents a change in the component's state (state-modifier) */
.prefix-component-name {}         /* targets all component entities i.e. for layout */

```

#### Example HTML

```html
<ul class="object object__modifier object--extension is-object-state">
  <li class="object__element is-active">...</li>
</ul>

```

#### Example Use Case

```scss
// large primary button (call to action button)
.btn {}                           /* button object */
.btn__full {}                     /* full width button (object modifier) */
.btn--large {}                    /* large button structure (object extension structure) */
.btn--primary {}                  /* primary button skin (object extension skin) */
&.is-disabled {}                  /* object state */
.l-btn--call-to-action            /* layout styles for call-to-action */

```

### BEM Style Sass Variable Syntax for Component Variables

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

**Note:** _while this BEM [[2]](README.md#works-cited) like syntax is fairly complex, it explicitly communicates the function and context of the entity, as well as its
relationship to both child and parent components while avoiding deeply nested
selectors that tie content to container and make assumptions about markup.
This of course would make our code less modular. Here, we sacrifice simple
selectors in order to preserve our objected oriented principles. This is
a solid trade off when you take into account [IDE
Snippets](https://github.com/kwaledesign/SCSS-Snippets) and the fact that GZIP
handles repetition very well._


### CSS Class Semantics

Class names should remain content-independent[[3]](README.md#works-cited). By avoiding tightly coupled class names and content semantics, code is more easily reused and modularized
to allow for increased scalability of your architecture.  Because the most
reusable code components are those with content-independent class names, class
names should be derived from repeating structural or functional patterns and never from the content. 

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
architecture.

### Specificity

>"The problem with such a depth is that it enforces a much greater dependency
>on a particular HTML structure. Components on the page can’t be easily moved
>around" - [Jonathan Snook](http://smacss.com/book/applicability)

 Minimize "depth of applicability" in order to avoid over-reliance on
 a predefined HTML structure and hindering modularity and flexibility of
 modules. This also helps to prevent introducing potential specificity issues
 which are notoriously difficult to debug. When selectors are kept succinct, it
 also becomes easier to convert modules into templates for dynamic content [[1]](README.md#works-cited).

#### Guidelines for Minimal Specificity

* Avoid using ID selectors within CSS selectors.
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


## Practical Example

#### Object
```scss
/**
 * Nav Object
 *
 */
.nav {
  &.nav__item {...}  
}
```

#### Component
```scss
/**
 * Articles Pager
 *
 * Pager component modifies the nav object in _nav-object.scss partial
 *
 * Markup Pattern:
 * <ul class="nav nav__pager nav__pager--large nav__pager--subtle">
 *   <li class="nav__pager--item is-active">1</li>
 *   <li class="nav__pager--item">2</li>
 * </ul>
 *
 */
.nav__pager {...}


/**
 * Pager Structure
 *
 * Extends the nav object defined in _nav-object.scss partial
 */
.nav__pager--large {...}


/**
 * Pager Skin
 *
 * Extends the nav object defined in _nav-object.scss partial
 */
.nav__pager--secondary {
  &.is-active {...}
}


```

#### Layout

```scss
/**
 * Pager Layout
 *
 * Extends the articles pager component in /components/_pager.scss partial
 */
.l-articles-pager {...}

```

#### HTML

```html
<ul class="nav nav__pager nav__pager--large nav__pager--subtle l-articles-pager">
  <li class="nav__pager__item is-active">1</li>
  <li class="nav__pager__item">2</li>
</ul>

```

