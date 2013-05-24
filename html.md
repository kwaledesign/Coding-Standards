# HTML Guidelines

## Syntax and General Guidelines

* Use lowercase tag and attribute names and write only one element per line
* Use only one level of indentation for each nested element and eliminate end of line whitespace and unintended blank lines
* Always use double quotes, never single quotes
* Omit the `type` attributes from `link` stylesheet, `style` and `script` elements.
* Always use closing tags
* Use the HTML5 doctype to enforce standards mode in every browser with `<!doctype HTML>`

Example:

```html
<!DOCTYPE html>
<html>
  <head>
    <title>Hello, world!</title>
  </head>
  <body>
    <img src='images/logo.png' alt='Company-Name' />
    <h1 class="intro">Hello, world!</h1>
  </body>
</html>
```

* Use the simplest markup pattern possible for a component while still maintaining HTML standards and proper semantics. 
* Do not write markup in javascript files to avoid detrimental effects on performance and maintainability.

# HTML Attributes

Apply HTML Attributes to an element in the following order:
* Class
* ID
* data-*
* everything else

Example:

```html
<a class="" id="" data-name="" href="">...</a>
```

### Exceptions
Elements with multiple attributes can be split into multiple lines to improve readability and produce more meaningful diffs.

Example: 

```html
<a class=""
 data-action=""
 data-id=""
 href="">
    <span>...</span>
</a>
```



