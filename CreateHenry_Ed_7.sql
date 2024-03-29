DROP TABLE WROTE;
DROP TABLE INVENTORY;
DROP TABLE BOOK;
DROP TABLE PUBLISHER;
DROP TABLE AUTHOR;
DROP TABLE BRANCH;

CREATE TABLE AUTHOR (AUTHOR_NUM   DECIMAL(2,0) NOT NULL, 
                     AUTHOR_LAST  CHAR(12), 
                     AUTHOR_FIRST CHAR(10),
                     CONSTRAINT PKAUTHOR PRIMARY KEY (AUTHOR_NUM)); 

CREATE TABLE PUBLISHER (PUBLISHER_CODE CHAR(3) NOT NULL, 
                        PUBLISHER_NAME CHAR(25), 
                        CITY           CHAR(20),
                        CONSTRAINT PKPUBLISHER PRIMARY KEY(PUBLISHER_CODE));

CREATE TABLE BOOK (BOOK_CODE      CHAR(4) NOT NULL, 
                   TITLE          CHAR(40), 
                   PUBLISHER_CODE CHAR(3), 
                   TYPE           CHAR(3), 
                   PRICE          DECIMAL(8,2), 
                   PAPERBACK      CHAR(1),
                   CONSTRAINT PKBOOK PRIMARY KEY (BOOK_CODE),
                   CONSTRAINT FKPUB  FOREIGN KEY (PUBLISHER_CODE) REFERENCES PUBLISHER); 

CREATE TABLE BRANCH (BRANCH_NUM      DECIMAL(2,0) NOT NULL,
                     BRANCH_NAME     CHAR(50), 
                     BRANCH_LOCATION CHAR(50), 
                     NUM_EMPLOYEES   DECIMAL(2,0),
                     CONSTRAINT PKBRANCH PRIMARY KEY (BRANCH_NUM)); 
 
CREATE TABLE INVENTORY (BOOK_CODE  CHAR(4)      NOT NULL,
                        BRANCH_NUM DECIMAL(2,0) NOT NULL,
                        ON_HAND    DECIMAL(2,0),
                        CONSTRAINT PKINVENT PRIMARY KEY (BOOK_CODE, BRANCH_NUM),
                        CONSTRAINT FKBOOK1 FOREIGN KEY (BOOK_CODE) REFERENCES BOOK,
                        CONSTRAINT FKBRANCH FOREIGN KEY (BRANCH_NUM) REFERENCES BRANCH); 

CREATE TABLE WROTE (BOOK_CODE  CHAR(4)      NOT NULL,
                    AUTHOR_NUM DECIMAL(2,0) NOT NULL, 
                    SEQUENCE   DECIMAL(2,0),
                    CONSTRAINT PKWROTE PRIMARY KEY (BOOK_CODE, AUTHOR_NUM),
                    CONSTRAINT FKBOOK2 FOREIGN KEY (BOOK_CODE) REFERENCES BOOK,
                    CONSTRAINT FKAUTHOR FOREIGN KEY (AUTHOR_NUM) REFERENCES AUTHOR);


INSERT INTO BRANCH VALUES (1,'Henry Downtown','16 Riverview', 10),
                          (2,'Henry On The Hill','1289 Bedford',6),
                          (3,'Henry Brentwood','Brentwood Mall',15), 
                          (4,'Henry Eastshore','Eastshore Mall',9); 

