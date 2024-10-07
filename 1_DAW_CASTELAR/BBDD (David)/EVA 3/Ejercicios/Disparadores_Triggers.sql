
CREATE SCHEMA COMERCIO;

USE COMERCIO;

CREATE TABLE departamentos(
cod_dep VARCHAR(5) PRIMARY KEY ,
nombre_dpt VARCHAR(15),
presupuesto INT
);

CREATE TABLE empleados (
nss INT PRIMARY KEY,
nombre VARCHAR(20),
salario INT,
cod_dep VARCHAR(5)
);

INSERT INTO departamentos VALUES('001','RRHH',0);
-- 1
DELIMITER &
DROP TRIGGER IF EXISTS dp_insert_empleado&
CREATE TRIGGER dp_insert_empleado
		AFTER INSERT ON empleados
        FOR EACH ROW
        BEGIN 
        UPDATE departamentos SET presupuesto = presupuesto + NEW.salario WHERE cod_dep = NEW.cod_dep;
		END
        &
DELIMITER ;

SELECT * FROM departamentos;
SET sql_safe_updates = 0;
INSERT INTO empleados VALUES(239843,'Ramon',3000, '001');
SELECT * FROM departamentos;
SELECT * FROM empleados;


DELIMITER &
DROP TRIGGER IF EXISTS dp_modif_empleado&
CREATE TRIGGER dp_modif_empleado
		AFTER UPDATE ON empleados
        FOR EACH ROW
        BEGIN 
        UPDATE departamentos SET presupuesto = (presupuesto - OLD.salario) + NEW.salario WHERE cod_dep = NEW.cod_dep;
		END
        &
DELIMITER ;
SELECT * FROM departamentos;
UPDATE empleados SET salario = 3000 WHERE nombre = 'Ramon';
SELECT * FROM departamentos;
SELECT * FROM empleados;



-- 2

CREATE SCHEMA BANCO1;

USE BANCO1;

CREATE TABLE Cuentas (
n_cuenta VARCHAR (10) PRIMARY KEY,
saldo INT
);

CREATE TABLE Movimientos (
n_cuenta VARCHAR(10) PRIMARY KEY,
hora_modificacion DATE,
id_cliente VARCHAR(10),
saldo_ante INT,
saldo_actual INT
);

DELIMITER &
DROP TRIGGER IF EXISTS dp_actu_Movi&
CREATE TRIGGER dp_actu_Movi
		AFTER UPDATE ON Cuentas.saldo
        FOR EACH ROW
        BEGIN 
            IF OLD.salario != NEW.salario THEN
			UPDATE movimientos SET saldo_actual = saldo_actual + NEW.saldo;
			UPDATE movimientos SET saldo_ante = OLD.saldo_actual;
		END IF;
		END
		&
DELIMITER ;

DELIMITER &
DROP TRIGGER IF EXISTS dp_actu_Cuentas&
CREATE TRIGGER dp_actu_Cuentas
		AFTER UPDATE ON Cuentas.saldo
        FOR EACH ROW
        BEGIN 
            IF NEW.salario < 0 THEN
			UPDATE cuentas SET saldo = 0;
            ELSEIF NEW.salario > 1000 THEN
            UPDATE cuentas SET saldo = 1000;
		END IF;
		END
		&
DELIMITER ;

-- 3

CREATE SCHEMA ASOCIACION;

USE ASOCIACION;

CREATE TABLE Socio (
num_soc);