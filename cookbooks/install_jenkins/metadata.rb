name             'install_jenkins'
maintainer       'mahendra'
maintainer_email 'mahendra.shivaswamy@outlook.com'
license          'All rights reserved'
description      'Installs/Configures jenkins on rhel/ubuntu'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'


#Dependencies on these cookbboks
depends 'apt',   '~> 2.0'
depends 'yum',   '~> 3.0'

