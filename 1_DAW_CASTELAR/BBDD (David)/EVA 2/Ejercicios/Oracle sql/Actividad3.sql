CREATE TABLE libro(
    ISBN NUMBER(20) PRIMARY KEY,
    Titulo VARCHAR2(10), 
    Editorial VARCHAR2(10),
    NºPaginas NUMBER
);

CREATE TABLE socios(
    DNI VARCHAR2(9) PRIMARY KEY,
    Nombre VARCHAR2(10),
    FNacimiento DATE,
    Provincia VARCHAR2(10) CONSTRAINT ct_ck_pro_sooc CHECK (provincia IN ('Almeria','Córdoba','Málaga', 'Granada'))
);

CREATE TABLE prestamos(
    FechaPrestamo DATE,
    FechaDevolucion DATE,
    Devuelto CHAR(1),
    ISBN NUMBER,
    DNI VARCHAR2(10),
    CONSTRAINT ct_pk_isbndni_prest PRIMARY KEY (ISBN,DNI),
    CONSTRAINT ct_fk_isbn_prest FOREIGN KEY (ISBN) REFERENCES libro(ISBN),
    CONSTRAINT ct_fk_dni_prest FOREIGN KEY (DNI) REFERENCES socioS(DNI),
    CONSTRAINT ct_ck_dev_prest CHECK (devuelto IN ('S','N'))
);

INSERT INTO prestamos (FechaPrestamo,FechaDevolucion,Devuelto,ISBN,DNI) VALUES ('010101','01/01/01','S',100,'111A');

ALTER TABLE prestamos DISABLE CONSTRAINT ct_fk_isbn_prest;
ALTER TABLE prestamos DISABLE CONSTRAINT ct_fk_dni_prest;

SELECT * FROM prestamos;