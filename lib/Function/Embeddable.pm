package Function::Embeddable;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

# BEGIN_BLOCK: import
sub import {
    no strict 'vars';
    my $pkg = shift;
    my $caller = caller;
    my @imp = @_ ? @_ : @{__PACKAGE__.'::EXPORT'};
    for my $imp (@imp) {
        if (grep {$_ eq $imp} (@{__PACKAGE__.'::EXPORT'},
                               @{__PACKAGE__.'::EXPORT_OK'})) {
            *{"$caller\::$imp"} = \&{$imp};
        } else {
            die "$imp is not exported by ".__PACKAGE__;
        }
    }
}
# END_BLOCK: import

1;
#ABSTRACT: Collection of functions that can be embedded e.g. using Dist::Zilla plugin

=head1 SYNOPSIS

In F<dist.ini>:

 [InsertBlock::FromModule]

In F<lib/Your/Module.pm> (that wants to embed one or more functions):

 # INSERT_BLOCK: Function::Embeddable import
 # INSERT_BLOCK: Function::Embeddable another_func


=head1 DESCRIPTION


=head1 FUNCTIONS

=head2 import


=head1 SEE ALSO

L<Dist::Zilla::Plugin::InsertBlock::FromModule>
