Coding Standards
================

* [General Guiding Principles](/README.md)
* [HTML](/html.md)
* [CSS](/css.md)
* [Sass](/sass.md)
* [Progressive](/pe.md)
* [git](/git.md)

<hr>

The following coding standards outline a collection of best practices and
methodologies for writing predictable, reusable, maintainable, and scalable
front-ends.

# General Guiding Principles for Front-end Design
* Front-end design principles must be clearly articulated so that the focus can be applied towards achieving project goals within the context of these. These principles should also be defined as user versus developer driven so that if they ever come into conflict, the user centric goals can persevere [[22]](#works-cited).
* All code in any code-base should appear as if the same person wrote it by remaining consistent in the application of coding standards.
* Naming conventions are extremely important and must be clearly defined and strictly adhered to. This facilitates easy use of grep and more meaningful diffs.

## User Centric Goals
Above all else, a site must be highly performant, widely accessibly, and device
agnostic. The achievement of these goals necessitates the understanding that
a site must not appear exactly the same on all browsers and devices.

### User Centric Objective
1. Adhear to standards as they are defined by the language specification
  * [W3C](http://www.w3.org/standards/)
  * [W3C CSS Modules](http://www.w3.org/Style/CSS/Overview.en.html)
  * [Web Platform](http://docs.webplatform.org/wiki/Main_Page)
  * [Standard ECMA-262](http://www.ecma-international.org/ecma-262/5.1/)
2. Apply [progressive enhancement](/pe.md) by serving core site content and
  functionality to all user agents and serving an enhanced experience built
  on top of the basic experience. Apply JavaScript to enhance the site with
  a richer experience when it is supported and enabled, but do not require it in
  order to complete any core tasks on the site.
3. Polyfill missing or broken features only as a last result.

## Developer Centric Goals
A code base must be maintainable, it must be readable, and it must be design
for modularity.

### Development Objectives
1. Minimize coupling between components by following [Object Oriented
  methodologies](#object-oriented-principles)
2. Design systems not pages by building a collection of components and layouts, which
  can be assembled together to create a specific experience. Avoid page-specific
  styling in favor of component modifiers and class extensions.
3. Easily maintain the project's design system by following style guide driven
  development [[20]](#works-cited) that is made with HTML and CSS, uses production
  CSS, and uses git for version control [[21]](#works-cited). A project's
  style guide should also be automatically updated to reflect changes in the code
  base and facilitate browser testing throughout the project development cycle.

### Object Oriented Principles
* **Single Responsibility Principle** - an object should have only a single
  responsibility, and that responsibility should be entirely encapsulated by
  the object [[7]](README.md#works-cited) [[8]](README.md#works-cited).
* **Open/Closed Principle** - entities (classes, modules, functions, etc.) are open
  for extension, but closed for modification. Base rules may be extended, but
  not directly modifiable. This is why directly styling HTML tags is not
  advisable - reduce the amount of global element styles in order to reduce the
  chances of breaking the open/closed principle [[7]](README.md#works-cited)
  [[9]](README.md#works-cited)
* **Liskov Substitution Principle** - objects should be replaceable with instances
  or their sub-components without breaking. Sub-components that `@extend`
  a module should be interchangeable with the base module itself. To keep true
  to this principle, a module's subcomponent(s) should never affect layout. For
  example: `.m-btn__primary--sign-up` should be interchangeable with `.m-btn`
   [[7]](README.md#works-cited).
* **Entity Segregation Principle** - If ever it becomes awkward to interchange
  a subcomponent with its base module, or if it becomes necessary to redefine
  too many properties, move the subcomponent into its own custom module. It is
  sometimes better to have multiple base modules opposed to a single generic
  module with multiple sub-components. Never make sacrifices in functionality
  in the name of utility  Taken too far, code abstraction becomes
  [[7]](README.md#works-cited) detrimental. When writing modular CSS, it's not about maintaining modularity
  in the actual code, but rather modularity in the actual design
  [[10]](README.md#works-cited).
* **DRY** - (don't repeat yourself) - aimed at reducing repetition of information of all kinds. Every piece of knowledge must have a single, unambiguous, and authoritative representation within the system.

## Whitespace and Comments
* Remain consistent with your use of whitespace for greater legibility of your
  code. Never mix spaces and tabs to adjust indentation.
* Use soft-tabs with a two space indent. This is in accordance with Drupal's
  coding standard [DrupalCC](http://drupal.org/coding-standards#indenting). To
  make this easy, this is set within your [Vim
  config](https://github.com/kwaledesign/dotfiles) (or equivalent).
* Place comments on their own line directly above the code they document.
* Limit line length the 80 characters (again via
  [DrupalCC](http://drupal.org/coding-standards#linelength))
* When ever necessary, breakup long code blocks into discrete sections
* Avoid adding end-of-line whitespace. Again, configure your IDE to make this
  easy.

<hr>

## Works Cited:
1. [SMACSS](http://smacss.com/)
2. [BEM](http://bem.info/)
3. [About HTML Semantics and Front-End
   Archetecture](http://nicolasgallagher.com/about-html-semantics-front-end-architecture/)
4. [Principles of Writing Consistent, Idiomatic
   CSS](https://github.com/necolas/idiomatic-css)
5. [Github - CSS style guide](https://github.com/style guide/css)
6. [Object Oriented CSS](https://github.com/stubbornella/oocss/wiki)
7. [SOLID CSS](http://blog.millermedeiros.com/solid-css/)
8. [The Single Responsibilty Principle Applied to
   CSS](http://csswizardry.com/2012/04/the-single-responsibility-principle-applied-to-css/)
9. [The Open/Closed Principle Applied to
   CSS](http://csswizardry.com/2012/06/the-open-closed-principle-applied-to-css/)
10. [One Module or
    Two](http://snook.ca/archives/html_and_css/one-module-or-two)
11. [Our CSS Best Practices are Killing
    Us](http://www.stubbornella.org/content/2011/04/28/our-best-practices-are-killing-us/)
12. [Quasi-qualified CSS
    Selectors](http://csswizardry.com/2012/07/quasi-qualified-css-selectors/)
13. [CSSWizardry CSS Guidelines](https://github.com/csswizardry/CSS-Guidelines)
14. [Organizing Mobile - Luke
    Wroblewski](http://www.alistapart.com/articles/organizing-mobile/) 
15. [Component-Based HTML/CSS Naming Patterns](https://gist.github.com/1309546)
16. [OOCSS](http://www.slideshare.net/stubbornella/object-oriented-css)
17. [Sass-Guidelines](https://github.com/blackfalcon/SASS-Guidlines/blob/master/SASS-Guidlines.md)
18. [Stylesheet organization with Sass](https://speakerdeck.com/chriseppstein/fowd-stylesheet-organization-with-sass)
19. [Idiomatic HTML](https://github.com/necolas/idiomatic-html)
20. [Style Guide Driven UI Design with Sass](https://speakerdeck.com/jina/style-guide-driven-ui-design-with-sass)
21. [Style Guide Driven
    Development](https://speakerdeck.com/hagenburger/style-guide-driven-development)
22. [Front-End Design Principles](http://clearleft.com/thinks/front-enddesignprinciples/)
23. [8 Guidelines and 1 Rule for Responsive Images](http://blog.cloudfour.com/8-guidelines-and-1-rule-for-responsive-images/)
24. [Conditional Classes for IE](http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/)
25. [Shame.css](http://csswizardry.com/2013/04/shame-css/)
26.
[Mindbembing - getting your head around BEM syntax](http://csswizardry.com/2013/01/mindbemding-getting-your-head-round-bem-syntax/)


### License:

CSS-style guide is licensed under the terms of the MIT
[license](https://github.com/kwaledesign/CSS-style guide/blob/master/LICENSE).
