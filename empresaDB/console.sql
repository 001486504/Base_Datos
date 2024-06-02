-- Crear tabla Departamento
CREATE TABLE Departamento (
                              IDDepartamento INTEGER PRIMARY KEY AUTOINCREMENT,
                              NombreDepartamento TEXT NOT NULL,
                              Ubicacion TEXT NOT NULL
);

-- Crear tabla Empleado
CREATE TABLE Empleado (
                          IDEmpleado INTEGER PRIMARY KEY AUTOINCREMENT,
                          NombreEmpleado TEXT NOT NULL,
                          Puesto TEXT NOT NULL,
                          IDJefe INTEGER,
                          FechaContratacion TEXT NOT NULL,
                          Salario REAL NOT NULL,
                          Comision REAL,
                          IDDepartamento INTEGER NOT NULL,
                          FOREIGN KEY (IDJefe) REFERENCES Empleado(IDEmpleado),
                          FOREIGN KEY (IDDepartamento) REFERENCES Departamento(IDDepartamento)
);

-- Crear tabla Proyecto
CREATE TABLE Proyecto (
                          IDProyecto INTEGER PRIMARY KEY AUTOINCREMENT,
                          NombreProyecto TEXT NOT NULL,
                          Ubicacion TEXT NOT NULL,
                          IDDepartamento INTEGER NOT NULL,
                          FOREIGN KEY (IDDepartamento) REFERENCES Departamento(IDDepartamento)
);

-- Crear tabla EmpleadoProyecto
CREATE TABLE EmpleadoProyecto (
                                  IDEmpleado INTEGER NOT NULL,
                                  IDProyecto INTEGER NOT NULL,
                                  HorasTrabajadas INTEGER NOT NULL,
                                  PRIMARY KEY (IDEmpleado, IDProyecto),
                                  FOREIGN KEY (IDEmpleado) REFERENCES Empleado(IDEmpleado),
                                  FOREIGN KEY (IDProyecto) REFERENCES Proyecto(IDProyecto)
);

-- Insertar registros en la tabla Departamento
INSERT INTO Departamento (NombreDepartamento, Ubicacion) VALUES ('ACCOUNTING', 'NEW YORK');
INSERT INTO Departamento (NombreDepartamento, Ubicacion) VALUES ('RESEARCH', 'DALLAS');
INSERT INTO Departamento (NombreDepartamento, Ubicacion) VALUES ('SALES', 'CHICAGO');
INSERT INTO Departamento (NombreDepartamento, Ubicacion) VALUES ('OPERATIONS', 'BOSTON');

-- Insertar registros en la tabla Empleado sin jefes
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('KING', 'PRESIDENT', NULL, '1981-11-17', 5000, NULL, 1);

-- Insertar registros en la tabla Empleado con jefes ya insertados
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('JONES', 'MANAGER', 1, '1981-04-02', 2975, NULL, 2);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('BLAKE', 'MANAGER', 1, '1981-05-01', 2850, NULL, 3);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('CLARK', 'MANAGER', 1, '1981-06-09', 2450, NULL, 1);

-- Insertar registros en la tabla Empleado con jefes ya insertados
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('SCOTT', 'ANALYST', 2, '1987-04-19', 3000, NULL, 2);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('FORD', 'ANALYST', 2, '1981-12-03', 3000, NULL, 2);

-- Insertar registros en la tabla Empleado con jefes ya insertados
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('SMITH', 'CLERK', 3, '1980-12-17', 800, NULL, 2);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('ALLEN', 'SALESMAN', 4, '1981-02-20', 1600, 300, 3);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('WARD', 'SALESMAN', 4, '1981-02-22', 1250, 500, 3);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('MARTIN', 'SALESMAN', 4, '1981-09-28', 1250, 1400, 3);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('TURNER', 'SALESMAN', 4, '1981-09-08', 1500, 0, 3);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('ADAMS', 'CLERK', 5, '1987-05-23', 1100, NULL, 2);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('JAMES', 'CLERK', 4, '1981-12-03', 950, NULL, 3);
INSERT INTO Empleado (NombreEmpleado, Puesto, IDJefe, FechaContratacion, Salario, Comision, IDDepartamento) VALUES ('MILLER', 'CLERK', 6, '1982-01-23', 1300, NULL, 1);

-- Insertar registros en la tabla Proyecto
INSERT INTO Proyecto (NombreProyecto, Ubicacion, IDDepartamento) VALUES ('P1', 'BOSTON', 2);
INSERT INTO Proyecto (NombreProyecto, Ubicacion, IDDepartamento) VALUES ('P4', 'CHICAGO', 3);
INSERT INTO Proyecto (NombreProyecto, Ubicacion, IDDepartamento) VALUES ('P5', 'CHICAGO', 3);
INSERT INTO Proyecto (NombreProyecto, Ubicacion, IDDepartamento) VALUES ('P6', 'LOS ANGELES', 3);
INSERT INTO Proyecto (NombreProyecto, Ubicacion, IDDepartamento) VALUES ('P8', 'NEW YORK', 3);

-- Insertar registros en la tabla EmpleadoProyecto
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (8, 2, 15);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (8, 3, 12);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (9, 2, 10);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (9, 5, 8);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (10, 1, 16);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (10, 4, 15);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (10, 5, 5);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (11, 3, 6);
INSERT INTO EmpleadoProyecto (IDEmpleado, IDProyecto, HorasTrabajadas) VALUES (12, 1, 4);
