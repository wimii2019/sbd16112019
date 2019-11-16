set SERVEROUTPUT ON;

DECLARE 
  var1  VARCHAR2(50):='foo';
  pi_value CONSTANT NUMBER := 3.1415;
  v_salary NUMBER:=14500;
  TYPE object1 IS RECORD(
    attr_a VARCHAR2(20),
    attr_b NUMBER
  );
  
  TYPE adres IS RECORD(
  adres_id NUMBER(12,0),
  adres_ulica VARCHAR2(50) ,
  adres_numer_budynku NUMBER(4,0),
  adres_numer_mieszkania NUMBER(4,0),
  adres_miejscowosc VARCHAR2(50),
  adres_kod_pocztowy VARCHAR2(6),
  adres_poczta VARCHAR2(50),
  adres_wojewodztwo_id NUMBER(2,0)
  );
  
  instanceObject1 object1;
  
  --o_countries countries%ROWTYPE;
  
  v_lastName VARCHAR2 :='KOWALSKI';
  v_lenght NUMBER := 0;
  v_i NUMBER := 1;

begin
DBMS_OUTPUT.PUT_LINE('var1: '|| VAR1);
DBMS_OUTPUT.PUT_LINE('pi_value: '|| pi_value);
v_lenght := LENGHT(v_lastName);

instanceObject1.attr_a :='test';
instanceObject1.attr_b :=5;

--select * into o_countries from COUNTRIES;
IF(v_salary<3000)THEN
  dbms_output.put_line('MALO');
ELSIF (v_salary BETWEEN 3000 AND 10000 )THEN
  dbms_output.put_line('JEST DOBRZE');
ELSE
  dbms_output.put_line('GRATULACJE');
END IF;

end;
/

DECLARE 
  CURSOR c_countries IS 
  SELECT * FROM COUNTRIES;
  vr_country countries%ROWTYPE;
BEGIN

OPEN c_countries;
LOOP
  FETCH c_countries INTO vr_country;
  EXIT WHEN c_countries%NOTFOUND OR c_countries%NOTFOUND IS NULL;
  DBMS_OUTPUT.PUT_LINE(c_countries%ROWCOUNT);
  END LOOP;
CLOSE c_countries;
END;
/


BEGIN

FOR vr_country in (SELECT * FROM COUNTRIES) LOOP
  dbms_output.put_line('Country: '|| vr_country.region_id);
END LOOP;
END;
/

CREATE OR REPLACE PROCEDURE
hello_world
IS
begin
dbms_output.put_line('Hello world');
end;
/

EXECUTE hello_world;

CREATE OR REPLACE FUNCTION country_name(p_id COUNTRIES.COUNTRY_ID%TYPE)
RETURN COUNTRIES.COUNTRY_NAME%TYPE
IS
  v_name COUNTRIES.COUNTRY_NAME%TYPE;
BEGIN
  SELECT COUNTRY_NAME INTO v_name FROM COUNTRIES WHERE COUNTRY_ID= p_id;
  RETURN  v_name;
END;
/

CREATE TABLE emp_audit(
  emp_autit_id NUMBER(4) PRIMARY KEY,
  act_date DATE,
  table_name VARCHAR2(20),
  action VARCHAR2(10)
);

create SEQUENCE emp_audit_seq;

