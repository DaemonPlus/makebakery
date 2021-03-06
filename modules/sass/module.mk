#
# sass module: convert .sass and .scss to .css with sassc
#
# Copyright 2018 Michael F. Lamb <http://datagrok.org>
#
# This program is part of Makebakery.
# License: AGPLv3+ http://www.gnu.org/licenses/agpl.html
# See COPYING for details.
#
targets := $(targets:.sass=.css)
targets := $(targets:.scss=.css)

$(DST)/%.css: $(DST)/%.sass
	sassc $^ $@

$(DST)/%.css: $(DST)/%.scss
	sassc $^ $@
