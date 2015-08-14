#!perl -T
use strict;
use warnings;
use Test::More;


plan skip_all => "Test::Pod 1.14 required for testing POD"
    unless eval "use Test::Pod 1.14; 1";

all_pod_files_ok();

if (eval "use Pod::Checker; 1") {
    my $checker = Pod::Checker->new(-warnings => 1);
    for my $pod (all_pod_files()) {
        $checker->parse_from_file($pod, \*STDERR)
    }
}
