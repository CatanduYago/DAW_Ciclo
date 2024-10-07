/* Esto va a ser un glosario
de las sentencias SQL del tema 3*/

CREATE USER prueba IDENTIFIED BY 1234;                          --Crea un usuario.
GRANT connect,resource TO prueba;                               --Asigna permisos.

SELECT 'Hola' || ' mundo' FROM dual;                            --Junta cadena de caracteres
SELECT LENGTH ('Hola Mundo') AS "Nº Caracteres"  FROM dual ;    --Cuenta el numero de caracteres
SELECT UPPER ('Hola Mundo')  AS "Nº Caracteres"  FROM dual ;    --Pone en mayuscula todas las letras
SELECT LOWER ('Hola Mundo')  AS "Nº Caracteres"  FROM dual ;    --POne en minuscula todas las letras

SELECT POWER (2,3) AS "Potencia" FROM dual;                     --Hace 2 elevado a 3

SELECT SYSDATE FROM dual;                                       --Recoge la fecha actual del ordenador

SELECT TO_DATE ('29/11/23','DD MM YY') FROM dual;               --Le da formato fecha a unos caracteres

CREATE USER prueba_eliminacion IDENTIFIED BY 1234;              --Crea el usuario prueba eliminacion
SHOW USER;

CREATE TABLE usuarios (                                         --Crea la tabla usuarios
    nombre      CHAR (30),
    clave       VARCHAR2(10),
    telefono    NUMBER (10),
    saldo       NUMBER (6,2),
    cumpleaños  DATE,
    fecha       TIMESTAMP,
    bool        NUMBER(1,0),
    imagen      BLOB,
    descripcion CLOB
    
    );

DESCRIBE usuarios;                                              -- 

INSERT INTO usuarios(nombre) VALUES ('Yago');                    -- Insertamos valores a la tabla

SELECT * FROM usuarios;

INSERT INTO usuarios(nombre) VALUES ('Ramon');
INSERT INTO usuarios(nombre) VALUES ('Manu');

SELECT * FROM usuarios;

INSERT INTO usuarios(nombre,clave,telefono,saldo) VALUES ('Oscar','Lint','644850136','20,35');

SELECT * FROM usuarios;

INSERT INTO usuarios(clave) VALUES ('Miguel') WHERE clave='NULL';

CREATE TABLE borrados(
    nombre CHAR);
    
DROP TABLE BORRADOS;

INSERT INTO usuarios(cumpleaños) VALUES ('21-Noviembre-04');

SELECT * FROM usuarios;

INSERT INTO usuarios(cumpleaños,fecha) VALUES ('11-02-2006','29-11-2023');

SELECT * FROM usuarios;

INSERT ALL INTO usuarios (nombre) VALUES ('Yoya'),
       ( 'Estopa'),
       ( 'David');
ALTER TABLE usuarios ADD (Apellido VARCHAR(10));

DESCRIBE usuarios;

ALTER TABLE usuarios DROP (Apellido);

CREATE TABLE tablacheck (
    nombre   NUMBER,
    apellido CHAR (25),
    clave    VARCHAR2(10),
    telefono NUMBER(6,2),
    saldo    NUMBER(10),
    cumpleaños DATE,
    CONSTRAINT constraint1 CHECK (nombre >=10 AND
                              clave IS NOT NULL AND
                              telefono NOT IN(091,092) AND
                              saldo= ANY (10,11) AND
                              apellido LIKE ('La%')
            )
            );

DROP TABLE tablacheck;

SELECT * FROM tablacheck;

INSERT INTO tablacheck(nombre) VALUES (5);

INSERT INTO tablacheck(nombre,clave) VALUES (14,1);

INSERT INTO tablacheck(nombre,clave,telefono) VALUES (10,2,192);

INSERT INTO tablacheck(nombre,clave,telefono,saldo) VALUES (10,3,192,10.5);

INSERT INTO tablacheck(nombre,clave,telefono,saldo,apellido,constraint1) VALUES (10,3,192,10,'La eh');

SELECT * FROM tablacheck;

CREATE TABLE restricciones(
    nombre CHAR (5),
    CONSTRAINT claveprimaria PRIMARY KEY (nombre)
);

