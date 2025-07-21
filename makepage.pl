#!/apps/bin/perl
$NameHtml="clas_thesis.html";
$NameFinish="completed.txt";
$NameCandidate="candidate.txt";
$NameNonCLAS="completed_nonclas.txt";
$NameCLAS12="completed_clas12.txt";
$NameMasters="completed_masters.txt";
$NameTop="top.html";
$NameMiddle="middle.html";
$NameMiddleCLAS12="middleCLAS12.html";
$NameMiddleMasters="middleMasters.html";
$NamePostMiddle="postmiddle.html";
$NameBottom="bottom.html";

$overwrite=($ARGV[0] eq "-f");
if(-e $NameHtml){
    $overwrite or print "$NameHtml exists! Use -f force overwriting.\n" and exit;
}
open($FileFinish,"<$NameFinish") or die "Cannot open file $NameFinish!";
open($FileCandidate,"<$NameCandidate") or die "Cannot open file $NameCandidate!";
open($FileNonCLAS,"<$NameNonCLAS") or die "Cannot open file $NameNonCLAS!";
open($FileCLAS12,"<$NameCLAS12") or die "Cannot open file $NameCLAS12!";
open($FileMasters,"<$NameMasters") or die "Cannot open file $NameMasters!";
open($FileTop,"<$NameTop") or die "Cannot open file $NameTop!";
open($FileMiddle,"<$NameMiddle") or die "Cannot open file $NameMiddle!";
open($FileMiddleCLAS12,"<$NameMiddleCLAS12") or die "Cannot open file $NameMiddleCLAS12!";
open($FileMiddleMasters,"<$NameMiddleMasters") or die "Cannot open file $NameMiddleMasters!";
open($FilePostMiddle,"<$NamePostMiddle") or die "Cannot open file $NamePostMiddle!";
open($FileBottom,"<$NameBottom") or die "Cannot open file $NameBottom!";
open($FileHtml,">$NameHtml") or die "Cannot open file $NameHtml!";
my @lines=<$FileTop>;
foreach (@lines){
    print $FileHtml $_;
}
close($FileTop);
$stringTR='    <tr align="left" valign="top">';
@lines=<$FileCandidate>;
$indLine=0;
foreach $line (@lines){
    chomp($line);
    $indLine==0 and print $FileHtml "$stringTR\n";
    print $FileHtml "      <td>".$line."</td>\n";
    $indLine+=1;
    $indLine==8 and print $FileHtml "    </tr>\n" and $indLine=0;
}
close($FileCandidate);

@lines=<$FileMiddleCLAS12>;
foreach (@lines){
    print $FileHtml $_;
}
close($FileMiddleCLAS12);
@lines=<$FileCLAS12>;
$indLine=0;
foreach $line (@lines){
    chomp($line);
    $indLine==0 and print $FileHtml "$stringTR\n";
    print $FileHtml "      <td>".$line."</td>\n";
    $indLine+=1;
    $indLine==9 and print $FileHtml "    </tr>\n" and $indLine=0;
}
close($FileCLAS12);

@lines=<$FileMiddle>;
foreach (@lines){
    print $FileHtml $_;
}
close($FileMiddle);
@lines=<$FileFinish>;
$indLine=0;
foreach $line (@lines){
    chomp($line);
    $indLine==0 and print $FileHtml "$stringTR\n";
    print $FileHtml "      <td>".$line."</td>\n";
    $indLine+=1;
    $indLine==8 and print $FileHtml "    </tr>\n" and $indLine=0;
}
close($FileFinish);

@lines=<$FileMiddleMasters>;
foreach (@lines){
    print $FileHtml $_;
}
close($FileMiddleMasters);
@lines=<$FileMasters>;
$indLine=0;
foreach $line (@lines){
    chomp($line);
    $indLine==0 and print $FileHtml "$stringTR\n";
    print $FileHtml "      <td>".$line."</td>\n";
    $indLine+=1;
    $indLine==8 and print $FileHtml "    </tr>\n" and $indLine=0;
}
close($FileMasters);

@lines=<$FilePostMiddle>;
foreach (@lines){
    print $FileHtml $_;
}
close($FilePostMiddle);
@lines=<$FileNonCLAS>;
$indLine=0;
foreach $line (@lines){
    chomp($line);
    $indLine==0 and print $FileHtml "$stringTR\n";
    print $FileHtml "      <td>".$line."</td>\n";
    $indLine+=1;
    $indLine==8 and print $FileHtml "    </tr>\n" and $indLine=0;
}
close($FileNonCLAS);
@lines=<$FileBottom>;
foreach (@lines){
    print $FileHtml $_;
}
close($FileBottom);
close($FileHtml);
