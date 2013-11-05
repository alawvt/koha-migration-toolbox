#!/usr/bin/perl
#---------------------------------
# Copyright 2010 ByWater Solutions
#
#---------------------------------
#
# -D Ruth Bavousett
#
#---------------------------------

use strict;
use Data::Dumper;
use Getopt::Long;
use Text::CSV;
$|=1;
my $debug=0;

my $infile_name = "";
my $outfile_name = "";
my $passfile_name = "";
my $attribfile_name = "";
my $codesfile_name = "";
my $create = 0;
my $patron_cat_mapfile;
my %patron_cat_map;
my $branch_mapfile;
my %branch_map;
my $toss_profile_string = "";
my %profiles_to_toss;
my $upcase_name=0;
my $suffix_field = 'surname';
my $cat1_tag = "";
my $cat2_tag = "";
my $cat3_tag = "";
my $cat4_tag = "";
my $cat5_tag = "";
my @datamap_filenames;
my %datamap;
my @xinfo_tags;
my $default_privacy = 0;

GetOptions(
    'in=s'            => \$infile_name,
    'out=s'           => \$outfile_name,
    'pass=s'          => \$passfile_name,
    'attrib=s'        => \$attribfile_name,
    'codes=s'         => \$codesfile_name,
    'toss-profiles=s' => \$toss_profile_string,
    'patron-cat=s'    => \$patron_cat_mapfile,
    'branch-map=s'    => \$branch_mapfile,
    'cat1=s'          => \$cat1_tag,
    'cat2=s'          => \$cat2_tag,
    'cat3=s'          => \$cat3_tag,
    'cat4=s'          => \$cat4_tag,
    'cat5=s'          => \$cat5_tag,
    'xinfo=s'         => \@xinfo_tags,
    'suffix=s'        => \$suffix_field,
    'default_privacy=s' => \$default_privacy,
    'map=s'           => \@datamap_filenames,
    'upcase_name'     => \$upcase_name,
    'debug'           => \$debug,
);

if (($infile_name eq '') || ($outfile_name eq '') || ($passfile_name eq '') || ($attribfile_name eq '')){
  print "Something's missing.\n";
  exit;
}

if ($toss_profile_string){
   foreach my $kee (split(/,/,$toss_profile_string)){
      $profiles_to_toss{$kee} = 1;
   }
}

$debug and print Dumper(%profiles_to_toss);
if ($branch_mapfile){
   my $csv = Text::CSV->new();
   open my $mapfile,"<$branch_mapfile";
   while (my $row = $csv->getline($mapfile)){
      my @data=@$row;
      $branch_map{$data[0]} = $data[1];
   }
   close $mapfile;
}

if ($patron_cat_mapfile){
   my $csv = Text::CSV->new();
   open my $mapfile,"<$patron_cat_mapfile";
   while (my $row = $csv->getline($mapfile)){
      my @data=@$row;
      $patron_cat_map{uc $data[0]} = uc $data[1];
   }
   close $mapfile;
}

foreach my $map (@datamap_filenames) {
   my ($mapsub,$map_filename) = split (/:/,$map);
   my $csv = Text::CSV_XS->new();
   open my $mapfile,'<',$map_filename;
   while (my $row = $csv->getline($mapfile)) {
      my @data = @$row;
      $datamap{$mapsub}{$data[0]} = $data[1];
   }
   close $mapfile;
}

my %xinfo_maps;
foreach my $xinfo (@xinfo_tags) {
   my ($tag_in,$tag_out) = split (/:/,$xinfo);
   $xinfo_maps{$tag_in} = $tag_out;
}

