
INSERT INTO users VALUES (default, 'christopher_robin');
INSERT INTO users VALUES (default, 'winnie_the_pooh');
INSERT INTO users VALUES (default, 'owl');
INSERT INTO users VALUES (default, 'pigglet');
INSERT INTO users VALUES (default, 'rabbit');

INSERT INTO games VALUES (default, 1, 50, true);
INSERT INTO games VALUES (default, 1, 50, true);
INSERT INTO games VALUES (default, 2, 10, true);
INSERT INTO games VALUES (default, 2, 20, true);
INSERT INTO games VALUES (default, 2, 40, true);
INSERT INTO games VALUES (default, 4, 0, true);

INSERT INTO questions VALUES (default, '������� ����� � ����?', '1)����� 150@2)160@3)240@4)����� 250@', 4, 10);
INSERT INTO questions VALUES (default, '����� ������ �������� ��������� ���� �� ������� � 2014 ����?', '1)��������@2)�������@3)��������@4)������@', 3, 10);
INSERT INTO questions VALUES (default, '������� ������� ������� � ������������ ��������?', '1)1@2)2@3)3@4)4@', 3, 10);
INSERT INTO questions VALUES (default, '������� ������� � ��������� �������?', '1)5@2)6@3)7@4)8@', 2, 10);
INSERT INTO questions VALUES (default, '��� �� ������������������ �� �������� ���������� ����� ����������������?', '1)�@2)�%@3)C++@4)C#@', 2, 10);
INSERT INTO questions VALUES (default, '��� �� ������������������ �� �������� �������������� �������?', '1)����������@2)���������@3)����������@4)��������@', 1, 30);
INSERT INTO questions VALUES (default, '������ ����� ������� � ������������ (5,12)?', '1)7@2)10@3)13@4)17@', 3, 10);

INSERT INTO pairs VALUES (1,1,1,true);
INSERT INTO pairs VALUES (1,2,2,true);
INSERT INTO pairs VALUES (1,3,3,true);
INSERT INTO pairs VALUES (1,4,4,true);
INSERT INTO pairs VALUES (1,5,5,true);

INSERT INTO pairs VALUES (2,1,1,true);
INSERT INTO pairs VALUES (2,2,2,true);
INSERT INTO pairs VALUES (2,3,3,true);
INSERT INTO pairs VALUES (2,4,4,true);
INSERT INTO pairs VALUES (2,5,5,true);

INSERT INTO pairs VALUES (3,1,1,false);
INSERT INTO pairs VALUES (3,2,2,false);
INSERT INTO pairs VALUES (3,3,3,false);
INSERT INTO pairs VALUES (3,4,4,false);
INSERT INTO pairs VALUES (3,5,5,true);

INSERT INTO pairs VALUES (4,1,1,false);
INSERT INTO pairs VALUES (4,2,2,false);
INSERT INTO pairs VALUES (4,3,3,false);
INSERT INTO pairs VALUES (4,4,4,false);
INSERT INTO pairs VALUES (4,7,5,true);

INSERT INTO pairs VALUES (5,5,1,true);
INSERT INTO pairs VALUES (5,2,2,false);
INSERT INTO pairs VALUES (5,3,3,false);
INSERT INTO pairs VALUES (5,4,4,false);
INSERT INTO pairs VALUES (5,6,5,true);

INSERT INTO pairs VALUES (6,2,1,false);
INSERT INTO pairs VALUES (6,1,2,false);
INSERT INTO pairs VALUES (6,3,3,false);
INSERT INTO pairs VALUES (6,7,4,false);
INSERT INTO pairs VALUES (6,6,5,false);