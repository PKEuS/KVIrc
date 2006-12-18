#!/usr/bin/perl

$name = $ARGV[0];

if($name eq "")
{
	print "Usage: gensrc <filename>\n";
	exit;
}

$bIsHeader = 0;
$ifdefname = $name;
$ifdefname =~ tr/a-z/A-Z/;
$ifdefname =~ s/\./_/;
$ifdefname = "_$ifdefname\_";

if(open(THEFILE,">$name"))
{
	$_ = $name;
	if(/[A-Za-z_]*.h/)
	{
		$bIsHeader = 1;
	}


	if($bIsHeader)
	{
		print THEFILE "#ifndef $ifdefname\n";
		print THEFILE "#define $ifdefname\n";
	}

	$thetime = gmtime;

	print THEFILE "//\n";
	print THEFILE "//   File : $name\n";
	print THEFILE "//   Creation date : $thetime GMT by Szymon Stefanek\n";
	print THEFILE "//\n";
	print THEFILE "//   This file is part of the KVirc irc client distribution\n";
	print THEFILE "//   Copyright (C) 2002 Szymon Stefanek (pragma at kvirc dot net)\n";
	print THEFILE "//\n";
	print THEFILE "//   This program is FREE software. You can redistribute it and/or\n";
	print THEFILE "//   modify it under the terms of the GNU General Public License\n";
	print THEFILE "//   as published by the Free Software Foundation; either version 2\n";
	print THEFILE "//   of the License, or (at your opinion) any later version.\n";
	print THEFILE "//\n";
	print THEFILE "//   This program is distributed in the HOPE that it will be USEFUL,\n";
	print THEFILE "//   but WITHOUT ANY WARRANTY; without even the implied warranty of\n";
	print THEFILE "//   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.\n";
	print THEFILE "//   See the GNU General Public License for more details.\n";
	print THEFILE "//\n";
	print THEFILE "//   You should have received a copy of the GNU General Public License\n";
	print THEFILE "//   along with this program. If not, write to the Free Software Foundation,\n";
	print THEFILE "//   Inc. ,59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.\n";
	print THEFILE "//\n";
	print THEFILE "\n";

	if($bIsHeader)
	{
		print THEFILE "\n";
		print THEFILE "#endif //$ifdefname\n";
	}

	close(THEFILE);
} else {
	print "No way to open the file $name\n";
}

