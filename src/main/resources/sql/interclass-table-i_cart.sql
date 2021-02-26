CREATE TABLE "HR"."I_CART" 
   ("CARTNUM" NUMBER, 
	"MID" VARCHAR2(50 BYTE), 
	"LECTURENUM" NUMBER, 
	"ADDDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
  
REM INSERTING into HR.I_CART
SET DEFINE OFF;

CREATE UNIQUE INDEX "HR"."SYS_C0013955" ON "HR"."I_CART" ("CARTNUM", "MID") 
PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS" ;

ALTER TABLE "HR"."I_CART" ADD PRIMARY KEY ("CARTNUM", "MID")
USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
TABLESPACE "USERS"  ENABLE;
  
ALTER TABLE "HR"."I_CART" MODIFY ("LECTURENUM" NOT NULL ENABLE);
ALTER TABLE "HR"."I_CART" MODIFY ("MID" NOT NULL ENABLE);
ALTER TABLE "HR"."I_CART" MODIFY ("CARTNUM" NOT NULL ENABLE);

ALTER TABLE "HR"."I_CART" ADD CONSTRAINT "INT_I_CART_LECTURENUM" FOREIGN KEY ("LECTURENUM")
REFERENCES "HR"."I_LECTURECLASS" ("LECTURENUM") ENABLE;