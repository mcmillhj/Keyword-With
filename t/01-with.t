#!perl

use strict;
use warnings;

use feature qw(current_sub);

use Keyword::With; 
use Test::More tests => 2;

subtest 'simple' => \&test_simple;
subtest 'less simple' => \&test_less_simple;

sub test_simple {
    plan tests => 1;

    my $result;
    with (5) {
        $result = $_; 
    }

    is( $result, '5', 'got expected simple expression of 5' );
    return;
}

sub test_less_simple {
    plan tests => 1;

    my $result;
    with ( 
        sub { 
            my $n = shift; 
            return $n if $n < 2; 
            return __SUB__->($n-1) * $n; 
        }
    ) {
        $result = $_->(5);
    }

    is $result, 120, 'handled expected anonymous subroutine';
    return;
}
