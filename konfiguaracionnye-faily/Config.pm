use strict;
use warnings;

package Config;

use YAML;

sub load 
{
    my ($class, %param) = @_;

    my $conf;

    if ( $param{file} =~ /\.yaml$/ ){

        print $param{file}."\n";
        $conf->{data} = YAML::LoadFile( $param{file} );
        $conf->{format} = "yaml";
        $conf->{file} = $param{file};
    } else {
        die "unsupported format of config, stop";
    }

    return bless $conf;
}


sub write
{
    my ($self, %param) = @_;

    YAML::DumpFile($param{file}, $self->{data});

    return;
}


sub get
{
    my ($self, $key) = @_;

    return $self->{data}->{$key};
}

sub set
{
    my ($self, $key, $value) = @_;

    $self->{data}->{$key} = $value;

    return;
}

1;

