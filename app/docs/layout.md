<section class="copy">
# Layout

Layout styles within Archetype are completely abstracted. All components are fluid by nature and should never be given explicit width or height restraints. A component's width is determined by its parent container or grid system. Heights should only be explicitly defined for elements which had dimensions before they entered the system; e.g. image, video. In all other cases use line-height instead which is far more flexible. The grid system should never have styles or box-model properties directly applied - grid items contain content but are not content in themselves. Finally, layout based styles are indicated with the l- prefix in order to distinguish them from module or state styles 

See the [Coding Standards](https://github.com/kwaledesign/Coding-Standards/blob/master/css.md) for further details.

</section>
