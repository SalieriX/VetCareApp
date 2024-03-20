-- Crear tabla Especies
CREATE TABLE Especies (
    ID_especie INT(2) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);

-- Crear tabla Razas
CREATE TABLE Razas (
    ID_raza INT(4) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    ID_especie INT(2) NOT NULL,
    CONSTRAINT fk_especie_raza FOREIGN KEY (ID_especie) REFERENCES Especies(ID_especie)
);

-- Crear tabla Veterinarios
CREATE TABLE Usuarios (
    ID_usuario INT(5) PRIMARY KEY,
    Nombre_usuario VARCHAR(30) NOT NULL,
    Contraseña VARCHAR(300) NOT NULL,
    Administrador TINYINT(1)
);

CREATE TABLE Personas (
    nit BIGINT(16) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Apellido1 VARCHAR(50) NOT NULL,
    Apellido2 VARCHAR(50),
    Telefono BIGINT(15) NOT NULL,
    Direccion VARCHAR(100) NOT NULL,
    Correo_electronico VARCHAR(100),
    ID_usuario_Persona INT(5),
    CONSTRAINT fk_veterinarios_usuarios FOREIGN KEY (ID_usuario_Persona) REFERENCES Usuarios(ID_usuario)
);

-- Crear tabla Mascotas
CREATE TABLE Mascotas (
    ID_Mascota BIGINT(16) PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL,
    Edad INT(3) NOT NULL,
    Nit_Cliente BIGINT(16) NOT NULL,
    ID_raza INT(4) NOT NULL,
    CONSTRAINT fk_cliente_mascota FOREIGN KEY (Nit_Cliente) REFERENCES Personas(nit),
    CONSTRAINT fk_raza_mascota FOREIGN KEY (ID_raza) REFERENCES Razas(ID_raza)
);

-- Crear tabla Citas
CREATE TABLE Citas (
    ID_cita INT(10) PRIMARY KEY,
    ID_mascota  BIGINT(16) NOT NULL,
    ID_veterinario INT(5) NOT NULL,
    Fecha DATETIME NOT NULL,    
    Razon_cita VARCHAR(200) NOT NULL,
    Diagnostico_cita VARCHAR(200) NOT NULL,
    CONSTRAINT fk_mascota_cita FOREIGN KEY (ID_mascota) REFERENCES Mascotas(ID_Mascota),
    CONSTRAINT fk_veterinario_cita FOREIGN KEY (ID_veterinario) REFERENCES Personas(nit)
);
