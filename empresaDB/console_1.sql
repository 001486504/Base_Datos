/*1. Consulta de Proyectos:
¿Cuáles son los identificadores y nombres de todos los proyectos existentes en la empresa?*/
SELECT IDProyecto, NombreProyecto
FROM Proyecto;

/*2. Consulta de Proyectos por Ubicación:
¿Cuáles son los proyectos que se desarrollan en 'CHICAGO'?*/

SELECT IDProyecto, NombreProyecto, P.Ubicacion
FROM Proyecto P
WHERE P.Ubicacion IN ('CHICAGO');

/*3. Consulta de Proyectos por Departamento:
¿Cuáles son los proyectos que pertenecen al departamento con identificador 2?*/
SELECT NombreProyecto, P.IDDepartamento
FROM Proyecto P
WHERE P.IDDepartamento IN ('2');


/*4. Consulta de Proyectos y Departamentos:
¿Cuáles son los nombres y ubicaciones de los proyectos junto con los
nombres de sus departamentos asociados?*/
SELECT P.NombreProyecto, P.Ubicacion, D.NombreDepartamento
FROM Proyecto P
JOIN Departamento D on P.IDDepartamento = D.IDDepartamento;

/*5. Consulta de Empleados por Proyecto:
¿Qué empleados están asignados al proyecto identificado con el número
4, y cuáles son sus nombres?*/
SELECT E.IDEmpleado, EP.IDProyecto, E.NombreEmpleado
FROM Empleado E
JOIN EmpleadoProyecto EP on E.IDEmpleado = EP.IDEmpleado
WHERE EP.IDProyecto IN ('4');


/*6. Consulta de Proyectos por Empleado:
¿En qué proyectos está participando el empleado con el identificador 10,
y cuáles son los nombres de esos proyectos?*/
SELECT E.IDEmpleado, P.NombreProyecto
FROM Empleado E
JOIN EmpleadoProyecto EP on E.IDEmpleado = EP.IDEmpleado
JOIN Proyecto P ON EP.IDProyecto = P.IDProyecto
WHERE E.IDEmpleado IN ('10');


/*7. Consulta de Horas Trabajadas por Proyecto:
¿Cuántas horas han trabajado en total los empleados en el proyecto con
identificador 2?*/
SELECT HorasTrabajadas, IDProyecto
FROM EmpleadoProyecto
WHERE IDProyecto IN ('2');


/*8. Consulta de Empleados con Horas Trabajadas:
¿Cuáles son los empleados que han trabajado más de 10 horas en el
proyecto con identificador 2?*/
SELECT EP.HorasTrabajadas, P.IDProyecto
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
JOIN Proyecto P ON EP.IDProyecto = P.IDProyecto
WHERE P.IDProyecto IN ('2') AND EP.HorasTrabajadas > 10;

/*9. Consulta de Total de Horas por Empleado:
¿Cuál es el total de horas trabajadas por cada empleado en todos
los proyectos?*/
SELECT SUM(HorasTrabajadas)
FROM EmpleadoProyecto;

/*10. Consulta de Empleados con Múltiples Proyectos:
¿Cuáles son los empleados que trabajan en más de un proyecto?*/
SELECT E.NombreEmpleado, EP.IDEmpleado, P.IDProyecto
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
JOIN Proyecto P ON EP.IDProyecto = P.IDProyecto;


/*11. Consulta de Empleados y Horas Totales:
¿Cuáles son los empleados que han trabajado más de 30 horas en
total en todos los proyectos?*/
SELECT E.IDEmpleado, E.NombreEmpleado, SUM(EP.HorasTrabajadas)
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
GROUP BY E.IDEmpleado, E.NombreEmpleado
HAVING COUNT(EP.IDProyecto) > 1 AND SUM(EP.HorasTrabajadas) > 30;

/*12. Consulta de Proyectos y Horas Promedio:
¿Cuál es el promedio de horas trabajadas por proyecto?*/
SELECT P.IDProyecto, P.NombreProyecto, AVG(EP.HorasTrabajadas) AS MediadeHorasTrabajadas
FROM Proyecto P
JOIN EmpleadoProyecto EP ON P.IDProyecto = EP.IDProyecto
GROUP BY P.IDProyecto, P.NombreProyecto
HAVING COUNT(EP.IDProyecto) > 0 ;

-------------------------------------------------------------------
-------------------------------------------------------------------
/*Pregunta
1: Empleados en Proyectos Específicos y con Salario Alto
¿Cuáles son los empleados que trabajan en proyectos ubicados en 'CHICAGO' y que tienen
un salario (con o sin comisión) superior a 2000?*/
SELECT E.IDEmpleado, E.NombreEmpleado, E.Salario, E.Comision, P.NombreProyecto
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = E.IDEmpleado--<----------
JOIN Proyecto P ON EP.IDProyecto = P.IDProyecto
WHERE P.Ubicacion = 'CHICAGO' AND (E.Salario + coalesce(E.Comision, 0) > 2000);
--Profesor en la linea 102 cambie "E.IDEmpleado para q salga pero con rpeticion"-


/*Pregunta
  2: Empleados con Jefe y en Proyectos Múltiples
¿Cuáles son los empleados que tienen un jefe, están asignados a más de un proyecto,
y han trabajado más de 15 horas en total en todos los proyectos combinados?*/
SELECT E.IDEmpleado, E.NombreEmpleado, SUM(EP.HorasTrabajadas) AS TotalHorasTrabajadas
FROM Empleado E
JOIN EmpleadoProyecto EP ON E.IDEmpleado = EP.IDEmpleado
WHERE E.IDJefe IS NOT NULL----------->(Para encontrar los que NO estan vacios)
GROUP BY E.IDEmpleado, E.NombreEmpleado
HAVING COUNT(EP.IDProyecto) > 1 AND SUM(EP.HorasTrabajadas) > 15;

/*Pregunta
  3: Empleados sin Comisión en Departamentos Específicos
  ¿Cuáles son los empleados que no reciben comisión y trabajan en departamentos
  ubicados en 'DALLAS' o 'NEW YORK'?*/
SELECT E.IDEmpleado, E.NombreEmpleado, E.Comision, D.NombreDepartamento
FROM Empleado E
JOIN Departamento D ON E.IDDepartamento = D.IDDepartamento-->(Nos ayuda a integrar otra tabla)
WHERE E.Comision  IS NULL ----->(para encontrar los que no tengan comision)

