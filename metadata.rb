name             "nutch"
maintainer       "Darron Froese"
maintainer_email "darron@froese.org"
license          "apachev2"
description      "Installs/Configures nutch for use with solr"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.3.0"

depends "java"
depends "jetty"
depends "solr"