open my $in,"<$infile_name";
my $i=0;
my $j=0;
my @borrowers;
my $addr1;
my $addr2;
my $addr3;
my $note;
my %thisborrower = ();
my $toss_this_borrower;
my $borrowers_tossed=0;
my %headerkees;
my %categories;
my %cat1s;
my %cat2s;
my %cat3s;
my %cat4s;
my %cat5s;
my %branches;
my $addedcode;
my @borrower_fields = qw /cardnumber          surname
                          firstname           title
                          othernames          initials
                          streetnumber        streettype
                          address             address2
                          city                state
                          zipcode
                          country             email
                          phone               mobile
                          fax                 emailpro
                          phonepro            B_streetnumber
                          B_streettype        B_address
                          B_address2          B_city
                          B_zipcode           B_country
                          B_email             B_phone
                          dateofbirth         branchcode
                          categorycode        dateenrolled
                          dateexpiry          gonenoaddress
                          lost                debarred
                          contactname         contactfirstname
                          contacttitle        guarantorid
                          borrowernotes       relationship
                          ethnicity           ethnotes
                          sex                
                          flags               userid
                          opacnote            contactnote
                          sort1               sort2
                          altcontactfirstname altcontactsurname
                          altcontactaddress1  altcontactaddress2
                          altcontactaddress3  altcontactzipcode
                          altcontactcountry   altcontactphone
                          smsalertnumber      privacy/;

open my $out,">:utf8",$outfile_name;
for my $k (0..scalar(@borrower_fields)-1){
   print $out $borrower_fields[$k].',';
}
print $out "\n";

open my $attrib,">:utf8",$attribfile_name;
print $attrib "cardnumber,patron_atttributes\n";

open my $pass,">:utf8",$passfile_name;
print $pass "cardnumber,password\n";

