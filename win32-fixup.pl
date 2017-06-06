#! e:/program files/perl/bin/perl.exe
#  version info can be found in 'configure.ac'

require "../local-paths.lib";

$api_version = "1.0";
$pango_version = "1.40.6";
$major = 1;
$minor = 40;
$micro = 6;
$binary_age = 4006;
$interface_age = 6;
$current_minus_age = 0;
$exec_prefix = "lib";

sub process_file
{
        my $outfilename = shift;
	my $infilename = $outfilename . ".in";
	
	open (INPUT, "< $infilename") || exit 1;
	open (OUTPUT, "> $outfilename") || exit 1;
	
	while (<INPUT>) {
	    s/\@VERSION@/$pango_version/g;
	    s/\@PANGO_VERSION@/$pango_version/g;
	    s/\@PANGO_API_VERSION@/$api_version/g;
	    s/\@PANGO_VERSION_MAJOR\@/$major/g;
	    s/\@PANGO_VERSION_MINOR\@/$minor/g;
	    s/\@PANGO_VERSION_MICRO\@/$micro/g;
	    s/\@PANGO_INTERFACE_AGE\@/$interface_age/g;
	    s/\@PANGO_BINARY_AGE\@/$binary_age/g;
	    s/\@PANGO_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@LT_CURRENT_MINUS_AGE@/$current_minus_age/g;
	    s/\@PERL_PATH@/$perl_path/g;
	    s/\@GlibBuildRootFolder@/$glib_build_root_folder/g;
	    s/\@GenericIncludeFolder@/$generic_include_folder/g;
	    s/\@GenericLibraryFolder@/$generic_library_folder/g;
	    s/\@GenericWin32LibraryFolder@/$generic_win32_library_folder/g;
	    s/\@GenericWin32BinaryFolder@/$generic_win32_binary_folder/g;
	    s/\@Debug32TestSuiteFolder@/$debug32_testsuite_folder/g;
	    s/\@Release32TestSuiteFolder@/$release32_testsuite_folder/g;
	    s/\@Debug32TargetFolder@/$debug32_target_folder/g;
	    s/\@Release32TargetFolder@/$release32_target_folder/g;
	    s/\@Debug32PangoModulesFolder@/$debug32_pango_modules_folder/g;
	    s/\@Release32PangoModulesFolder@/$release32_pango_modules_folder/g;
	    s/\@TargetSxSFolder@/$target_sxs_folder/g;
	    s/\@prefix@/$prefix/g;
	    s/\@exec_prefix@/$exec_prefix/g;
	    s/\@includedir@/$generic_include_folder/g;
	    s/\@libdir@/$generic_library_folder/g;
	    print OUTPUT;
	}
}

process_file ("config.h.win32");
process_file ("pango.pc");
process_file ("pangocairo.pc");
process_file ("pangoft2.pc");
process_file ("pangowin32.pc");

my $command=join(' ',@ARGV);
if ($command eq -buildall) {
	process_file ("pango/pango-features.h");
	process_file ("pango/pango.rc");
	process_file ("pango/pangocairo.rc");
	process_file ("pango/pangoft2.rc");
	process_file ("pango/pangowin32.rc");
	process_file ("msvc/pango.vsprops");
}