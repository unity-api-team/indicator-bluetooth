
# the indicator bus file
indicatorsdir = $(datadir)/unity/indicators
dist_indicators_DATA = com.canonical.indicator.bluetooth

# the upstart job file
upstart_jobsdir = $(datadir)/upstart/sessions
upstart_jobs_DATA = indicator-bluetooth.conf

%.conf: %.conf.in
	sed -e "s|\@pkglibexecdir\@|$(pkglibexecdir)|" $< > $@

gsettings_SCHEMAS = com.canonical.indicator.bluetooth.gschema.xml
@INTLTOOL_XML_NOMERGE_RULE@
@GSETTINGS_RULES@

EXTRA_DIST = \
  indicator-bluetooth.service.in \
  com.canonical.indicator.bluetooth.gschema.xml.in

CLEANFILES = \
  $(upstart_jobs_DATA) \
  $(gsettings_SCHEMAS)
