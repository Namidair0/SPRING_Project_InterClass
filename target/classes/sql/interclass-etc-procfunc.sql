CREATE OR REPLACE PROCEDURE I_SZP_MEM_RESET(SEQ_NAME IN VARCHAR2)
IS
    L_VAL NUMBER;
BEGIN
 
    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;
    
    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY -'|| L_VAL ||' MINVALUE 0';
    
    EXECUTE IMMEDIATE 'SELECT '|| SEQ_NAME ||'.NEXTVAL FROM DUAL' INTO L_VAL;
    
    EXECUTE IMMEDIATE 'ALTER SEQUENCE '|| SEQ_NAME ||' INCREMENT BY 1 MINVALUE 0';
 
END;


CREATE OR REPLACE FUNCTION I_ZBF_GET_MEM(
    p_type IN VARCHAR2
) RETURN VARCHAR2
AS
     v_returnValue VARCHAR2(180);
BEGIN
 
    BEGIN
 
          SELECT TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(I_SEQ_MEM.nextval, 3, 0)
          INTO v_returnValue
          FROM dual;
 
    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        v_returnValue := ' ';
      WHEN OTHERS THEN
        v_returnValue := ' ';
    END;
 
    RETURN v_returnValue;
END;


SELECT I_ZBF_GET_MEM('now') FROM DUAL;