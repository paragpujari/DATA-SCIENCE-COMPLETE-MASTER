USE DBMS;
----------------------------------------SQL STRING FUNCTIONS--------------------------------------------------------------------------

------- 1. ASCII() = It returns the ASCII Value code of a particular character.

SELECT ASCII('A') AS ascii;

SELECT ASCII('Z') AS ascii;

SELECT ASCII('M') AS ASCII;

SELECT ASCII('m') AS ASCII;

SELECT ASCII('Z') as ascii;

SELECT ASCII('z') as ascii;


------ 2. CHAR() = It returns the character value of an ASCII value.

SELECT CHAR(65) AS CHAR_VALUE;

SELECT CHAR(90) AS CHAR_VALUE;

SELECT CHAR(97) AS CHAR_VALUE;

SELECT CHAR(122) AS CHAR_VALUE;


---------- 3. CHARINDEX() = It returns the index position of the particular substring inside the string.

SELECT CHARINDEX('SQL', 'SQL STRING FUNCTIONS');

SELECT CHARINDEX('class', 'Parag is most sincere boy in the class');

SELECT CHARINDEX('park' , 'There is a park nearby my house');

SELECT CHARINDEX('vegetables', 'I need to buy some vegetables from the market');


-------------- 4. CONCAT() = It is used to combine two or more strings into a single string.

SELECT CONCAT('Parag' , ' ' , 'Pujari');

SELECT CONCAT('Apples' , ' ' , ' Mangoes' , ' ' , 'Strawberry' , ' ' , ' Guava' , ' ' , 'Papaya');

SELECT CONCAT('My', ' ' ,'name' , ' ' , 'is' , ' ', 'Parag', ' ' , ' Pujari');

SELECT CONCAT('I' , ' ', 'need', ' ' , 'to' , ' ', 'get' , ' ', 'this', ' ' ,'task', ' ', 'done');


-------------- 5. CONCAT_WS() = It combines multiple strings into a single string with the help of sepeartor.
SELECT CONCAT_WS('-','1995','07','01');

SELECT CONCAT_WS(' ', 'Parag', 'Pujari');

SELECT CONCAT_WS('/' ,'D','49');

SELECT CONCAT_WS('@','paragpujari95','gmail.com');



------------- 6. DIFFERENCE() = It compares the soundex() value fo the two given strings.
SELECT DIFFERENCE(SOUNDEX('Two'), SOUNDEX('Too'));

SELECT DIFFERENCE(SOUNDEX('Seema'), SOUNDEX('Aeema'));

SELECT DIFFERENCE(SOUNDEX('Tar'), SOUNDEX('Jar'));

SELECT DIFFERENCE(SOUNDEX('pot'), SOUNDEX('dot'));


-------------- 7. LEFT() = It extracts the given number of characters from the left side of the string.

SELECT LEFT('Parag',1);

SELECT LEFT('Parag Pujari', 5);

SELECT LEFT('SQL SERVER Functions', 3);

SELECT LEFT('Tim and Jim went for a movie', 3);


------------ 8. RIGHT() = It extracts the given number of characters starting from the right side of the string.

SELECT RIGHT('Parag',1);

SELECT RIGHT('Parag Pujari', 6);

SELECT RIGHT('SQL SERVER Functions', 9);

SELECT RIGHT('Tim and Jim went for a movie', 5);


----------- 9. LEN() = It returns the number of characters for a particular string.

SELECT LEN('Parag Pujari');

SELECT LEN('Jack and Jill went up to the hill');

SELECT LEN('He has to go to the market');

SELECT LEN('The animal is going to die');

------------- 10. LOWER() = It converts the string to the lower case.

SELECT LOWER('PARAG PUJARI');

SELECT LOWER('HE NEEDS TO DO THIS WORK');

SELECT LOWER('HE IS GOING TO THE MARKET');

SELECT LOWER('I AM ABOUT TO FIND MY DIARY');

-------------- 11. UPPER() = It converts the string into the upper case.

SELECT UPPER('parag pujari');

SELECT UPPER('he is bathing in the bathroom');

SELECT UPPER('he has done his work');

SELECT UPPER('i am going to my office now');


----------------- 12. LTRIM() = It removes all the blankspaces starting from the left side of the string.

