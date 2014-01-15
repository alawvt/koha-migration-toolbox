#inserts 336, 337, 338 into frameworks.  The following frameworks are included in this file: Default, ACQ, SR, IR, BKS, CF, VR, FA, KT, AR, SER
insert into marc_tag_structure (tagfield, liblibrarian, libopac, repeatable, mandatory, frameworkcode) values (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'AR'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'VR'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'SR'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'SER'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'ACQ'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'KT'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'IR'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'FA'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'CF'), (336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'BKS'),(336, 'CONTENT TYPE', 'CONTENT TYPE', 1,0,'');
insert into marc_tag_structure (tagfield, liblibrarian, libopac, repeatable, mandatory, frameworkcode) values (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'AR'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'VR'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'SR'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'SER'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'ACQ'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'KT'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'IR'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'FA'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'CF'), (337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'BKS'),(337, 'MEDIA TYPE', 'MEDIA TYPE', 1,0,'');
insert into marc_tag_structure (tagfield, liblibrarian, libopac, repeatable, mandatory, frameworkcode) values (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'AR'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'VR'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'SR'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'SER'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'ACQ'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'KT'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'IR'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'FA'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'CF'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'BKS'), (338, 'CARRIER TYPE', 'CARRIER TYPE', 1,0,'');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'AR'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'AR'), (336, '2','Source', 'Source', 0,0,3,0,0,'AR'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'AR'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'AR'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'AR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'BKS'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'BKS'), (336, '2','Source', 'Source', 0,0,3,0,0,'BKS'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'BKS'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'BKS'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'BKS');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,''), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,''), (336, '2','Source', 'Source', 0,0,3,0,0,''), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,''), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,''), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'CF'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'CF'), (336, '2','Source', 'Source', 0,0,3,0,0,'CF'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'CF'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'CF'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'CF');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'FA'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'FA'), (336, '2','Source', 'Source', 0,0,3,0,0,'FA'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'FA'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'FA'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'FA');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'IR'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'IR'), (336, '2','Source', 'Source', 0,0,3,0,0,'IR'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'IR'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'IR'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'IR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'KT'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'KT'), (336, '2','Source', 'Source', 0,0,3,0,0,'KT'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'KT'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'KT'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'KT');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'ACQ'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'ACQ'), (336, '2','Source', 'Source', 0,0,3,0,0,'ACQ'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'ACQ'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'ACQ'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'ACQ');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'SER'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'SER'), (336, '2','Source', 'Source', 0,0,3,0,0,'SER'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'SER'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'SER'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'SER');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'SR'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'SR'), (336, '2','Source', 'Source', 0,0,3,0,0,'SR'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'SR'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'SR'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'SR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (336, 'a','Content Type Term', 'Content Type Term', 1,0,3,0,0,'VR'), (336, 'b','Content Type Code', 'Content Type Code', 1,0,3,0,0,'VR'), (336, '2','Source', 'Source', 0,0,3,0,0,'VR'), (336, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'VR'), (336, '6','Linkage', 'Linkage', 1,0,3,0,0,'VR'), (336, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'VR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'AR'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'AR'), (337, '2','Source', 'Source', 0,0,3,0,0,'AR'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'AR'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'AR'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'AR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'BKS'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'BKS'), (337, '2','Source', 'Source', 0,0,3,0,0,'BKS'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'BKS'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'BKS'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'BKS');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,''), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,''), (337, '2','Source', 'Source', 0,0,3,0,0,''), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,''), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,''), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'CF'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'CF'), (337, '2','Source', 'Source', 0,0,3,0,0,'CF'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'CF'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'CF'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'CF');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'FA'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'FA'), (337, '2','Source', 'Source', 0,0,3,0,0,'FA'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'FA'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'FA'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'FA');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'IR'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'IR'), (337, '2','Source', 'Source', 0,0,3,0,0,'IR'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'IR'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'IR'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'IR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'KT'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'KT'), (337, '2','Source', 'Source', 0,0,3,0,0,'KT'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'KT'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'KT'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'KT');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'ACQ'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'ACQ'), (337, '2','Source', 'Source', 0,0,3,0,0,'ACQ'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'ACQ'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'ACQ'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'ACQ');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'SER'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'SER'), (337, '2','Source', 'Source', 0,0,3,0,0,'SER'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'SER'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'SER'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'SER');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'SR'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'SR'), (337, '2','Source', 'Source', 0,0,3,0,0,'SR'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'SR'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'SR'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'SR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (337, 'a','Media Type Term', 'Media Type Term', 1,0,3,0,0,'VR'), (337, 'b','Media Type Code', 'Media Type Code', 1,0,3,0,0,'VR'), (337, '2','Source', 'Source', 0,0,3,0,0,'VR'), (337, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'VR'), (337, '6','Linkage', 'Linkage', 1,0,3,0,0,'VR'), (337, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'VR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'AR'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'AR'), (338, '2','Source', 'Source', 0,0,3,0,0,'AR'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'AR'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'AR'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'AR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'BKS'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'BKS'), (338, '2','Source', 'Source', 0,0,3,0,0,'BKS'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'BKS'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'BKS'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'BKS');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,''), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,''), (338, '2','Source', 'Source', 0,0,3,0,0,''), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,''), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,''), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'CF'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'CF'), (338, '2','Source', 'Source', 0,0,3,0,0,'CF'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'CF'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'CF'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'CF');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'FA'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'FA'), (338, '2','Source', 'Source', 0,0,3,0,0,'FA'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'FA'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'FA'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'FA');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'IR'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'IR'), (338, '2','Source', 'Source', 0,0,3,0,0,'IR'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'IR'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'IR'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'IR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'KT'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'KT'), (338, '2','Source', 'Source', 0,0,3,0,0,'KT'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'KT'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'KT'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'KT');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'ACQ'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'ACQ'), (338, '2','Source', 'Source', 0,0,3,0,0,'ACQ'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'ACQ'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'ACQ'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'ACQ');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'SER'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'SER'), (338, '2','Source', 'Source', 0,0,3,0,0,'SER'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'SER'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'SER'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'SER');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'SR'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'SR'), (338, '2','Source', 'Source', 0,0,3,0,0,'SR'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'SR'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'SR'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'SR');
insert into marc_subfield_structure (tagfield, tagsubfield, liblibrarian, libopac, repeatable, mandatory, tab, isurl, hidden, frameworkcode) values (338, 'a','Carrier Type Term', 'Carrier Type Term', 1,0,3,0,0,'VR'), (338, 'b','Carrier Type Code', 'Carrier Type Code', 1,0,3,0,0,'VR'), (338, '2','Source', 'Source', 0,0,3,0,0,'VR'), (338, '3','Materials Specified', 'Materials Specified', 1,0,3,0,0,'VR'), (338, '6','Linkage', 'Linkage', 1,0,3,0,0,'VR'), (338, '8','Field link and sequence number', 'Field link and sequence number', 1,0,3,0,0,'VR');