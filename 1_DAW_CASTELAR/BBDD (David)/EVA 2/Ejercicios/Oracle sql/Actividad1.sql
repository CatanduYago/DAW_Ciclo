    CREATE TABLE coches (
       mat_coches CHAR(8) PRIMARY KEY,
       marca CHAR(15),
       an_fab CHAR(2)
    );
    
    CREATE TABLE mecanicos (
       dni CHAR(9) PRIMARY KEY,
       nombre CHAR(15),
       puesto CHAR(15),   
       parcial CHAR(1)
    );
    
    CREATE TABLE trabajos (
       mat CHAR (8) CONSTRAINT mat REFERENCES coches(mat_coches),
       dni CHAR(9),
       horas CHAR(9) CHECK (horas>0.5),
       fecha_rep DATE
    );
    