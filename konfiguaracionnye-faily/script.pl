#!/usr/bin/perl

use strict;
use warnings;

use Config;

my $conf = Config->load(file => "conf.yaml");

my $parallel_level = $conf->get("parallel-level");
$conf->set("parallel-level", $parallel_level * 2);

$conf->write(file => "conf2.yaml");

