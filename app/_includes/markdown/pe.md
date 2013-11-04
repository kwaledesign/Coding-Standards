Coding Standards
================

# Progressive Enhancement Guidelines

* The absence of media queries is the first media query.
  * Develop for _Mobile First_ [[14]](#works-cited) as a baseline level of support for small screens and slow connections
  * emphasize content over navigation, and to maintain clear and focused User Experience goals. 
  * Use modernizr, media queries, and conditional loading to provide an enhanced experience for more capable devices.
* Use browser prefixes correctly and painlessly by abstracting into a preprocessor mixin.
* Avoid separate styles for IE except where unavoidable. 
  * Use Conditional classes [[24]](README.md/#works-cited) and not conditional stylesheets or CSS hacks. 
  * Group IE Conditional styling with the code they alter to increase both readability and maintainability.
* Normalize Don't Reset - A global reset is a convenient way of ensuring
  consistent styling cross browser but it is often overkill and it makes CSS
  harder to debug in developer tools.  Source:
  [Normalize.css](http://necolas.github.com/normalize.css/)
* Don't be over-zealous when normalising - When normalising it is important to
  not add styles to elements that then need to be overridden in future modules.
  Tables and form elements are great examples of this.  Source: [SMACSS on drop
  the base](http://smacss.com/book/drop-the-base)

## Guidelines for Handling Media [[23]](/README.md/#works-cited)

**The Golden Rule** - Which ever solution you implement to handle images and media within responsive builds, it WILL be depreciated so be sure that is easy to change.

1. Use SVG and icon fonts whenever possible and implement fallbacks when appropriate
2. Encourage content creators to upload highest quality source possible to facilitate appropriate adjustments server-side without significant degradation.
3. Implement automatic image resize and compression to provide necessary image assets, i.e. [Drupal Image Cache Module](http://drupal.org/project/imagecache) or equivalent.
4. Whenever possible allow for images to be resized to any size with URL parameters, i.e. [CDN Connect](http://www.cdnconnect.com/).
5. Responsive images markup function (b/c it will change!)
6. Plan for the art direction use-case.
7. [Picturefill](https://github.com/scottjehl/picturefill) raster graphics.
8. Scope images within media queries to avoid redundant downloads