CREATE TABLE restricciones2( nombre CHAR(5) CONSTRAINT clavprim1 PRIMARY KEY);

CREATE TABLE restricciones3(
nombre CHAR (5) CONSTRAINT clavprim2 PRIMARY KEY,
CONSTRAINT clavfor FOREIGN KEY (nombre) REFERENCES restricciones(nombre));

CREATE TABLE restricciones4(
nombre CHAR (5) CONSTRAINT clavprim1 PRIMARY KEY,
CONSTRAINT clavfor FOREIGN KEY (nombre) REFERENCES restricciones2(nombre));

INSERT ALL INTO restricciones(nombre) VALUES('ASd')
            INTO restricciones(nombre) VALUES('Msdau')
            INTO restricciones(nombre) VALUES('asdoa')
            INTO restricciones(nombre) VALUES('Ndsae')  
            SELECT * FROM restricciones;
            
SELECT * FROM restricciones;

SELECT * FROM USER_TABLES;

CREATE TABLE primarytable (
        id1 NUMBER,
        id2 NUMBER, 
        CONSTRAINT ct_pk_id1id2_pitab PRIMARY KEY (id1, id2)
        );
        
CREATE TABLE tabla1(
    id1 NUMBER PRIMARY KEY
    );
    
CREATE TABLE tabla2 ( 
    id1 NUMBER PRIMARY KEY,
    FOREIGN KEY (id1) REFERENCES tabla1(id1)
    );
    
DROP TABLE tabla1 CASCADE CONSTRAINT;

SELECT * FROM all_constraints WHERE TABLE_NAME ='TABLA2';

ALTER TABLE tabla2 DROP CONSTRAINT SYS_C007013;

RENAME tabla2 TO tabla1;
DESCRIBE tabla1;

TRUNCATE TABLE usuarios;
SELECT * FROM usuarios;

ALTER TABLE tabla1 ADD CONSTRAINT ct_pk_id1_tab1 PRIMARY KEY(id1);

SELECT * FROM all_constraints WHERE TABLE_NAME ='TABLA1';

ALTER TABLE tabla1 ADD id2 NUMBER;
ALTER TABLE tabla1 DROP (id2);
ALTER TABLE tabla1 MODIFY id1 CHAR;

DESCRIBE tabla1;

SELECT * FROM all_constraints WHERE TABLE_NAME ='TABLA1';

CREATE TABLE tabla_vista ( 
    identificador NUMBER PRIMARY KEY,
    nombre VARCHAR2 (10),
    apellidos VARCHAR2 (10),
    telefono NUMBER
);
SHOW USER;
DROP TABLE tabla_vista;

    CREATE OR REPLACE VIEW primer_view (idf,nom,ape,telf)                   
        AS SELECT identificador,nombre,apellidos,telefono FROM tabla_vista; 

INSERT INTO tabla_vista(identificador,nombre,apellidos,telefono)
    VALUES (1,'Yago','Catalano',1); 
    
SELECT * FROM tabla_vista;
SELECT * FROM primer_view;

SELECT id,telf FROM primer_view;
SELECT identificador,telefono FROM primer_view;

CREATE OR REPLACE VIEW primer_view
    AS SELECT identificador,nombre,apellidos,telefono FROM tabla_vista;

SELECT id FROM primer_view;
SELECT TEXT FROM USER_VIEWS;

SELECT * FROM USER_INDEXES;

SELECT * FROM USER_INDEXES WHERE LOWER (table_name)='tabla_vista';

CREATE INDEX idx_nom_tab ON tabla_vista(nombre);

CREATE SEQUENCE autoincrement;

    SELECT autoincrement.NEXTVAL FROM USER_INDEXES;
    
    SELECT autoincrement.NEXTVAL FROM dual;
    
    SELECT autoincrement.CURRVAL FROM dual;
    
    CREATE TABLE tabla_sencilla (
        idx NUMBER PRIMARY KEY
    );
        
    INSERT INTO tabla_sencilla(idx) VALUES (autoincrement.NEXTVAL);
    SELECT * FROM tabla_sencilla;
    
    
    
    
    
    
