CREATE TABLE perfil (
                        id BIGINT NOT NULL AUTO_INCREMENT,
                        nome VARCHAR(255),
                        PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE usuario (
                         id BIGINT NOT NULL AUTO_INCREMENT,
                         nome VARCHAR(255),
                         telefone VARCHAR(255),
                         email VARCHAR(255),
                         senha VARCHAR(255),
                         criado_em TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
                         atualizado_em TIMESTAMP NULL DEFAULT NULL,
                         PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE usuario_perfil (
                                id_usuario BIGINT NOT NULL,
                                id_perfil BIGINT NOT NULL,
                                PRIMARY KEY (id_usuario, id_perfil)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE usuario_perfil
    ADD CONSTRAINT FK_usuario_perfil_perfil
        FOREIGN KEY (id_perfil) REFERENCES perfil(id);

ALTER TABLE usuario_perfil
    ADD CONSTRAINT FK_usuario_perfil_usuario
        FOREIGN KEY (id_usuario) REFERENCES usuario(id);

INSERT INTO perfil (nome) VALUES ('ROLE_ADMINISTRADOR');
INSERT INTO perfil (nome) VALUES ('ROLE_PROFESSOR');
INSERT INTO perfil (nome) VALUES ('ROLE_ALUNO');

INSERT INTO usuario (nome, telefone, email, senha)
VALUES ('bruno', '3799122-2222', 'bruno.ferreira@gmail.com', '123456');

INSERT INTO usuario (nome, telefone, email, senha)
VALUES ('maria', '373322-2222', 'maria@gmail.com', '123456');

INSERT INTO usuario_perfil (id_usuario, id_perfil) VALUES (1, 1);
INSERT INTO usuario_perfil (id_usuario, id_perfil) VALUES (1, 2);
INSERT INTO usuario_perfil (id_usuario, id_perfil) VALUES (1, 3);
INSERT INTO usuario_perfil (id_usuario, id_perfil) VALUES (2, 3);