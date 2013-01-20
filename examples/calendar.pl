#!perl

use strict;

use Template;

use Data::Dumper;
use DateTime;
use Calendar::Model;

my $cal = Calendar::Model->new(selected_date=>DateTime->new(day=>3, month=>1, year=>2013));

warn Dumper($cal->columns);

warn Dumper $cal->weeks;

# create Template object
my $template = Template->new({ INCLUDE_PATH => 'templates', POST_CHOMP=> 1,});
# process input template, substituting variables
$template->process('calendar.tt', {cal => $cal })
|| die $template->error();