SELECT LTRIM('         parag pujari');

SELECT LTRIM('        he is bathing in the bathroom');

SELECT LTRIM('        he has done his work');

SELECT LTRIM('        i am going to my office now');


--------------- 13. RTRIM() = It removes all the blankspaces starting from the right side of the string.

SELECT RTRIM('parag pujari                           ');

SELECT RTRIM('he is bathing in the bathroom           ');

SELECT RTRIM('he has done his work                     ');

SELECT RTRIM('i am going to my office now               ');




---------------- 14. REPLACE() = It is used to change one portion of the substring with the new substring in the given string.

SELECT REPLACE('It is a good time to have my coffee', 'coffee', 'tea');

SELECT  REPLACE('I am going to delhi tonight', 'tonight', 'tommorrow');

SELECT REPLACE('He has to go to the market to buy some fruits', 'fruits', 'vegetables');

SELECT REPLACE('He is having his breakfast','breakfast', 'lunch');


---------------- 15.  REPLICATE() = It is used to repete the number of occurances in the given string.

SELECT REPLICATE('Parag', 5);

SELECT REPLICATE('Apples', 10);

SELECT REPLICATE('Parag Pujari', 5);

SELECT REPLICATE('Data', 10);

---------------- 16. REVERSE() = It is used to reverse a given string.

SELECT REVERSE('Parag');

SELECT REVERSE('Apples');

SELECT REVERSE('Parag Pujari');

SELECT REVERSE('Data');


--------------17. SOUNDEX() = It returns the four character code of a given string.

SELECT SOUNDEX('Too'), SOUNDEX('Two');

SELECT SOUNDEX('Samna'), SOUNDEX('Aamna');

SELECT SOUNDEX('Jill'), SOUNDEX('Hill');

SELECT SOUNDEX('Take'), SOUNDEX('Sake');


---------- 18. SPACE()  = It returns the string of repeated spaces.

SELECT 'Parag' + SPACE(1) + 'Pujari';

SELECT 'I am going to meet' +SPACE(1) + 'the market';

SELECT 'He needs to ' + SPACE(1) + 'his work';

SELECT 'Jack and Jill' + SPACE(1) + 'went up to the hill';


--------- 19. STR() = It returns the character data from the numeric data.

SELECT STR(10);

SELECT STR(90.87);

SELECT STR(123.5678);

SELECT STR(89);


SELECT * FROM tblperson

------------------20. STRING_AGG() = It concatenated the rows of the string into a single string.
SELECT  STRING_AGG(EMAIL, ';') FROM tblperson

SELECT STRING_AGG(Name, ' ') FROM tblperson;

SELECT STRING_AGG(ID , '-') FROM tblperson;

SELECT STRING_AGG(GENDERID, '/') FROM tblperson;


--------------- 21. STRING_ESCAPE() = It is  used to escape the special characters in the string and returns the new string with the new escaped characters.
SELECT STRING_ESCAPE('[''	This is a special / "message" /'']', 'json');


---------------- 22. STUFF() = It is used to delete the portion of a particular substring from the given string and inserts the new substring in the given string.
SELECT STUFF('SQL SERVER FUNCTIONS', 1, 3, 'Data');

SELECT STUFF('Python and Machine Learning',12, 26, 'Statistics');

SELECT STUFF('I am going to the market',1,4,'My name is Parag, I am');

SELECT STUFF('We need to learn Python and Machine Learning for our project',29,44, 'Big Data for our project');

SELECT STUFF('I am going to the office tomorrow',19, 24,'college tommorrow');

---------------23. TRANSLATE() = It is used to convert the string of one form into another form given in the second arguement in the string.

SELECT TRANSLATE('[408] 6785 7865', '[]','()');

SELECT TRANSLATE('408-555-6789','-','/') ;

SELECT TRANSLATE('408/555/6789','/','-') ;


SELECT TRANSLATE('408@555@6789','@','_') ;



--------------- 24. TRIM() = It is used to remove the blankspaces from both the left and right side of the string.

SELECT TRIM('  Parag Pujari  ');


SELECT TRIM('  Abha and Arzoo are one name  ');


SELECT TRIM('  I need to do this work now  ');


SELECT TRIM('  He is going to the market now  ');