while (my $line = readline($in)) {
   last if ($debug && $j>9);
   chomp $line;
   $line =~ s///g;
   $i++;
   print "." unless $i % 10;
   print "\r$i" unless $i % 100;
   if ($line =~ /DOCUMENT BOUNDARY/){
      if (%thisborrower && !$toss_this_borrower){
         $j++;
         $categories{$thisborrower{'categorycode'}}++;
         $branches{$thisborrower{'branchcode'}}++;
         for my $tag (keys %thisborrower) {
            my $oldval = $thisborrower{$tag};
            if ($datamap{$tag}{$oldval}) {
               $thisborrower{$tag} = $datamap{$tag}{$oldval};
               if ($datamap{$tag}{$oldval} eq 'NULL') {
                  delete $thisborrower{$tag};
               }
            }
         }

         $thisborrower{'privacy'} = $default_privacy;
         for my $k (0..scalar(@borrower_fields)-1){
            if ($thisborrower{$borrower_fields[$k]}){
               $thisborrower{$borrower_fields[$k]} =~ s/\"/'/g;
               if ($thisborrower{$borrower_fields[$k]} =~ /,/){
                  print $out '"'.$thisborrower{$borrower_fields[$k]}.'"';
               }
               else{
                  print $out $thisborrower{$borrower_fields[$k]};
               }
            }
            print $out ",";
         }
         print $out "\n";

         if ($addedcode){
            $addedcode =~ s/^,//;
            print $attrib $thisborrower{cardnumber}.',"'."$addedcode".'"'."\n";
         }

         if (exists $thisborrower{password}) {
            print $pass $thisborrower{cardnumber}.','.$thisborrower{password}."\n";
         } 
      }         
      $borrowers_tossed++ if ($toss_this_borrower);
      $note = 0;
      $addr1 = 0;
      $addr2 = 0;
      $addr3 = 0;
      $toss_this_borrower=0;
      %thisborrower=();
      $addedcode=q{};
      $thisborrower{'borrowernotes'} = "";
      next;
   }
   next if ($toss_this_borrower);
   $debug and print $line."\n";
   my ($thistag) = $line =~ /^\.([\w\/]+)\./;
   my ($content) = $line =~ /^\.[\w\/]+\.\s+(.*)$/;
   $content =~ s/^\s+//;
   $content =~ s/^\|a//;
   $content =~ s/\\//;
   $debug and print "$thistag ~~ $content ~~\n";
   
   $note = 0 if ($thistag);
   if (($thistag eq "NOTE") or ($thistag eq "COMMENT") or ($thistag eq "WEBCATPREF")){
      $thisborrower{'borrowernotes'} .= " -- " if $thisborrower{'borrowernotes'};
      $thisborrower{'borrowernotes'} .= $content." ";
      $note = 1;
      next;
   }
   if (($thistag eq "") && $note){
      $thisborrower{'borrowernotes'} .= $line." ";
      next;
   }

   if ($thistag eq "USER_NAME"){
      $content =~ s/\$/ /g;
      $content =~ s/#/ /g;
      $content =~ s/\*/ /g;
      $content =~ s/  / /g;
      $content =~ s/  / /g;
      $content =~ s/^ //g;
      $content =~ s/ $//g;
      $content =~ s/\.$//g;
      $content =~ s/\.,/,/g;
      if ($content =~ /name_not_yet_supplied/i){
         $toss_this_borrower=1;
         next;
      }
      if ($content =~ /(.*?),(.*)/){
         $thisborrower{'surname'} = $1;
         $thisborrower{'firstname'} = $2;
      }
      elsif ($content =~/(\w+) (.*)/){
         $thisborrower{'surname'} = $1;
         $thisborrower{'firstname'} = $2;
      }
      else {
         $thisborrower{'surname'} = $content;
         $thisborrower{'firstname'} = "";
      }
      if ($suffix_field ne 'surname') {
         foreach my $suffix (qw/JR SR III IV/) {
            if ($thisborrower{'surname'} =~ m/($suffix)$/i) {
               $thisborrower{$suffix_field} = $1;
               $thisborrower{surname} =~ s/($suffix)$//i;
            }
         }
      }
      $thisborrower{'firstname'} =~ s/^ //g;
      $thisborrower{'surname'} =~ s/ $//g;
      if ($thisborrower{surname} eq '') {
         ($thisborrower{firstname},$thisborrower{surname}) = $thisborrower{firstname} =~ /(\w+) (.*)/;
      }
      if ($upcase_name){
         $thisborrower{'surname'} = uc($thisborrower{'surname'});
         $thisborrower{'firstname'} = uc($thisborrower{'firstname'});
      }
      next;
   }
   
   if ($thistag eq "USER_PROFILE"){
      if (exists $profiles_to_toss{uc $content} || exists $profiles_to_toss{uc $patron_cat_map{$content}}){
         $debug and warn "Tossing a borrower for profile $content.";
         $toss_this_borrower=1;
         next;
      }
      if (exists $patron_cat_map{uc $content}){
         $debug and warn "Swapping cat $content to $patron_cat_map{uc $content}.";
         $thisborrower{'categorycode'} = $patron_cat_map{uc $content};
         next;
      }
      $thisborrower{'categorycode'} = $content;
      next;
   }

   if ($thistag eq "USER_LIBRARY"){
      if (exists $branch_map{$content}){
         $debug and warn "Swapping branch $content to $branch_map{$content}.";
         $thisborrower{'branchcode'} = $branch_map{$content};
         next;
      }
      $thisborrower{'branchcode'} = $content;
      next;
   } 

   $addedcode .=",ALTID:$content" if ($thistag eq "USER_ALT_ID");
   $thisborrower{'cardnumber'} = $content if ($thistag eq "USER_ID");
   $thisborrower{'userid'} = $content if ($thistag eq "USER_ID");
   $thisborrower{'password'} = $content if ($thistag eq "USER_PIN");
   $thisborrower{'debarred'} = "2099-12-31" if (($thistag eq "USER_STATUS") && ($content eq "BARRED"));
   $thisborrower{'dateenrolled'} = _process_date($content) if ($thistag eq "USER_PRIV_GRANTED");
   $thisborrower{'dateexpiry'} = _process_date($content) if ($thistag eq "USER_PRIV_EXPIRES");
   if ($thisborrower{'dateexpiry'} eq q{}){
      $thisborrower{'dateexpiry'} = "2050-12-31";
   }
   $thisborrower{'dateofbirth'} = _process_date($content) if ($thistag eq "USER_BIRTH_DATE");

   if ($thistag eq "USER_CATEGORY1" && $cat1_tag ne q{}){
      if ($cat1_tag eq uc($cat1_tag)) {
         $addedcode .= ",$cat1_tag:$content";
      }
      else {
         $thisborrower{$cat1_tag} = $content;
      }
      $cat1s{$content}++;
      next;
   }

   if ($thistag eq "USER_CATEGORY2" && $cat2_tag ne q{}){
      if ($cat2_tag eq uc($cat2_tag)) {
         $addedcode .= ",$cat2_tag:$content";
      }
      else {
         $thisborrower{$cat2_tag} = $content;
      }
      $cat2s{$content}++;
      next;
   }

   if ($thistag eq "USER_CATEGORY3" && $cat3_tag ne q{}){
      if ($cat3_tag eq uc($cat3_tag)) {
         $addedcode .= ",$cat3_tag:$content";
      }
      else {
         $thisborrower{$cat3_tag} = $content;
      }
      $cat3s{$content}++;
      next;
   }

   if ($thistag eq "USER_CATEGORY4" && $cat4_tag ne q{}){
      if ($cat4_tag eq uc($cat4_tag)) {
         $addedcode .= ",$cat4_tag:$content";
      }
      else {
         $thisborrower{$cat4_tag} = $content;
      }
      $cat4s{$content}++;
      next;
   }

   if ($thistag eq "USER_CATEGORY5" && $cat5_tag ne q{}){
      if ($cat5_tag eq uc($cat5_tag)) {
         $addedcode .= ",$cat5_tag:$content";
      }
      else {
         $thisborrower{$cat5_tag} = $content;
      }
      $cat5s{$content}++;
      next;
   }

   if ($thistag eq "USER_ADDR1_BEGIN"){
      $addr1=1;
      next;
   }
   if ($thistag eq "USER_ADDR1_END"){
      $addr1=0;
      next;
   }
   if ($thistag eq "USER_ADDR2_BEGIN"){
      $addr2=1;
      next;
   }
   if ($thistag eq "USER_ADDR2_END"){
      $addr2=0;
      next;
   }
   if ($thistag eq "USER_ADDR3_BEGIN"){
      $addr3=1;
      next;
   }
   if ($thistag eq "USER_ADDR3_END"){
      $addr3=0;
      next;
   }
   if ($addr1){
      $debug and print $line."\n" if ($thistag eq "");
      $thisborrower{'city'} = $content if ($thistag eq "CITY/STATE");
      my ($city,$state) = split(/,/,$thisborrower{'city'},2);
      if ($city && $city ne $thisborrower{'city'}){
         $state =~ s/^\s+//;
         $thisborrower{'city'} = $city;
         $thisborrower{'state'} = $state;
      }

      $thisborrower{'zipcode'} = $content if ($thistag eq "ZIP");
      if ($thistag eq "STREET"){
         if (!$thisborrower{'address'}){
            $thisborrower{'address'} = $content;
         }
         else{
            $thisborrower{'address2'} = $content;
         }
      }
      $thisborrower{'address2'} = $content if ($thistag eq "ATTN" && !$thisborrower{'address2'});
      $thisborrower{'fax'} = $content if ($thistag eq "FAX");
      if ($thistag eq "EMAIL"){
         if ($content =~ /@/){
            $thisborrower{'email'} = $content;
            next;
         }
         $thisborrower{'borrowernotes'} .= " -- " if $thisborrower{'borrowernotes'};
         $thisborrower{'borrowernotes'} .= $content." ";
      }
      $thisborrower{'phone'} = $content if ($thistag eq "DAYPHONE");
      $thisborrower{'phone'} = $content if ($thistag eq "HOMEPHONE");
      $thisborrower{'phone'} = $content if ($thistag eq "PHONE");
      $thisborrower{'phonepro'} = $content if ($thistag eq "WORKPHONE");
      next;
   }
   if ($addr2){
      $debug and print $line."\n" if ($thistag eq "");
      next;
   }
   if ($addr3){
      $debug and print $line."\n" if ($thistag eq "");
      next;
   }
 
   if (exists $xinfo_maps{$thistag}) {
      if ($xinfo_maps{$thistag} eq uc($xinfo_maps{$thistag})) {
         $content =~ s/,/\-/g;
         $content =~ s/\"/'/g;
         $addedcode .= ",$xinfo_maps{$thistag}:$content";
      }
      else {
         $thisborrower{$xinfo_maps{$thistag}} = $content;
      }
      next;
   }

   $debug and print $line if ($thistag eq "");
}

