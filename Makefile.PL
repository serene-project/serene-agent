use ExtUtils::MakeMaker;
 
WriteMakefile(
    NAME            => 'Serene::Agent',
    VERSION_FROM    => 'lib/Serene/Agent.pm',
    EXE_FILES       => [ 'bin/serene-agent' ]
);
