package Keyword::With;
# ABSTRACT: provide new syntax to use a 'given' statement without an experimental warning

use strict;
use warnings;

use Keyword::Declare;

sub import {
    keyword with (List $expr, Block $block) {{{
        foreach ( scalar <{$expr}> ) <{$block}>
    }}}
    return; 
}

1;

=pod 

=head1 NAME 

Keyword::With 

=head1 DESCRIPTION

Provide a construct almost identical to given (...) { } that evaluates an list expression in scalar context (assigning it to $_) then executing a block of code. 

=head1 SYNOPSIS 

 use Keyword::With; 

 with (5*3) {
     print; 
 }

or 

 with ( some_func() ) {
    print "matches\n" if grep { m/$_/ } qr/abc/, qr/def/;
    print "does not match\n"; 
 } 

=head1 ADVANTAGES 

No experimental warning

=head1 DISADVANTAGES 

Cannot use builtins that modify $_ with with blocks because they will clobber the $_ value set by with (...) { }. This was already a disadvantage of given blocks. 

=cut 
