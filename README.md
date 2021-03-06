[![Build Status](https://travis-ci.org/mcmillhj/Keyword-With.svg?branch=master)](https://travis-ci.org/mcmillhj/Keyword-With)
[![Coverage Status](https://coveralls.io/repos/mcmillhj/Keyword-With/badge.png?branch=master)](https://coveralls.io/r/mcmillhj/Keyword-With?branch=master)
[![Kwalitee status](http://cpants.cpanauthors.org/dist/Keyword-With.png)](http://cpants.charsbar.org/dist/overview/Keyword-With)

# NAME

Keyword::With - provide new syntax to use a 'given' statement without an experimental warning

# VERSION

version 0.003

# DESCRIPTION

Provide a construct almost identical to \`given (...) { }\` that evaluates an list expression in scalar context (assigning it to \`$\_\`) then executing a block of code. 

# NAME 

Keyword::With 

# SYNOPSIS 

    use Keyword::With; 

    with (5*3) {
        print; 
    }

or 

    with ( some_func() ) {
        print "matches\n" if grep { m/$_/ } qr/abc/, qr/def/;
        print "does not match\n"; 
    } 

# ADVANTAGES 

No experimental warning

# DISADVANTAGES 

Cannot use builtins that modify \`$\_\` with with blocks because they will clobber the \`$\_\` value set by \`with (...) { }\`. This was already a disadvantage of given blocks. A reasonable approach would be to create a new lexical variable within the \`with\` block:

    with ( [qw(1 2 3 5 8 13 21)] ) {
        my @first_7_fibs = @$_;
        my @new_first_7_fibs = map { $_ + 1 } @first_7_fibs;
        ...
    }

# AUTHOR

Hunter McMillen <mcmillhj@gmail.com>

# COPYRIGHT AND LICENSE

This software is copyright (c) 2016 by Hunter McMillen.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