if (%thisborrower && !$toss_this_borrower){
   $j++;
   $categories{$thisborrower{'categorycode'}}++;
   $branches{$thisborrower{'branchcode'}}++;
   $thisborrower{'privacy'} = $default_privacy;
   for my $k (0..scalar(@borrower_fields)-1){
      if ($thisborrower{$borrower_fields[$k]}){
         $thisborrower{$borrower_fields[$k]} =~ s/\"/'/g;
         if ($thisborrower{$borrower_fields[$k]} =~ /,/){
            print $out '"'.$thisborrower{$borrower_fields[$k]}.'"';
         }
         else{
            print $out $thisborrower{$borrower_fields[$k]};
         }
      }
      print $out ",";
   }
   print $out "\n";

   if ($addedcode){
      $addedcode =~ s/^,//;
      print $attrib $thisborrower{cardnumber}.',"'."$addedcode".'"'."\n";
   }

   if (exists $thisborrower{password}) {
      print $pass $thisborrower{cardnumber}.','.$thisborrower{password}."\n";
   }
}
$borrowers_tossed++ if ($toss_this_borrower);

print "\n\n$i lines read.\n$j borrowers found.\n$borrowers_tossed borrowers tossed out.\n";
open my $sql,">",$codesfile_name;
print "BRANCH COUNTS\n";
foreach my $kee (sort keys %branches){
   print "$kee: $branches{$kee}\n";
   print {$sql} "INSERT INTO branches (branchcode,branchname) VALUES ('$kee','$kee');\n";
}
print "\nCATEGORY COUNTS\n";
foreach my $kee (sort keys %categories){
   print "$kee: $categories{$kee}\n";
   print {$sql} "INSERT INTO categories (categorycode,description) VALUES ('$kee','$kee');\n";
}
print "\nUSER CAT1 COUNTS\n";
foreach my $kee (sort keys %cat1s){
   print "$kee: $cat1s{$kee}\n";
   print {$sql} "INSERT INTO authorised_values (category,authorised_value,lib) VALUES ('$cat1_tag','$kee','$kee');\n";
}
print "\nUSER CAT2 COUNTS\n";
foreach my $kee (sort keys %cat2s){
   print "$kee: $cat2s{$kee}\n";
   print {$sql} "INSERT INTO authorised_values (category,authorised_value,lib) VALUES ('$cat2_tag','$kee','$kee');\n";
}
print "\nUSER CAT3 COUNTS\n";
foreach my $kee (sort keys %cat3s){
   print "$kee: $cat3s{$kee}\n";
   print {$sql} "INSERT INTO authorised_values (category,authorised_value,lib) VALUES ('$cat3_tag','$kee','$kee');\n";
}
print "\nUSER CAT4 COUNTS\n";
foreach my $kee (sort keys %cat4s){
   print "$kee: $cat4s{$kee}\n";
   print {$sql} "INSERT INTO authorised_values (category,authorised_value,lib) VALUES ('$cat4_tag','$kee','$kee');\n";
}
print "\nUSER CAT5 COUNTS\n";
foreach my $kee (sort keys %cat5s){
   print "$kee: $cat5s{$kee}\n";
   print {$sql} "INSERT INTO authorised_values (category,authorised_value,lib) VALUES ('$cat5_tag','$kee','$kee');\n";
}
close $sql;

close $in;
close $out;
exit;

sub _process_date {
    my ($date_in) = @_;
    return "" if ($date_in eq "NEVER");
    my $year = substr($date_in,0,4);
    my $month = substr($date_in,4,2);
    my $day = substr($date_in,6,2);
    return sprintf "%d-%02d-%02d",$year,$month,$day;
}
