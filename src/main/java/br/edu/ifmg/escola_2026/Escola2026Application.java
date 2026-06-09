package br.edu.ifmg.escola_2026;

import br.edu.ifmg.escola_2026.entities.Role;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class Escola2026Application {

	public static void main(String[] args) {
		Role perfil = new Role(1L, "Perfil 1");
		Role perfil1 = new Role("Perfil 1");

		SpringApplication.run(Escola2026Application.class, args);
	}

}
