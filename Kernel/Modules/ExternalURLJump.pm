# --
# Copyright (C) 2012-2020 Znuny GmbH, http://znuny.com/
# Copyright (C) 2012-2020 Znuny GmbH, http://znuny.com/
# --
# This software comes with ABSOLUTELY NO WARRANTY. For details, see
# the enclosed file COPYING for license information (AGPL). If you
# did not receive this file, see http://www.gnu.org/licenses/agpl.txt.
# --

package Kernel::Modules::ExternalURLJump;

use strict;
use warnings;

our @ObjectDependencies = (
    'Kernel::Output::HTML::Layout',
    'Kernel::System::Web::Request',
);

sub new {
    my ( $Type, %Param ) = @_;

    # allocate new hash for object
    my $Self = {%Param};
    bless( $Self, $Type );

    return $Self;
}

sub Run {
    my ( $Self, %Param ) = @_;

    my $LayoutObject = $Kernel::OM->Get('Kernel::Output::HTML::Layout');
    my $ParamObject  = $Kernel::OM->Get('Kernel::System::Web::Request');
    
    my $ExtURL = $Kernel::OM->Get('Kernel::System::Web::Request')->GetParam( Param => 'URL' );
    $ExtURL =~ s/_LOGIN_/$Self->{UserLogin}/;
    $ExtURL =~ s/_EMAIL_/$Self->{UserEmail}/;

    my $ExtURL = $ParamObject->GetParam( Param => 'URL' );

    return $LayoutObject->Redirect( ExtURL => $ExtURL );
}

1;
