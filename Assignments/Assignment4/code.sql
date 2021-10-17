SELECT AVG(X), AVG(Y), AVG(Z)
FROM POINT;


CREATE TABLE ROTATE (col1 FLOAT, col2 FLOAT, r INT);

INSERT INTO ROTATE
VALUES (cos(a), -sin(a), 0);
INSERT INTO ROTATE
VALUES (sin(a), cos(a), 1);

CREATE TABLE ROTATED (X FLOAT, Y FLOAT, Z FLOAT);

INSERT INTO ROTATED (X)
VALUES
    (SELECT P.X * R.col1 + P.Y * R.col2
     FROM ROTATE AS R, POINT AS P
     WHERE R.r = 0)
INSERT INTO ROTATED (Y)
VALUES
    (SELECT P.X * R.col1 + P.Y * R.col2
     FROM ROTATE AS R, POINT AS P
     WHERE R.r = 1)
INSERT INTO ROTATED (Z)
VALUES
    (SELECT Z
     FROM POINT)
