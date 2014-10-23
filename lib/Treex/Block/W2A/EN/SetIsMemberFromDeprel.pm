package Treex::Block::W2A::EN::SetIsMemberFromDeprel;
{
  $Treex::Block::W2A::EN::SetIsMemberFromDeprel::VERSION = '0.08057';
}
use Moose;
use Treex::Core::Common;
extends 'Treex::Core::Block';

sub process_anode {
    my ( $self, $anode ) = @_;

    $anode->set_is_member($anode->conll_deprel eq 'COORD' || $anode->is_member || 0);

    return 1;
}

1;

=over

=item Treex::Block::W2A::EN::SetIsMemberFromDeprel

The nodes with C<conll_deprel> attribute C<COORD>
are marked with the C<is_member> attribute. No C<afun> is filled yet.

=back

=cut

# Copyright 2009 Martin Popel
# This file is distributed under the GNU General Public License v2. See $TMT_ROOT/README.
