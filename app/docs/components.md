<section class="copy">
# Components

Components are the equivalent to Modules within the SMACSS methodology renamed here to avoid confusion with Drupal's terminology. Components are modular and reusable entities of a design system. Each component is defined within its own partial inside the component directory. In Archetype, every entity within the design system is treated as a component. 

_Simple components_ refer to things like HTML element styles such as the `<ul>` tag. These simple components are scoped with an HTML class on either the element itself, or in some cases on a parent element. Scoping simple components is important in order to avoid applying styles directly to an HTML element which leads to redundant overrides and unnecessary code. _Complex components_ are separated into object, structure, and skin styles.  Some, but not all complex component styles extend an object. Abstracting structure and skin provides the ability to build prototypes without applying visual design, as well as easily re-design an existing component by simply swapping out skin styles. Finally, _compound components_ are those that contain another component.

See the [Coding Standards](https://github.com/kwaledesign/Coding-Standards/blob/master/css.md) for further details.

Component style's include:
<ul>
  <li><a href="/components/typography.html">Typography</a></li>
  <li><a href="/components/page.html">Page</a></li>
  <li><a href="/components/quotes.html">Quotes</a></li>
  <li><a href="/components/tables.html">Tables</a></li>
  <li><a href="/components/rules.html">Rules</a></li>
  <li><a href="/components/lists.html">Lists</a></li>
  <li><a href="/components/links.html">Links</a></li>
  <li><a href="/components/figures.html">Figures</a></li>
  <li><a href="/components/code.html">Code</a></li>
  <li><a href="/components/media.html">Media</a></li>
  <li><a href="/components/forms.html">Forms</a></li>
  <li><a href="/components/buttons.html">Buttons</a></li>
  <li><a href="/components/close.html">Close</a></li>
  <li><a href="/components/alerts.html">Alerts</a></li>
  <li><a href="/components/spacers.html">Spacers</a></li>
  <li><a href="/components/tabs.html">Tabs</a></li>
  <li><a href="/components/partitions.html">Partitions</a></li>
  <li><a href="/components/labels.html">Labels</a></li>
  <li><a href="/components/icons.html">Icons</a></li>
</ul>

</section>