INSERT INTO PUBLISHER VALUES ('AH','Arkham House','Sauk City WI'), 
                             ('AP','Arcade Publishing','New York'), 
                             ('BA','Basic BOOKs','Boulder CO'), 
                             ('BP','Berkley Publishing','Boston'), 
                             ('BY','Back Bay BOOKs','New York'), 
                             ('CT','Course Technology','Cambridge MA'), 
                             ('FA','Fawcett BOOKs','New York'), 
                             ('FS','Farrar Straus and Giroux','New York'), 
                             ('HC','HarperCollins PUBLISHERs','New York'), 
                             ('JP','Jove Publications','New York'), 
                             ('JT','Jeremy P. Tarcher','Los Angeles'), 
                             ('LB','Lb BOOKs','New York'), 
                             ('MP','McPherson and Co.','Kingston'), 
                             ('PE','Penguin USA','New York'), 
                             ('PL','Plume','New York'), 
                             ('PU','Putnam Publishing Group','New York'), 
                             ('RH','Random House','New York'), 
                             ('SB','Schoken BOOKs','New York'), 
                             ('SC','Scribner','New York'), 
                             ('SS','Simon and Schuster','New York'), 
                             ('ST','Scholastic Trade','New York'), 
                             ('TA','Taunton Press','Newtown CT'), 
                             ('TB','Tor BOOKs','New York'), 
                             ('TH','Thames and Hudson','New York'), 
                             ('TO','Touchstone BOOKs','Westport CT'), 
                             ('VB','Vintage BOOKs','New York'), 
                             ('WN','W.W. Norton','New York'), 
                             ('WP','Westview Press','Boulder CO');

INSERT INTO AUTHOR VALUES (1,'Morrison','Toni'), 
                          (2,'Solotaroff','Paul'), 
                          (3,'Vintage','Vernor'), 
                          (4,'Francis','Dick'), 
                          (5,'Straub','Peter'), 
                          (6,'King','Stephen'), 
                          (7,'Pratt','Philip'), 
                          (8,'Chase','Truddi'), 
                          (9,'Collins','Bradley'), 
                          (10,'Heller','Joseph'), 
                          (11,'Wills','Gary'), 
                          (12,'Hofstadter','Douglas R.'), 
                          (13,'Lee','Harper'), 
                          (14,'Ambrose','Stephen E.'), 
                          (15,'Rowling','J.K.'), 
                          (16,'Salinger','J.D.'), 
                          (17,'Heaney','Seamus'), 
                          (18,'Camus','Albert'), 
                          (19,'Collins, Jr.','Bradley'), 
                          (20,'Steinbeck','John'), 
                          (21,'Castelman','Riva'), 
                          (22,'Owen','Barbara'), 
                          (23,'O''Rourke','Randy'), 
                          (24,'Kidder','Tracy'), 
                          (25,'Schleining','Lon'); 
 
INSERT INTO BOOK VALUES ('0180','A Deepness in the Sky','TB','SFI',7.19,'Y'), 
                        ('0189','Magic Terror','FA','HOR',7.99,'Y'), 
                        ('0200','The Stranger','VB','FIC',8.00,'Y'), 
                        ('0378','Venice','SS','ART',24.50,'N'), 
                        ('079X','Second Wind','PU','MYS',24.95,'N'), 
                        ('0808','The Edge','JP','MYS',6.99,'Y'), 
                        ('1351','Dreamcatcher: A Novel','SC','HOR',19.60,'N'), 
                        ('1382','Treasure Chests','TA','ART',24.46,'N'), 
                        ('138X','Beloved','PL','FIC',12.95,'Y'), 
                        ('2226','Harry Potter and the Prisoner of Azkaban','ST','SFI',13.96,'N'),
                        ('2281','Van Gogh and Gauguin','WP','ART',21.00,'N'), 
                        ('2766','Of Mice and Men','PE','FIC',6.95,'Y'), 
                        ('2908','Electric Light','FS','POE',14.00,'N'), 
                        ('3350','Group: Six People in Search of a Life','BP','PSY',10.4,'Y'),
                        ('3743','Nine Stories','LB','FIC',5.99,'Y'), 
                        ('3906','The Soul of a New Machine','BY','SCI',11.16,'Y'), 
                        ('5790','Catch-22','SC','fic',12.00,'Y'),
                        ('5163','Travels with Charley','PE','TRA',7.95,'Y'), 
                        ('6128','Jazz','PL','FIC',12.95,'Y'), 
                        ('6328','Band of Brothers','TO','HIS',9.60,'Y'), 
                        ('669X','A Guide to SQL','CT','CMP',37.95,'Y'), 
                        ('6908','Franny and Zooey','LB','FIC',5.99,'Y'), 
                        ('7405','East of Eden','PE','FIC',12.95,'Y'), 
                        ('7443','Harry Potter and the Goblet of Fire','ST','SFI',18.16,'N'), 
                        ('7559','The Fall','VB','FIC',8.00,'Y'), 
                        ('8092','Godel, Escher, Bach','BA','PHI',14.00,'Y'), 
                        ('8720','When Rabbit Howls','JP','PSY',6.29,'Y'), 
                        ('9611','Black House','RH','HOR',18.81,'N'), 
                        ('9627','Song of Solomon','PL','FIC',14.00,'Y'), 
                        ('9701','The Grapes of Wrath','PE','FIC',13.00,'Y'), 
                        ('9882','Slay Ride','JP','MYS',6.99,'Y'), 
                        ('9883','The Catcher in the Rye','LB','FIC',5.99,'Y'), 
                        ('9931','To Kill a Mockingbird','HC','FIC',18.00,'N'); 

