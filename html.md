HTML-Styleguide
==============

# HTML Syntax and General Guidelines

* Use lowercase tab and attribute names and write only one element per line
* Use soft-tabs with two spaces and indent nested elemens only once and never mix tabs and spaces
* Use only one level of indentation for each nested element and eliminate end of line whitespace and unintended blank lines
* Always use double quotes, never single quotes
* Omit the `type` attributes from `link` stylesheet, `style` and `script` elements.
* Always use closing tags
* Use the HTML doctype to enforce standards mode in every browser with `<!doctype HTML>`
Example:
```
<!DOCTYPE html>
<html>
  <head>
    <title>Hello, world!</title>
  </head>
  <body>
    <img src='images/company-logo.png' alt='Company' />
    <h1 class="intro">Hello, world!</h1>
  </body>
</html>
```
* Use the simplest markup pattern possible for a component while still maintaining HTML standards and proper sementics. 
* Do not write markup in javascript files to avoid detrimental effects on performance and editability.

# HTML Attributes

Apply HTML Attributes to an element in the following order:
* Class
* ID
* data-*
* everything else
Example:
```
<a class="[value]" id="[value]" data-name="[value]" href="[url]">[text]</a>
```

### Exceptions
Elements with multiple attributes can be split into multiple lines to improve readability and produce more meaningful diffs.

```
<a class="[value]"
 data-action="[value]"
 data-id="[value]"
 href="[url]">
    <span>[text]</span>
</a>
```






# Resources
1. [Idiomatic HTML](https://github.com/necolas/idiomatic-html)
2. [@mdo's Code Guide](https://github.com/mdo/code-guide/tree/gh-pages#html)

