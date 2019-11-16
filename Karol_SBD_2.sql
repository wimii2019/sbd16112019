set SERVEROUTPUT ON;

DECLARE 
  var1  VARCHAR2(50):='foo';
  pi_value CONSTANT NUMBER := 3.1415;
  
  

begin
DBMS_OUTPUT.PUT_LINE('var1: '|| VAR1);
DBMS_OUTPUT.PUT_LINE('pi_value: '|| pi_value);
end;
/