INSERT INTO WROTE VALUES ('0180',3,1) , 
                         ('0189',5,1) , 
                         ('0200',18,1), 
                         ('0378',11,1), 
                         ('079X',4,1) , 
                         ('0808',4,1) , 
                         ('1351',6,1) , 
                         ('1382',23,2), 
                         ('1382',25,1), 
                         ('138X',1,1) , 
                         ('2226',15,1), 
                         ('2281',9,2) , 
                         ('2281',19,1), 
                         ('2766',20,1), 
                         ('2908',17,1), 
                         ('3350',2,1) , 
                         ('3743',16,1), 
                         ('3906',24,1), 
                         ('5163',20,1), 
                         ('5790',10,1), 
                         ('6128',1,1) , 
                         ('6328',14,1), 
                         ('669X',7,1) , 
                         ('6908',16,1), 
                         ('7405',20,1), 
                         ('7443',15,1), 
                         ('7559',18,1), 
                         ('8092',12,1), 
                         ('8720',8,1) , 
                         ('9611',5,2) , 
                         ('9611',6,1) , 
                         ('9627',1,1) , 
                         ('9701',20,1), 
                         ('9882',4,1) , 
                         ('9883',16,1), 
                         ('9931',13,1); 

INSERT INTO INVENTORY VALUES ('0180',1,2), 
                             ('0189',2,2), 
                             ('0200',1,1), 
                             ('0200',2,3), 
                             ('0378',3,2), 
                             ('079X',2,1), 
                             ('079X',3,2), 
                             ('079X',4,3), 
                             ('0808',2,1), 
                             ('1351',2,4), 
                             ('1351',3,2), 
                             ('1382',2,1), 
                             ('138X',2,3), 
                             ('2226',1,3), 
                             ('2226',3,2), 
                             ('2226',4,1), 
                             ('2281',4,3), 
                             ('2766',3,2), 
                             ('2908',1,3), 
                             ('2908',4,1), 
                             ('3350',1,2), 
                             ('3743',2,1), 
                             ('3906',2,1), 
                             ('3906',3,2), 
                             ('5163',1,1), 
                             ('5790',4,2), 
                             ('6128',2,4), 
                             ('6128',3,3), 
                             ('6328',2,2), 
                             ('669X',1,1), 
                             ('6908',2,2), 
                             ('7405',3,2), 
                             ('7443',4,1), 
                             ('7559',2,2), 
                             ('8092',3,1), 
                             ('8720',1,3), 
                             ('9611',1,2), 
                             ('9627',3,5), 
                             ('9627',4,2), 
                             ('9701',1,2), 
                             ('9701',2,1), 
                             ('9701',3,3), 
                             ('9701',4,2), 
                             ('9882',3,3), 
                             ('9883',2,3), 
                             ('9883',4,2), 
                             ('9931',1,2); 

