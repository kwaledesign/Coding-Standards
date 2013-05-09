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

* The abscence of media queries is the first media query.
  * Develope for _Mobile First_ [[14]](#works-cited) as a baseline level of support for small screens and slow connections
  * emphasize content over navigation, and to maintain clear and focused User Experience goals. 
  * Use modernizr, media queries, and conditional loading to provide an enhanced experience for more capable devices.
* Use browser prefixes correctly and painlessly by abstracting into a preprocessor mixin.
* Avoid separate styles for IE except where unavoidable. In those cases use Conditional classes [[24]](README.md/#works-cited) and not conditional stylesheets or CSS hacks. 

* Group IE Conditional styling with the code they alter - Aim to avoid separate
  styles for internet explorer but where unavoidable place the "fixes" next to
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
* Scope images within media queries to avoid redundant downloads

## Guidelines for Handling Media [[23]](/README.md/#works-cited)
**The Golden Rule** - Which ever solution you implement to handle images and media within responsive builds, it WILL be depriciated so be sure that is easy to change.

1. Use vector based images and icon fonts whenever possible and impliment fallbacks when appropriate
2. Encourage content creators to upload highest quality source possible to facilitate appropriate adjustments server-side without significant degragation.
3. Impliment automatic image resize and compresion to provide necessary image assets, i.e. [Drupal Image Cache Module](http://drupal.org/project/imagecache) or equivalent.
4. Whenever possible allow for images to be resized to any size with URL paramiters, i.e. [CDN Connect](http://www.cdnconnect.com/).
5. Responsive images markup funciton (b/c it will change!)
6. Plan for the art direction use-case.





