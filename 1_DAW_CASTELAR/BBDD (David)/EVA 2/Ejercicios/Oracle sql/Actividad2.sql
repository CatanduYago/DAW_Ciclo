CREATE TABLE Libro (
    autor VARCHAR(20),
    titulo VARCHAR2(10),
    editor VARCHAR2(20), 
    clase  CONSTRAINT clasee REFERENCES Clase(clave),
    prestado NUMBER(1) DEFAULT 1
);
CREATE TABLE Usuario (
    secuencia number PRIMARY KEY,
    nombre VARCHAR2(20),
    direccion VARCHAR(10),
    fecha_ingreso DATE,
    clase NUMBER CONSTRAINT clase REFERENCES Clase(clave)
);
CREATE TABLE Clase(
    clave INT PRIMARY KEY ,
    planta INT,
    tiempo_de_prestamo DATE NOT NULL
);
CREATE TABLE Prestamo (
    codigo NUMBER,
    secuencia NUMBER CONSTRAINT ct_fk_secuencia REFERENCES Usuario(secuencia),
    fecha_inicio DATE,
    CONSTRAINT ct_pk_codsecfec PRIMARY KEY (codigo,secuencia,fecha_inicio),
    CONSTRAINT ct_fk_cod_pres FOREIGN KEY (codigo) REFERENCES libro(codigo)
    );
ALTER TABLE usuario ADD sexo CHAR(1);
DESCRIBE usuario;
ALTER TABLE libro ADD indice NUMBER;
ALTER TABLE uduario MODIFY nombre NOT NULL;
RENAME clase TO clase_nueva;
ALTER TABLE prestamo ADD cuantia NUMBER(*,2);
SELECT * FROM all_contraints WHERE table_name='USUARIO';
ALTER TABLE usuario DROP PRIMARY KEY CASCADE;
DROP TABLE Usuario;