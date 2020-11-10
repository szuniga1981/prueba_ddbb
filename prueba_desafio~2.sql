create table factura
(
    numero_factura int,
    numero_cliente int,
    fecha DATE,
    primary key (numero_factura)
    );
    
    create table desc_item
    (
    id_descripcion number,
    descripcion varchar2 (50),
    PRIMARY KEY (id_descripcion)
    );
    
    create table cat_item
    (
    id_categoria number,
    nombre_categoria varchar2(50),
    valor_neto number,
    precio_unitario int,
    id_descripcion int,    
    primary key (id_categoria),foreign key (id_descripcion)REFERENCES desc_item(id_descripcion)
    );
    
create table item
(
    id_producto number,
    nombre_producto varchar2(50),
    id_categoria number,
    primary key (id_producto),
    foreign key (id_categoria)REFERENCES cat_item(id_categoria)
    );
    
    create table factura_item
    (
    numero_factura int,
    id_producto number,
    foreign key(numero_factura)REFERENCES factura (numero_factura),
    foreign key (id_producto)REFERENCES item (id_producto)
    );
        
    create table ciudad
    (
    id_ciudad number,
    nombre_ciudad varchar2(50),
    primary key (id_ciudad)
    );
    
    create table comuna
    (
    id_comuna number,
    nombre_comuna VARCHAR2(50),
    id_ciudad number,
    primary key (id_comuna),
    foreign key (id_ciudad)REFERENCES ciudad (id_ciudad)
    );
    
    create table cliente
    (
    numero_cliente int,
    nombre varchar2(50),
    rut number,
    direccion VARCHAR2(50),
    csf number,
    id_comuna number,
    primary key (numero_cliente),
    foreign key (id_comuna) REFERENCES comuna (id_comuna)
    );
    
    alter table factura
    ADD FOREIGN KEY (numero_cliente) REFERENCES cliente(numero_cliente);
    
    
    SELECT * FROM factura,cliente,item ;
    
   -- ALTER TABLE cat_itemDROP COLUMN valor_neto;
 --ALTER TABLE cat_itemDROP COLUMN precio_unitario;
 
  SELECT * FROM item ;
 --ALTER TABLE item ADD valor_neto number;
 --ALTER TABLE item ADD precio_unitario int;
 
 select * from factura;
 select * from cliente;
 
 insert into factura(numero_factura,numero_cliente,fecha)VALUES(
 
 select numero_facura,numero_cliente,id_producto from factura,factura_item,item where
 