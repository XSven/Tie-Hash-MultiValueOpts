use strict;
use warnings;

# https://metacpan.org/pod/Tie::Hash::MultiValue

package Tie::Hash::MultiValueOpts;

$Tie::Hash::MultiValueOpts::VERSION = 'v1.0.0';

use Tie::Hash ();
use parent -norequire, 'Tie::StdHash';

sub STORE {
  my ( $self, $key, $value ) = @_;

  if ( my $current_value = $self->{ $key } ) {
    if ( 'ARRAY' eq ref $current_value ) {
      push @{ $current_value }, $value;
      return $current_value
    }
  }
  $self->{ $key } = $value
}

1
