SRC                  = .
DST                 := $(abspath ../../build/makebakery)
# BASEURL is the URL path from the root of the domain to
# the root of the site. If defined, should start with / and
# never end with /
BASEURL              = /makebakery
SITEHOST             = https://datagrok.github.io
SITENAME             = makebakery

PANDOC_BEFORE_BODY  := $(DST)/before_body.incl
PANDOC_AFTER_BODY   := $(DST)/after_body.incl
PANDOC_STYLESHEET   := $(addprefix $(BASEURL)/_/css/, \
	bootstrap-3.2.0.min.css \
	bootstrap-theme-3.2.0.min.css \
	style.css)

# This must appear before the statement to include makebakery.mk.
MODULES = \
	___ignore \
	__paths_are_dirs \
	__source \
	executable \
	gh-pages \
	pandoc \
	url

# Since this Makefile is in the directory containing source files, we need to
# exclude it from the destination files. This must appear before the statement
# to include makebakery.mk.
IGNORE := Makefile before_body.incl after_body.incl README/index.html

include ../../makebakery.mk

$(DST)/atom.xml: $(filter %.html,$(targets))
$(DST)/pages.json: $(filter %.html,$(targets))

export BASEURL
export SITEHOST
export SITENAME
