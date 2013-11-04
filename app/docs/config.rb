# Susy - https://github.com/ericam/susy
# require 'susy'

# Singularity - https://github.com/Team-Sass/Singularity
require 'singularitygs'

# Singularity-Extras - https://github.com/Team-Sass/Singularity-Extras
#require 'singularity-extras'

# Modular Scale https://github.com/scottkellum/modular-scale
require 'modular-scale'

# Breakpoint - https://github.com/Team-Sass/breakpoint
require 'breakpoint'

# Archetype - https://github.com/kwaledesign/Archetype
require 'archetype'

# Colorkit - https://github.com/kwaledesign/Colorkit
require 'colorkit'

# Set this to the root of your project when deployed:
http_path = "/"
css_dir = "css"
sass_dir = "sass"
images_dir = "images"
javascripts_dir = "js"
add_import_path '../stylesheets'
add_import_path '../templates/project'

# You can select your preferred output style here (can be overridden via the command line):
# output_style = :expanded or :nested or :compact or :compressed

# To enable relative paths to assets via compass helper functions. Uncomment:
relative_assets = true

# To disable debugging comments that display the original location of your selectors. Uncomment:
#line_comments = false


# If you prefer the indented syntax, you might want to regenerate this
# project again passing --syntax sass, or you can uncomment this:
# preferred_syntax = :sass
# and then run:
# sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass
