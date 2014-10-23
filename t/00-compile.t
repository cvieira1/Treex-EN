use 5.006;
use strict;
use warnings;

# this test was generated with Dist::Zilla::Plugin::Test::Compile 2.042

use Test::More  tests => 15 + ($ENV{AUTHOR_TESTING} ? 1 : 0);



my @module_files = (
    'Treex/Block/W2A/EN/FixTags.pm',
    'Treex/Block/W2A/EN/FixTagsAfterParse.pm',
    'Treex/Block/W2A/EN/FixTokenization.pm',
    'Treex/Block/W2A/EN/Lemmatize.pm',
    'Treex/Block/W2A/EN/NormalizeForms.pm',
    'Treex/Block/W2A/EN/ParseMSTperl.pm',
    'Treex/Block/W2A/EN/SetIsMemberFromDeprel.pm',
    'Treex/Block/W2A/EN/TagLinguaEn.pm',
    'Treex/Block/W2A/EN/TagMorphoDiTa.pm',
    'Treex/Block/W2A/EN/Tokenize.pm',
    'Treex/EN.pm',
    'Treex/Tool/EnglishMorpho/Analysis.pm',
    'Treex/Tool/EnglishMorpho/Lemmatizer.pm',
    'Treex/Tool/Segment/EN/RuleBased.pm',
    'Treex/Tool/Tagger/Featurama/EN.pm'
);



# no fake home requested

my $inc_switch = -d 'blib' ? '-Mblib' : '-Ilib';

use File::Spec;
use IPC::Open3;
use IO::Handle;

open my $stdin, '<', File::Spec->devnull or die "can't open devnull: $!";

my @warnings;
for my $lib (@module_files)
{
    # see L<perlfaq8/How can I capture STDERR from an external command?>
    my $stderr = IO::Handle->new;

    my $pid = open3($stdin, '>&STDERR', $stderr, $^X, $inc_switch, '-e', "require q[$lib]");
    binmode $stderr, ':crlf' if $^O eq 'MSWin32';
    my @_warnings = <$stderr>;
    waitpid($pid, 0);
    is($?, 0, "$lib loaded ok");

    if (@_warnings)
    {
        warn @_warnings;
        push @warnings, @_warnings;
    }
}



is(scalar(@warnings), 0, 'no warnings found') if $ENV{AUTHOR_TESTING};


