Coding Standards
================

* [General Guiding Principles](/README.md)
* [HTML](/html.md)
* [CSS](/css.md)
* [Sass](/sass.md)
* [Progressive](/pe.md)
* [git](/git.md)

<hr>

# Progressive Enhancement Guidelines

## Progressive Enhancement
* Develope for _Mobile First_ [[14]](#works-cited) as a baseline level of support for small screens and slow connections, emphasize content over navigation, and to maintain
  clear and focused User Experience goals. Then use modernizr, media queries,
  and conditional loading to provide an enhanced experience for more capable
  devices.
* Use browser prefixes correctly & Painlessly - When using prefixed properties
  ensure that MicrosoftOperaWebkit and Mozilla prefixes are supported and that
  the non prefixed version is too.  Make this less painful by abstracting it
  away into a preprocessor mixin.
* Use Conditional classes for Internet Explorer - Aim to avoid separate styles
  for internet explorerbut where unavoidable do not use conditional stylesheets
  or CSS hacks to target specific versions of IE.  Instead use conditional
  classes as explained by Paul Irish.  
  Source: [Conditional stylesheets vs CSS
    hacks…](http://paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither/)
* Group IE Conditional styling with the code they alter - Aim to avoid separate
  styles for internet explorerbut where unavoidable place the "fixes" next to
  the style it effects.  Not doing so makes it easy to miss when updating to
  changing the original styles
* Normalise Don't Reset - A global reset is a convenient way of ensuring
  consistent styling cross browser but it is often overkill and it makes CSS
  harder to debug in developer tools.  Source:
  [Normalise.css](http://necolas.github.com/normalize.css/)
* Don't be over-zealous when normalising - When normalising it is important to
  not add styles to elements that then need to be overridden in future modules.
  Tables and form elements are great examples of this.  Source: [SMACSS on drop
  the base](http://smacss.com/book/drop-the-base)










