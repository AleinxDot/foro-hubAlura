-- =========================================
-- Creación de tablas para ForoHub (MySQL)
-- =========================================

CREATE TABLE curso (
                       id BIGINT AUTO_INCREMENT PRIMARY KEY,
                       nombre VARCHAR(255) NOT NULL,
                       categoria VARCHAR(255) NOT NULL
);

CREATE TABLE usuario (
                         id BIGINT AUTO_INCREMENT PRIMARY KEY,
                         nombre VARCHAR(255) NOT NULL,
                         correo_electronico VARCHAR(255) UNIQUE NOT NULL,
                         contrasena VARCHAR(255) NOT NULL
);

CREATE TABLE perfil (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        nombre VARCHAR(255) NOT NULL
);

CREATE TABLE topico (
                        id BIGINT AUTO_INCREMENT PRIMARY KEY,
                        titulo VARCHAR(255) NOT NULL,
                        mensaje TEXT NOT NULL,
                        fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                        status VARCHAR(50) NOT NULL,
                        autor_id BIGINT NOT NULL,
                        curso_id BIGINT NOT NULL,
                        CONSTRAINT fk_topico_usuario FOREIGN KEY (autor_id) REFERENCES usuario(id),
                        CONSTRAINT fk_topico_curso FOREIGN KEY (curso_id) REFERENCES curso(id)
);

CREATE TABLE respuesta (
                           id BIGINT AUTO_INCREMENT PRIMARY KEY,
                           mensaje TEXT NOT NULL,
                           fecha_creacion TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                           autor_id BIGINT NOT NULL,
                           topico_id BIGINT NOT NULL,
                           solucion BOOLEAN DEFAULT FALSE,
                           CONSTRAINT fk_respuesta_usuario FOREIGN KEY (autor_id) REFERENCES usuario(id),
                           CONSTRAINT fk_respuesta_topico FOREIGN KEY (topico_id) REFERENCES topico(id)
);

CREATE TABLE usuario_perfil (
                                usuario_id BIGINT NOT NULL,
                                perfil_id BIGINT NOT NULL,
                                PRIMARY KEY (usuario_id, perfil_id),
                                CONSTRAINT fk_usuario_perfil_usuario FOREIGN KEY (usuario_id) REFERENCES usuario(id),
                                CONSTRAINT fk_usuario_perfil_perfil FOREIGN KEY (perfil_id) REFERENCES perfil(id)
);
